import fs from "fs/promises";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

type FunctionDeclaration = {
  name: string;
  params: string;
  signature: string;
  docLines: string[];
  body: string;
  startLine: number;
};

function isInternalFunction(f: FunctionDeclaration) {
  return /^[a-z_]/.test(f.name);
}

function unwrapFunctionDocumentationCategory(docInfo: FunctionDocumentation): string | null | undefined {
  return docInfo.category && docInfo.category.trim() !== "" 
    ? docInfo.category.trim() : undefined;
}

type FunctionDocumentation = {
  description?: string;
  params?: {
    name: string;
    desc: string;
  }[];
  returns?: string;
  example?: string;
  category?: string;
  deprecated?: string;
  experimental?: boolean;
  internal?: boolean;
};

async function main() {
  const repoRoot = path.resolve(__dirname, "..");
  const ahkPath = path.join(repoRoot, "SAMP.ahk");
  const baseOutDir = path.join(repoRoot, "docs", "docs", "functions");

  // Ensure category folders exist and add _category_.json files so Docusaurus shows them
  const internalDir = path.join(baseOutDir, "Internal");
  await fs.mkdir(internalDir, { recursive: true });
  // parent category
  await fs.mkdir(baseOutDir, { recursive: true });
  await writeCategoryIfMissing(baseOutDir, { label: "Functions", position: 3 });
  await writeCategoryIfMissing(internalDir, { label: "Internal", position: 2 });

  const content = await fs.readFile(ahkPath, "utf8");
  const funcs = parseAHKFunctions(content);

  // no single outDir; files will be placed into Public/ and Internal/ subfolders

  for (const f of funcs) {
    // TODO optimize so we don't parse doc lines multiple times
    const docInfo = parseDocLines(f.docLines);
    const isInternal = isInternalFunction(f) || docInfo.internal === true;
    const specifiedCategory = unwrapFunctionDocumentationCategory(docInfo);

    let targetDir: string;
    if (specifiedCategory) {
      targetDir = path.join(baseOutDir, specifiedCategory);
      await fs.mkdir(targetDir, { recursive: true });
      await writeCategoryIfMissing(targetDir, { label: specifiedCategory });
    } else if (isInternal) {
      targetDir = internalDir;
    } else {
      // public functions go to the root functions folder (flattened)
      targetDir = baseOutDir;
    }

    const fileName = makeSafeFilename(f.name, targetDir);
    let md = renderMarkdown(f);
    await fs.writeFile(path.join(targetDir, fileName), md, "utf8");
    const rel = path.relative(baseOutDir, path.join(targetDir, fileName));
    console.log("Wrote:", rel);
  }

  console.log(`Generated ${funcs.length} docs into ${baseOutDir}`);
}

function parseAHKFunctions(content: string): FunctionDeclaration[] {
  const lines = content.split(/\r?\n/);
  const funcs: FunctionDeclaration[] = [];

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    // func signature like: FuncName(param1, param2) {
    // avoid matching common control keywords (if/for/while/etc.) as function names
    const sigMatch = line.match(/^\s*(?!(?:if|for|while|else|switch|try|catch|loop|return|case)\b)([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)\s*\{/);
    if (!sigMatch) continue;

    const name = sigMatch[1];
    const params = sigMatch[2].trim();
    // remove trailing opening brace from signature (e.g. "MyFunc(a, b) {" -> "MyFunc(a, b)")
    const rawSignature = lines[i].trim();
    const signature = rawSignature.replace(/\s*\{\s*$/, "");

    // Capture full body by matching braces
    let braceCount = (line.match(/\{/g) || []).length - (line.match(/\}/g) || []).length;
    let bodyLines: string[] = [lines[i]];
    let j = i + 1;
    while (j < lines.length && braceCount > 0) {
      const l = lines[j];
      braceCount += (l.match(/\{/g) || []).length;
      braceCount -= (l.match(/\}/g) || []).length;
      bodyLines.push(l);
      j++;
    }

    // Collect contiguous comment lines immediately above the function
    const docLines: string[] = [];
    let k = i - 1;
    // allow blank lines between comment lines but stop when encountering code
    while (k >= 0) {
      const trimmed = lines[k].trim();
      if (trimmed === "") {
        // if docLines already collected, allow a single blank; else skip
        if (docLines.length > 0) {
          docLines.unshift("");
          k--;
          continue;
        } else {
          k--;
          continue;
        }
      }

      // support /* ... */ block comments immediately above the function
      if (trimmed.endsWith("*/")) {
        const block: string[] = [];
        let m = k;
        // collect lines until start of block
        while (m >= 0) {
          block.unshift(lines[m]);
          if (lines[m].includes("/*")) break;
          m--;
        }
        // normalize block: remove /* and */ markers and leading '*' on each line
        if (block.length > 0) {
          // strip leading part up to /* on first
          if (block[0].includes("/*")) {
            const idx = block[0].indexOf("/*");
            block[0] = block[0].slice(idx + 2);
          }
          // strip trailing */ on last
          const lastIdx = block.length - 1;
          if (block[lastIdx].includes("*/")) {
            const idx = block[lastIdx].lastIndexOf("*/");
            block[lastIdx] = block[lastIdx].slice(0, idx);
          }
          const processed = block.map((ln) => ln.replace(/^\s*\*?\s?/, "").trim());
          // insert processed lines into docLines preserving top-to-bottom order
          for (let t = processed.length - 1; t >= 0; t--) {
            const pl = processed[t];
            if (pl === "") docLines.unshift("");
            else docLines.unshift(pl);
          }
        }
        // move k to before the block
        k = m - 1;
        continue;
      }

      if (/^;/.test(trimmed) || /^\/\//.test(trimmed)) {
        // store without the leading semicolon or //
        docLines.unshift(trimmed.replace(/^;\s?/, "").replace(/^\/\/[\s]?/, ""));
        k--;
        continue;
      }
      break;
    }

    funcs.push({
      name,
      params,
      signature,
      docLines,
      body: bodyLines.join("\n"),
      startLine: i + 1,
    });

    // advance i to j to avoid nested detection
    i = Math.max(i, j - 1);
  }

  return funcs;
}

function makeSafeFilename(name: string, outDir: string) {
  let base = `${name}.md`.replace(/^_+/, ""); // remove leading underscores which hides the file in documentation
  let candidate = base;
  let idx = 1;
  while (fsExistsSync(path.join(outDir, candidate))) {
    candidate = `${name}_${idx}.md`;
    idx++;
  }
  return candidate;
}

async function writeCategoryIfMissing(dir: string, obj: { label: string; position?: number }) {
  const fp = path.join(dir, "_category_.json");
  try {
    await fs.stat(fp);
    return;
  } catch {
    await fs.writeFile(fp, JSON.stringify(obj, null, 2), "utf8");
  }
}

function fsExistsSync(filePath: string) {
  try {
    // using sync here because this helper is called synchronously during name check
    // but keep rest of code async.
    // eslint-disable-next-line no-sync
    return require("fs").existsSync(filePath);
  } catch (e) {
    return false;
  }
}

function renderMarkdown(f: FunctionDeclaration): string {
  const title = f.name;
  const front = `---\ntitle: ${escapeFrontMatter(title)}\n---\n\n`;

  const doc = parseDocLines(f.docLines);
  const specifiedCategory = unwrapFunctionDocumentationCategory(doc);

  let body = "";

  if ((isInternalFunction(f) || doc.internal === true) && !specifiedCategory) {
    body += `:::danger[Internal API]\n\nThis method is internal and may change or be removed 
    without notice in the future. Use at your own risk.\n\n:::\n\n`;
  }

  if (doc.deprecated) {
    body += `:::warning[Function Deprecated]\n\n${doc.deprecated}\n\n:::\n\n`;
  }

  if (doc.experimental) {
    body += `:::experimental\n\nThis function is experimental and its implementation may involve 
    breaking changes or deprecation, or may not be tested throughly. Use at your own risk.\n\n:::\n\n`;
  }

  if (doc.description) {
    body += `${doc.description}\n\n`;
  }

  if (doc.params && doc.params.length) {
    body += `**Parameters:**\n\n`;
    for (const p of doc.params) {
      body += `- **${p.name}**: ${p.desc}\n`;
    }
    body += `\n`;
  }

  if (doc.returns) {
    body += `**Returns:** ${doc.returns}\n\n`;
  }

  if (doc.example) {
    body += `**Example:**\n\n`;
    body += "```ahk\n" + doc.example + "\n```\n\n";
  }

  body += `**Signature:**\n\n`;
  body += "```ahk\n" + f.signature + "\n```\n";

  return front + body;
}

function escapeFrontMatter(s: string) {
  return s.replace(/"/g, '\\"');
}

function parseDocLines(lines: string[]): FunctionDocumentation {
  const result: FunctionDocumentation = {};
  if (!lines || lines.length === 0) return result;

  const params: { name: string; desc: string }[] = [];
  let curExampleLines: string[] = [];
  let inExample = false;

  // join lines and process @tags
  for (let i = 0; i < lines.length; i++) {
    const l = lines[i].replace(/^\s+/, "");
    const tagMatch = l.match(/^@(\w+)\s*(.*)/);
    if (tagMatch) {
      const tag = tagMatch[1];
      const rest = tagMatch[2] || "";
      if (tag === "param") {
        const m = rest.match(/^(\S+)\s*(.*)/);
        if (m) {
          params.push({ name: m[1], desc: m[2].trim() });
        }
        inExample = false;
        continue;
      }
      if (tag === "internal") {
        result.internal = true;
        inExample = false;
        continue;
      }
      if (tag === "category") {
        result.category = rest.trim();
        inExample = false;
        continue;
      }
      if (tag === "deprecated") {
        result.deprecated = rest.trim();
        inExample = false;
        continue;
      }
      if (tag === "experimental") {
        result.experimental = true;
        inExample = false;
        continue;
      }
      if (tag === "returns" || tag === "return") {
        result.returns = rest.trim();
        inExample = false;
        continue;
      }
      if (tag === "example") {
        inExample = true;
        curExampleLines.push(rest);
        continue;
      }
      // unknown tag: ignore for now
      inExample = false;
      continue;
    }

    if (inExample) {
      curExampleLines.push(l);
      continue;
    }
  }

  // description is the leading paragraph up to the first tag
  const firstTagIndex = lines.findIndex((ln) => /^@/.test(ln.trim()));
  const descLines = (firstTagIndex === -1 ? lines : lines.slice(0, firstTagIndex)).filter((x) => x.trim() !== "");
  if (descLines.length) result.description = descLines.join(" \n");
  if (params.length) result.params = params;
  if (curExampleLines.length) result.example = curExampleLines.join("\n");

  return result;
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});

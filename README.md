<div style="text-align:center">
    <h1>SA:MP UDF for AutoHotkey v1.1</h1>
    <p>Native AHK bindings for SA:MP functions</p>
    <p><em>A fork of <a href="https://github.com/SAMP-UDF/SAMP-UDF-for-AutoHotKey">SAMP-UDF-for-AutoHotKey R18</a></em></p>
    <p>
    <img src="https://img.shields.io/badge/AutoHotkey-345?logo=autohotkey&logoColor=fff&style=for-the-badge" alt="AutoHotkey Badge">
    <img src="https://img.shields.io/badge/Docusaurus-3ECC5F?logo=docusaurus&logoColor=fff&style=for-the-badge" href="https://thetruesorata.github.io/samp-udf-autohotkey" alt="Docusaurus Badge">
    <img alt="GitHub Downloads (all assets, all releases)" src="https://img.shields.io/github/downloads/thetruesorata/samp-udf-autohotkey/total?style=for-the-badge">
    <img alt="GitHub Release" src="https://img.shields.io/github/v/release/thetruesorata/samp-udf-autohotkey?display_name=tag&style=for-the-badge">
    </p>
</div>

<hr />

**SA:MP UDF for AHK v1.1** is an AutoHotkey V1.1 32-bit ASCII library that defines functions
interacting natively with SA:MP, a GTA: San Andreas Multiplayer modification **(primarly now for version `0.3.7-R5`)**.

> For documentation, [please visit the documentation website](https://thetruesorata.github.io/samp-udf-autohotkey), which includes detailed description of public API.
>

It hooks into SA:MP, reads useful player information and exposes methods for interacting with
SA:MP. Usually, it can be used to e.g. send chat commands or chat messages without the overhead
of sending key inputs to the game, and to display your custom text in in-game's chat box.

This library is a fork of [SAMP-UDF-for-AutoHotKey R18](https://github.com/SAMP-UDF/SAMP-UDF-for-AutoHotKey) 
developed by (in original order with original sources)

- [Chuck_Floyd](https://github.com/FrozenBrain)
- [Suchty112](https://github.com/Suchty112)
- [paul-phoenix](https://github.com/paul-phoenix)
- [Agrippa1994](https://github.com/agrippa1994)
- [RawDev](https://github.com/SAMPTools/)
- ELon
- [Peek](https://github.com/pkfln)
- [Coderunner](https://github.com/Coderunner2/)

Thanks to them for developing this library!

Their latest version only supports SA:MP versions `0.3.7-R1`, `0.3.7-R2` and `0.3.DL`. This fork adds
support for the latest SA:MP version `0.3.7-R5` at the time of writing.

## Quickstart

- Either download `SAMP.ahk` from latest release or latest revision on `main` branch
- Make sure you have AutoHotkey V1.1 **32-bit ANSI** installed
- Place `SAMP.ahk` next to your AHK file, and use `#include %A_ScriptDir%\SAMP.ahk`
- Take a look at the [docs website](https://thetruesorata.github.io/samp-udf-autohotkey) or `SAMP.ahk` and use the functions you need
- Also, take a look at [`TestKeybinder.ahk`](./TestKeybinder.ahk) as an example
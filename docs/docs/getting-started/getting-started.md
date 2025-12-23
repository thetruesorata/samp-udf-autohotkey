---
sidebar_position: 2
---

# Getting Started

This will show you how to set up AutoHotKey development environment and how to integrate the library
into your keybinder script.

:::info

**This library supports Windows and AutoHotKey v1.1 ANSI 32-bit only**. There's no guarantee that this works under Linux with any Windows emulator.

:::


## Installing AutoHotKey v1.1

You can download the latest AutoHotKey v1.1 [on their official homepage](https://www.autohotkey.com/). Make sure
to click on **Download v1.1 (deprecated)** as **this library does not support AHK > v1.1**.

Then, when running the installer, make sure to select **ANSI 32-bit**.

![AutoHotKey v1.1 Setup Wizard showing ANSI 32-bit as option](./img/autohotkey-v1-1-setup.png)

When the installer completes, you're pretty good to go! When working on your scripts, make sure to use **Windows 1252** (or `Cp1252`) encoding. 
It's not guaranteed that the library works with Unicodes/UTF-8 encodings.

## IDE setup

I used Visual Studio Code with AHK++ plugin for development which works out quite well for me.
If you're interested in the same setup, you can take a look at `.vscode/` folder for recommended
extensions (though not every extension is needed for you).

Anyway, pick whatever you're comfortable with. 😄
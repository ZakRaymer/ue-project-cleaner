# Unreal Engine Project Cleaner

A small Windows batch utility for **cleaning and regenerating Unreal Engine C++ projects**.

## Download

[Download the latest release](https://github.com/ZakRaymer/ue-project-cleaner/releases/latest)

Download `ue_project_clean.bat` and place it in the root of your Unreal project (next to the `.uproject` file).

If you work with **Unreal Engine C++**, you’ve probably done this manually more times than you'd like:

- Delete `Binaries`
- Delete `Intermediate`
- Delete `Saved`
- Regenerate project files
- Reopen the Visual Studio solution

This script automates that entire workflow with a single click.

Cleaning these folders and regenerating project files is one of the most common ways to fix **Unreal Engine C++ build errors**, broken IntelliSense, and strange compile issues.

---

## What It Does

### Clean Unreal build folders safely

The script deletes only folders that Unreal Engine automatically regenerates:

- `Binaries`
- `Intermediate`
- `Saved`

Your **source code, assets, and configuration files are untouched**.

Cleaning these folders is a common fix for many Unreal Engine problems, including:

- Failed C++ builds
- Corrupted build artifacts
- Broken IntelliSense
- Issues after engine upgrades
- Plugin installation problems

---

### Regenerate project files using UnrealBuildTool

The script runs **UnrealBuildTool** to regenerate project files for your `.uproject`.

This refreshes your Visual Studio solution so it matches your current code and engine version.

---

### Optional automation

The script can also:

- Rebuild the Unreal Editor target
- Automatically open the generated Visual Studio solution

This allows you to go from **broken build → clean environment → compiling again** in one step.

---

## Setup

1. Download the `.bat` file from the **Releases** page.
1. Place it in the root of your Unreal project (the same folder as the `.uproject` file).
1. Open the script and configure:
    ```bat
    set UE_VERSION=5.7
    set UE_INSTALL_PATH=C:\Program Files\Epic Games
    set REBUILD_AFTER=true
    set OPEN_SOLUTION_AFTER=true
    ```
1. Double-click the script to clean and regenerate your project.

## License

MIT

---

## Author

**Zak Raymer**  
https://revivedzeal.com
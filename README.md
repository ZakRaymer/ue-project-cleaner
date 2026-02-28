# UE Project Cleaner

A small Windows batch utility for cleaning and regenerating Unreal Engine C++ projects.

If you work with Unreal C++, you’ve probably done this manually more times than you'd like:

* Delete Binaries
* Delete Intermediate
* Delete Saved
* Regenerate project files
* Reopen the solution

This script automates that entire workflow.

## What It Does

* **Safely cleans your project**
Deletes only the generated folders that Unreal recreates:
  * Binaries
  * Intermediate
  * Saved
_Your source code and assets are untouched._
* **Regenerates project files using UnrealBuildTool**
Runs UnrealBuildTool to refresh your Visual Studio solution and project files, ensuring they’re up to date with your current code and engine version.
* **Optional automation**
  * Rebuilds the editor target if you want a fresh build.
  * Opens the solution automatically in Visual Studio so you can jump straight into development.

## Setup

1. Download the .bat file.
1. Place it in the root of your Unreal project (same folder as the .uproject).
1. Open the script and configure:
    ```bat
    set UE_VERSION=5.7
    set UE_INSTALL_PATH=C:\Program Files\Epic Games
    set REBUILD_AFTER=true
    set OPEN_SOLUTION_AFTER=true
    ```
1. Double-click the script.

That’s it.

## Why This Exists

Small friction compounds.

If something annoys you more than twice, automate it.

This script removes a repetitive workflow step and frees up mental space for actual development.

## License

MIT

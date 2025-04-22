# Branch Maker 🚀

A retro-styled terminal tool that helps you generate properly formatted Git branch names from ticket numbers and descriptions.

## Features

- 🎨 Retro ASCII art interface
- 🎯 Automatic branch name formatting
- 🔄 Preserves ticket numbers in uppercase (e.g., QI-11611)
- 📋 Automatic clipboard copying
- 🏷️ Support for feature and bugfix prefixes

## Installation

1. Clone this repository or download the `branch_maker.sh` file
2. Make the script executable:
   ```bash
   chmod +x branch_maker.sh
   ```

## Usage

1. Run the script:
   ```bash
   ./branch_maker.sh
   ```

2. Enter your ticket information when prompted:
   ```
   Enter ticket number and description (e.g., QI-11611 Implement Advanced Sorting Logic):
   ```

3. Choose the branch type:
   ```
   Is this a feature or bugfix? (f/b):
   ```
   - Press `f` for feature
   - Press `b` for bugfix

4. The script will generate a formatted branch name and copy it to your clipboard

## Example

Input:
```
QI-11611 Implement Advanced Sorting Logic for Work History Records
```

Output (if feature selected):
```
feature/QI-11611-implement-advanced-sorting-logic-for-work-history-records
```

## Requirements

- Bash shell
- `pbcopy` (for clipboard functionality on macOS)


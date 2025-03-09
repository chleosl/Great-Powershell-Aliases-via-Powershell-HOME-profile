# Alias Set in PowerShell Profile

This repository contains a PowerShell profile for use in Visual Studio Code's integrated terminal.

## Features

- VS Code integrated terminal detection using `if ($env:TERM_PROGRAM -eq "vscode")` line
- Command to easily run Flutter apps in Chrome (`rc`)
- Command to easily run custom Flutter apps in Chrome (`rcc #name`) ex)`PS yourProjectDirectory>rcc main2`
- Commands to quickly start a Node.js server for CORS proxy (`nsv`, `nodeserver`, `nodesvr`)

## Installation

1. Save this file in your PowerShell profile path: you can find it using `$PROFILE`, or you can manually build it using `if (-not (Test-Path $PROFILE)) { New-Item -Path $PROFILE -ItemType File -Force }`.
2. Restart PowerShell, and the settings will automatically apply in the VS Code's integrated terminal.

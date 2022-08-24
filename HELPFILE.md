# PowerShell Troll Tools

![PowerShell Gallery](https://img.shields.io/powershellgallery/v/IntuneBackupAndRestore.svg?label=PSGallery%20Version&logo=PowerShell&style=flat-square)
![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/IntuneBackupAndRestore.svg?label=PSGallery%20Downloads&logo=PowerShell&style=flat-square)


Collection of dumb scripts/functions. Text and GUI menus for the script kiddies.

## Installing PwshTrollTools

```powershell
# Install IntuneBackupAndRestore from the PowerShell Gallery
Install-Module -Name IntuneBackupAndRestore
```

## Updating PwshTrollTools

```powershell
# Update IntuneBackupAndRestore from the PowerShell Gallery
Update-Module -Name IntuneBackupAndRestore
```

## Prerequisites
As of version 2.0.0, the IntuneBackupAndRestore PowerShell Module has migrated from the MSGraphFunctions PowerShell module to the Microsoft.Graph.Intune PowerShell module. Please make sure you meet the prerequisites below.

- Requires [Microsoft.Graph.Intune](https://github.com/Microsoft/Intune-PowerShell-SDK/) PowerShell Module (`Install-Module -Name Microsoft.Graph.Intune`)
- Connect to Microsoft Graph using the `Connect-MSGraph` PSCmdlet first.


## Features

### Index
- Administrative Templates (Device Configurations)

### System
  - Device compliance

### Hardware
  - Device compliance

### Freak-outs
  - Device compliance

### Stupid
  - Device compliance

### Dangerous
  - Device compliance

> Please note that some Client App settings can be backed up, for instance the retrieval of Win32 (un)install cmdlets, requirements, etcetera. The Client App itself is not backed up and this module does not support restoring Client Apps at this time.

## Examples

### Example 01 - Full Intune Backup
```powershell
Start-IntuneBackup -Path C:\temp\IntuneBackup
```


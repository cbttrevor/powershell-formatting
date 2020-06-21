# Check the edition and version of PowerShell you're running
$PSVersionTable

# What PowerShell commands are available to work with object formatting?
Get-Command -Module Mic*Pow* -Name *format*

# Examples of default PowerShell formatting
Get-Process 

Get-ChildItem

Get-Module  | Get-Member

# Exploring PowerShell Format Data
Get-FormatData

# Microsoft Documentation for PowerShell formatting

# Formatting File Overview          https://docs.microsoft.com/en-us/powershell/scripting/developer/format/formatting-file-overview?view=powershell-7
# about_Format.ps1xml               https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_format.ps1xml?view=powershell-7
# Format Schema XML Reference       https://docs.microsoft.com/en-us/powershell/scripting/developer/format/format-schema-xml-reference?view=powershell-7


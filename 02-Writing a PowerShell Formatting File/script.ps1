# List format, useful for fewer objects, larger properties
Get-Process | Format-List -Property Name, Id

# Table format, useful for higher object counts, shorter properties
Get-Process | Format-Table -Property Name, Id

# Table format, useful for single properties in multiple columns
Get-Process | Format-Wide -Property { $_.Name + ' ' + $_.Id }

# We are missing the CreationTime property from files
Get-ChildItem

# Retrieve the existing format data (if available)
Get-FormatData -TypeName System.Diagnostics.Process | Export-FormatData -Path process.ps1xml

# Import our custom format data, now that we've customized it
Update-FormatData -PrependPath ./FileInfo.ps1xml

# Test out our custom format data, to see if it worked!
Get-ChildItem
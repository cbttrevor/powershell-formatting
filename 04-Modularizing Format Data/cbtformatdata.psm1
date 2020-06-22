$FormatData = Get-ChildItem -Path $PSScriptRoot/FormatData/*ps1xml

foreach ($FormatFile in $FormatData) {
    Update-FormatData -PrependPath $FormatFile.FullName
    Write-Host -Object $FormatFile.FullName
}
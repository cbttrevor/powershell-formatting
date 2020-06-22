<#
    Learning Objective: You can construct PowerShell format types without writing XML by hand.

    By using the built-in types in the PowerShell .NET assemblies, you can dynamically generate PowerShell format type files (.ps1xml).
#> 


# Install ILspy utility to inspect .NET assemblies

# Add reference to System.Management.Automation.dll

Get-FormatData | gm

# Create a custom type
class Person {
    [string] $FirstName
    [string] $LastName
    [uint] $Age
    
    Person([string] $First, [string] $Last) {
        $this.FirstName = $First
        $this.LastName = $Last
        $this.Age = 25
    }
}
$Person = [Person]::new('Trevor', 'Sullivan')
$Person

# We don't have any formatting data for a Person object
Get-FormatData -TypeName Person

# Create a type definition
$TableControl = [System.Management.Automation.TableControl]::new()

$TableColumnHeader = [System.Management.Automation.TableControlColumnHeader]::new('First Name', 0, [System.Management.Automation.Alignment]::Left)
$TableControl.Headers.Add($TableColumnHeader)

$DisplayEntry = [System.Management.Automation.DisplayEntry]::new('"$_.FirstName"', [System.Management.Automation.DisplayEntryValueType]::ScriptBlock)
$TableColumn = [System.Management.Automation.TableControlColumn]::new([System.Management.Automation.Alignment]::Undefined, $DisplayEntry)

$ArrayList = [System.Collections.Generic.List[System.Management.Automation.TableControlColumn]]::new(10)
$ArrayList.Add($TableColumn)

$TableRow = [System.Management.Automation.TableControlRow]::new($ArrayList)
$TableControl.Rows.Add($TableRow)
$TableControl.AutoSize = $true

$FormatView = [System.Management.Automation.FormatViewDefinition]::new('Person', $TableControl)
$ExTypeDef = [System.Management.Automation.ExtendedTypeDefinition]::new('Person')
$ExTypeDef.FormatViewDefinition.Add($FormatView)

# Export Format Types to .ps1xml file
Export-FormatData -InputObject $ExTypeDef -Path person.ps1xml

# Inspect the formatting file for errors and correct them
Get-Content -Raw -Path .\person.ps1xml
code .\person.ps1xml

# Import the type formatting data
Update-FormatData -PrependPath .\person.ps1xml

# View the Person object again
$Person

# NOTICE how the column header has changed, even though the underlying property (FirstName) hasn't 
# NOTICE how only the FirstName is being emitted, not the LastName or Age properties


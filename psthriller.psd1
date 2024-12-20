#
# Module manifest for psthriller
#

@{
    RootModule           = 'psthriller.psm1'
    ModuleVersion        = '1.2.0'
    CompatiblePSEditions = @('desktop', 'core')
    GUID                 = 'fd69f5ba-d244-4c72-b079-f4e6e344475c'
    Author               = 'Jeff Hicks'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '(c) 2018-2024 JDH Information Technology Solutions, Inc.'
    Description          = 'A demonstration PowerShell module that creates a new thriller synopsis.'
    PowerShellVersion    = '5.1'
    FormatsToProcess     = @('formats/PSThrillerCharacter.format.ps1xml')
    FunctionsToExport    = 'New-PSThriller', 'Get-PSThrillerTitle', 'Get-PSThrillerCharacters'
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @()
    PrivateData          = @{
        PSData = @{ }
    }
}

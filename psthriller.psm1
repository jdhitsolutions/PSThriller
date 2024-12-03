Get-ChildItem -Path $PSScriptRoot\functions -Filter *.ps1 | ForEach-Object {
    . $_.FullName
}

#this will become a module-scoped variable
$data = Get-Content -Path $PSScriptRoot\data.json | ConvertFrom-Json
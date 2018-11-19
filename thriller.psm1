
Function New-Thriller {
    [cmdletbinding(DefaultParameterSetName="object")]
    Param(
        [Parameter(ParameterSetName = "document")]
        [switch]$AsMarkdown,
        [Parameter(ParameterSetName = "document")]
        [switch]$AsDocument,
        [Parameter(ParameterSetName = "object")]
        [switch]$AsObject
    )
   
    Write-Verbose "Starting $($myinvocation.MyCommand)"

    $data = Get-Content $PSScriptRoot\data.json | ConvertFrom-Json
    
    $titles = _getitem $data.titles -Count 3
    $title = $titles[0]
    $previous1 = $titles[1]
    $previous2 = $titles[2]
    $name = _getitem $data.names
    $first = ($name | Get-Random).Split()[0]
    $former = _getitem $data.formers
    $villain = _getitem $data.villains
    $family = _getitem $data.members
    $tragedy = _getitem $data.tragedies
    $mystery = _getitem $data.mysteries
    $backdrop = _getitem $data.backdrops -count 2
    $loveinterest = _getitem $data.loveInterests
    $loveBackStory = _getitem $data.loveBackstories

    $authornames = _getitem $data.authorPool -Count 2
    $author = "$($authornames[0].split()[0]) $($authornames[1].split()[1])"
    $backdrop1 = $backdrop[0]
    $backdrop2 = $backdrop[1]

    Write-Verbose "Creating $Title by $author about the adventures of former $former $name."

    $text = Get-Content -path $PSScriptRoot\template.txt

    [regex]$rx="_\w+"
    #replace placeholders with corresponding variables
    $replacements = $rx.matches($text) | Group-object -property Value
    
    foreach ($item in $replacements) {
        $var = (Get-Variable -Name $item.name.substring(1)).Value
        write-Verbose "Replacing $($item.name) with $var"
        $text = $text -replace $item.name,$var
    }

    #handle nested replacement
    if ($text -match "_family") {
        $text = $text -replace "_family",$family
    }

    if ($PSCmdlet.ParameterSetName -eq "document") {

        if ($AsMarkdown) {
            $head = @"
            
# $($Titles[0])

## by $author   
"@  
            
            $text = $text -replace $previous1,"[$previous1]()"
            $text = $text -replace $previous2,"[$previous2]()"
        }
        else {
            
            $head = @"

$($Titles[0])
$("-" * ($titles[0].length))
by $author   
"@
            
            $text = $text -replace $previous1,"'$previous1'"
            $text = $text -replace $previous2,"'$previous2'"
        }
        
        #forcing $text to maintain its formatting by sending in through Out-String
        $out = @"
$head

$($text |Out-string)

"@
        
        $out
    }
    else {
        #create a custom object
        [PSCustomObject]@{
            Title = $Titles[0]
            Author = $author
            Hero = $name
            Former = $Former
            Villain = $villain
            TheWoman = "$loveinterest, $lovebackstory"
            Locations = $Backdrop1,$backdrop2
            Blurb = ($Text | Out-String).Trim()
        }
    }

    Write-Verbose "Ending $($myinvocation.MyCommand)"
    
} #New-Thriller

# a private function to add some extra randomization to the process
Function _getitem {
    [cmdletbinding()]
    Param(
        [string[]]$Items,
        [int32]$Count = 1
    )

    #randomize items and then select a random entry
    $r = $items | Get-Random -Count $items.count | Get-Random -Count $items.count
    $r | Get-Random -Count $count
}

Export-ModuleMember -Function New-Thriller
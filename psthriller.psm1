
Function New-PSThriller {
    [cmdletbinding(DefaultParameterSetName="object")]
    [OutputType("PSCustomObject",[system.string])]

    Param(
        [Parameter(ParameterSetName = "document")]
        [switch]$AsMarkdown,
        [Parameter(ParameterSetName = "document")]
        [switch]$AsDocument,
        [Parameter(ParameterSetName = "object")]
        [switch]$AsObject
    )
   
    Write-Verbose "[$((Get-Date).TimeofDay) Starting $($myinvocation.MyCommand)"

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

    $authornames = _getitem $data.authorPool -Count 5
    $author = "$($authornames[0].split()[0]) $($authornames[1].split()[1])"
    $backdrop1 = $backdrop[0]
    $backdrop2 = $backdrop[1]

    Write-Verbose "[$((Get-Date).TimeofDay) Creating recommendations"
    $quotes = _getitem $data.quotes -count 3 |
    foreach-object -begin {$i= 1} -process {
        $i++
        [pscustomobject]@{
            Quote = $_
            Author = $authornames[$i]
        }
    }

    Write-Verbose "[$((Get-Date).TimeofDay) Creating $Title by $author about the adventures of former $former $name."

    $text = Get-Content -path $PSScriptRoot\template.txt

    [regex]$rx="_\w+"
    #replace placeholders with corresponding variables
    $replacements = $rx.matches($text) | Group-Object -property Value
    
    foreach ($item in $replacements) {
        $var = (Get-Variable -Name $item.name.substring(1)).Value
        write-Verbose "[$((Get-Date).TimeofDay) Replacing $($item.name) with $var"
        $text = $text -replace $item.name,$var
    } #foreach replacement

    #handle nested replacement
    if ($text -match "_family") {
        $text = $text -replace "_family",$family
    }

    if ($PSCmdlet.ParameterSetName -eq "document") {
   
    if ($AsMarkdown) {
        
        #convert recommendation quotes into proper text
        $quoteText = @"

"@
    foreach ($item in $quotes) {
        $quoteText += @"
"_$($item.quote)_"
-- $($item.author)


"@
    } #foreach quote
            $head = @"
            
# $($Titles[0])

## by $author   
"@  
            
            $text = $text -replace $previous1,"[$previous1]()"
            $text = $text -replace $previous2,"[$previous2]()"
        }
        else {
        #convert recommendation quotes into proper text
        $quoteText = @" 
"@
        foreach ($item in $quotes) {
            $quoteText += @"
"$($item.quote)"
  -- $($item.author)


"@
        } #foreach quote
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

$($text | Out-String)
$quotetext
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
            Quotes = $quotes
        }
    }

    Write-Verbose "[$((Get-Date).TimeofDay) Ending $($myinvocation.MyCommand)"
    
} #New-PSThriller

Function Get-PSThrillerTitle {
    [cmdletbinding(DefaultParameterSetName = "count")]
    [OutputType([system.string])]

    Param(
        [Parameter(ParameterSetName = "count")]
        [ValidateRange(1,10)]
        [int32]$Count = 1,
        [Parameter(ParameterSetName = "all")]
        [switch]$All
    )
    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
        $data = Get-Content -Path $PSScriptRoot\data.json | ConvertFrom-Json
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Imported $($data.titles.count) titles."
    } #begin

    Process {
        if ($all) {
            Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Getting all titles"
            $data.titles | Get-Random -count $data.titles.count
        }
        else {
            Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Getting $count titles"
            $data.titles | Get-Random -count $data.titles.count | Get-Random -count $Count
        }
    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"

    } #end 

} #close Get-PSThrillerTitle

Function Get-PSThrillerCharacters {
    [cmdletbinding()]
    [OutputType("PSCustomObject")]

    Param(
    )
    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
        $data = Get-Content -Path $PSScriptRoot\data.json | ConvertFrom-Json
    } #begin

    Process {
       #use the private function to get the necessary values
       [pscustomobject]@{
           Hero = _getitem $data.names
           FormerOccupation = _getitem $data.formers
           TheWoman = _getitem $data.loveInterests
           HerStory = _getitem $data.loveBackstories
           Villain = _getitem $data.villains
       }

    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"

    } #end 

} #close Get-PSThrillerCharacters


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


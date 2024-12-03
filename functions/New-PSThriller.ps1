Function New-PSThriller {
    [cmdletbinding(DefaultParameterSetName = 'object')]
    [OutputType('PSThriller', [system.string])]

    Param(
        [Parameter(ParameterSetName = 'markdown')]
        [switch]$AsMarkdown,
        [Parameter(ParameterSetName = 'document')]
        [switch]$AsDocument,
        [Parameter(ParameterSetName = 'object')]
        [switch]$AsObject
    )

    Begin {
        Write-Verbose "[$((Get-Date).TimeOfDay) BEGIN  ] Starting $($MyInvocation.MyCommand)"

        $titles = _getItem $data.titles -Count 3
        $title = $titles[0]
        $previous1 = $titles[1]
        $previous2 = $titles[2]
        $name = _getItem $data.names
        $first = ($name | Get-Random).Split()[0]
        $former = _getItem $data.formers
        $villain = _getItem $data.villains
        $family = _getItem $data.members
        $tragedy = _getItem $data.tragedies
        $mystery = _getItem $data.mysteries
        $backdrop = _getItem $data.backdrops -count 2
        $LoveInterest = _getItem $data.LoveInterests
        $LoveBackstory = _getItem $data.loveBackstories

        $AuthorNames = _getItem $data.authorPool -Count 5
        $author = "$($AuthorNames[0].split()[0]) $($AuthorNames[1].split()[1])"
        $backdrop1 = $backdrop[0]
        $backdrop2 = $backdrop[1]

        Write-Verbose "[$((Get-Date).TimeOfDay) BEGIN  ] Creating recommendations"
        $quotes = _getItem $data.quotes -count 3 |
        ForEach-Object -Begin { $i = 1 } -Process {
            $i++
            [PSCustomObject]@{
                Quote  = $_
                Author = $AuthorNames[$i]
            }
        }

    } #begin
    Process {
        Write-Verbose "[$((Get-Date).TimeOfDay)  PROCESS] Creating $Title by $author about the adventures of former $former $name."

        $text = Get-Content -Path $PSScriptRoot\..\template.txt

        [regex]$rx = '_\w+'
        #replace placeholders with corresponding variables
        $replacements = $rx.matches($text) | Group-Object -Property Value

        foreach ($item in $replacements) {
            $var = (Get-Variable -Name $item.name.substring(1)).Value
            Write-Verbose "[$((Get-Date).TimeOfDay)] Replacing $($item.name) with $var"
            $text = $text -replace $item.name, $var
        } #foreach replacement

        #handle nested replacement
        if ($text -match '_family') {
            $text = $text -replace '_family', $family
        }

        Switch ($PSCmdlet.ParameterSetName) {
            'document' {
                #convert recommendation quotes into proper text
                $QuoteText = @'

'@
                foreach ($item in $quotes) {
                    $QuoteText += @"
"$($item.quote)"
  -- $($item.author)


"@
                } #foreach quote
                $head = @"

$($Titles[0])
$('-' * ($titles[0].length))
by $author
"@

                $text = $text -replace $previous1, "'$previous1'"
                $text = $text -replace $previous2, "'$previous2'"
            }
            'markdown' {
                #convert recommendation quotes into proper text
                $QuoteText = @'

'@
                foreach ($item in $quotes) {
                    $QuoteText += @"
"_$($item.quote)_"
-- $($item.author)


"@
                } #foreach quote
                $head = @"

# $($Titles[0])

## by $author
"@

                $text = $text -replace $previous1, "[$previous1]()"
                $text = $text -replace $previous2, "[$previous2]()"

            }
            'object' {
                #create a custom object
                [PSCustomObject]@{
                    PSTypeName = 'PSThriller'
                    Title      = $Titles[0]
                    Author     = $author
                    Hero       = $name
                    Former     = $Former
                    Villain    = $villain
                    TheWoman   = "$LoveInterest, $LoveBackstory"
                    Locations  = $Backdrop1, $backdrop2
                    Blurb      = ($Text | Out-String).Trim()
                    Quotes     = $quotes
                }
            }
        } #switch

        #format document and markdown output as strings
        If ($QuoteText) {
            #forcing $text to maintain its formatting by sending in through Out-String
            $out = @"
$head

$($text | Out-String)
$QuoteText
"@

            $out
        }

    } #process
    End {
        Write-Verbose "[$((Get-Date).TimeOfDay) END    ] Ending $($MyInvocation.MyCommand)"
    }
}

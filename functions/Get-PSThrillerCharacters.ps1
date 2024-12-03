Function Get-PSThrillerCharacters {
    [cmdletbinding()]
    [OutputType('PSThrillerCharacter')]

    Param( )
    Begin {
        Write-Verbose "[$((Get-Date).TimeOfDay) BEGIN  ] Starting $($MyInvocation.MyCommand)"
    } #begin

    Process {
        #use the private function to get the necessary values
        Write-Verbose "[$((Get-Date).TimeOfDay) PROCESS] Creating a character set"
        [PSCustomObject]@{
            PSTypeName       = 'PSThrillerCharacter'
            Hero             = _getItem $data.names
            FormerOccupation = _getItem $data.formers
            TheWoman         = _getItem $data.loveInterests
            HerStory         = _getItem $data.loveBackstories
            Villain          = _getItem $data.villains
        }

    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeOfDay) END    ] Ending $($MyInvocation.MyCommand)"
    } #end

}

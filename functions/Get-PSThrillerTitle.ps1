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
        Write-Verbose "[$((Get-Date).TimeOfDay) BEGIN  ] Starting $($MyInvocation.MyCommand)"
        Write-Verbose "[$((Get-Date).TimeOfDay) BEGIN  ] Imported $($data.titles.count) titles."
    } #begin

    Process {
        if ($all) {
            Write-Verbose "[$((Get-Date).TimeOfDay) PROCESS] Getting all titles"
            $data.titles | Get-Random -count $data.titles.count
        }
        else {
            Write-Verbose "[$((Get-Date).TimeOfDay) PROCESS] Getting $count titles"
            $data.titles | Get-Random -count $data.titles.count | Get-Random -count $Count
        }
    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeOfDay) END    ] Ending $($MyInvocation.MyCommand)"
    } #end

}

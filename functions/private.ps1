#this is a private helper function

# a private function to add some extra randomization to the process
Function _getItem {
    [cmdletbinding()]
    Param(
        [string[]]$Items,
        [int32]$Count = 1
    )

    #randomize items and then select a random entry
    $r = $items | Get-Random -Count $items.count | Get-Random -Count $items.count
    $r | Get-Random -Count $count
}
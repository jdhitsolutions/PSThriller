---
external help file: psthriller-help.xml
Module Name: psthriller
online version:
schema: 2.0.0
---

# Get-PSThrillerTitle

## SYNOPSIS

Get a new thriller title

## SYNTAX

### count (Default)

```yaml
Get-PSThrillerTitle [-Count <Int32>] [<CommonParameters>]
```

### all

```yaml
Get-PSThrillerTitle [-All] [<CommonParameters>]
```

## DESCRIPTION

Query the thriller database file for a new thriller title. Or you can view all the potential titles.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSThrillerTitle
Killer Queen
```

Get a single title.

### Example 2

```powershell
PS C:\> Get-PSThrillerTitle -count 5
The Paper Man
Paradise City
The OSI Model
Old MacDonald's Farm
The Silver Goose
```

Get a multiple potential titles.

### Example 3

```powershell
PS C:\> Get-PSThrillerTitle -all
Eruption
Rainbow in the Dark
Full Stack
...
```

List potential titles.

## PARAMETERS

### -All

List all available titles.

```yaml
Type: SwitchParameter
Parameter Sets: all
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count

Get the specified number of titles.

```yaml
Type: Int32
Parameter Sets: count
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String

### System.String[]

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[New-PSThriller]()
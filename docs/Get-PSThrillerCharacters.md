---
external help file: psthriller-help.xml
Module Name: psthriller
online version:
schema: 2.0.0
---

# Get-PSThrillerCharacters

## SYNOPSIS

Get a thriller character set

## SYNTAX

```yaml
Get-PSThrillerCharacters [<CommonParameters>]
```

## DESCRIPTION

Query the thriller database file and create a character set for a new thriller.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSThrillerCharacters

Hero        FormerOccupation               TheWoman HerStory          Villain
----        ----------------               -------- --------          -------
Thomas Tank FBI Hostage Rescue Team member Betty    a nursing student The Iron …
```

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### PSThrillerCharacter

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[New-PSThriller](New-PSThriller.md)

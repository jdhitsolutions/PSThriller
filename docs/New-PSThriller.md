---
external help file: psthriller-help.xml
Module Name: psthriller
online version:
schema: 2.0.0
---

# New-PSThriller

## SYNOPSIS

Create a new thriller book description

## SYNTAX

### object (Default)

```yaml
New-PSThriller [-AsObject] [<CommonParameters>]
```

### markdown

```yaml
New-PSThriller [-AsMarkdown] [<CommonParameters>]
```

### document

```yaml
New-PSThriller [-AsDocument] [<CommonParameters>]
```

## DESCRIPTION

This command will query data from a thriller database file and randomly generate a thriller book description and synopsis. The default behavior is to create an object with all of the relevant data. But you can also format the output as a text document or even add markdown tags.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-PSThriller

Title     : Master of Puppets
Author    : James Achilles
Hero      : Chip Schottz
Former    : billionaire playboy
Villain   : The Brotherhood
TheWoman  : Betty, a speech-language pathologist
Locations : {the International Space Station, Paris}
Blurb     : This exciting new tale from the best-selling author of Reboot and The Game of Death,
            throws former billionaire playboy Chip Schottz in the middle of an extraordinary adventure that will push him beyond the breaking point. While on a seemingly idyllic holiday, Chip quickly finds himself trapped in the midst of a series of catastrophic events unleashed by the sinister and shadowy organization known only as The Brotherhood, that threaten not only his sanity but the very fabric of civilization as we know it.

            Haunted by the tragic loss of his grandmother, Chip must overcome a complex and diabolical plot surrounding the mystery of Jar-Jar Binks. Swept up by forces unseen, Betty, a speech-language pathologist, is paired with Chip in an uneasy alliance that will put them to the ultimate test.

            Set amidst the exotic backdrops of the International Space Station and Paris, Chip and
            Betty will make a discovery that will change their world and ours, forever.
            Hunted relentlessly by The Brotherhood, Chip and Betty have but one chance to stop them.

            Can they do it before time runs out?
Quotes    : {@{Quote=You won't be disappointed.; Author=Robert Ludlum}, @{Quote=This will make one
            helluva movie!; Author=Aloysius Pendergast}, @{Quote=You won't be bored.; Author=L.T. Ryan}}
```

The default object-oriented output.

### Example 2

```powershell
PS C:\> New-PSThriller -AsDocument

Scrum
-----
by Dewey Thor

This exciting new tale from the best-selling author of 'The Drive-In' and 'Easy Living',
throws former CIA agent Jack Frost in the middle of an extraordinary adventure that will push
him beyond the breaking point. While on a seemingly idyllic holiday, Jack quickly finds
himself trapped in the midst of a series of catastrophic events unleashed by the sinister
and shadowy organization known only as The Book of Faces, that threaten not only his sanity but the
very fabric of civilization as we know it.

Haunted by a missing library book, Jack must overcome a complex and diabolical plot surrounding the
mystery of Machu Picchu. Swept up by forces unseen, Layla, an audiologist, is paired with Jack in an uneasy alliance that will put them to the ultimate test.

Set amidst the exotic backdrops of Aruba and Newark, Jack and
Layla will make a discovery that will change their world and ours, forever.
Hunted relentlessly by The Book of Faces, Jack and Layla have but one chance to stop them.

Can they do it before time runs out?

"What in the world did I just read? Awesome."
  -- James Rollins

"The. Best. Ever."
  -- Robert Ludlum

"The hero that we need and deserve."
  -- Tom Clancy
```

Format as a text document.

### Example 3

```powershell
PS C:\> New-PSThriller -AsMarkdown

# Holy Diver

## by David Preston

This exciting new tale from the best-selling author of [The Bourbon Betrayal]() and [The White Room](),
throws former Special Forces operator Carl Marks in the middle of an extraordinary adventure that will push
them beyond the breaking point. While on a seemingly idyllic holiday, Carl quickly finds
himself trapped in the midst of a series of catastrophic events unleashed by the sinister
and shadowy organization known only as The War Pigs, that threaten not only his sanity but the
very fabric of civilization as we know it.

Haunted by a nagging suspicion, Carl must overcome a complex and diabolical plot surrounding the
mystery of teenagers. Swept up by forces unseen, Beth, a concert cellist,
is paired with Carl in an uneasy alliance that will put them to the ultimate test.

Set amidst the exotic backdrops of Singapore and Tierra del Fuego, Carl and
Beth will make a discovery that will change their world and ours, forever.
Hunted relentlessly by The War Pigs, Carl and Beth have but one chance to stop them.

Can they do it before time runs out?

"_Gripping and compelling._"
-- Dewey Andreas

"_Action. Adventure. Awesome._"
-- Blake Crouch

"_A gripping story by the next James Rollins_"
-- Gideon Crew

```

Format the output as a markdown document.

### Example 4

```powershell
PS C:\> New-PSThriller -AsMarkdown | Show-Markdown
```

In PowerShell 7, you can run a command like this generate a Markdown document and then have PowerShell display it in the console.

## PARAMETERS

### -AsDocument

Format as a text document.

```yaml
Type: SwitchParameter
Parameter Sets: document
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsMarkdown

Add markdown tags.

```yaml
Type: SwitchParameter
Parameter Sets: markdown
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsObject

Write an object to the pipeline with all of the necessary book data.

```yaml
Type: SwitchParameter
Parameter Sets: object
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### PSThriller

### System.String

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Get-PSThrillerTitle](Get-PSThrillerTitle.md)

[Get-PSThrillerCharacters](Get-PSThrillerCharacters.md)

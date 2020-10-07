function Get-ScoopPackages {
    [CmdletBinding()]
    PARAM(

    )

    process {
        return (scoop export) | Select-String '^(\w+) ' |ForEach-Object { $_.matches.groups[1].value }
    }
}
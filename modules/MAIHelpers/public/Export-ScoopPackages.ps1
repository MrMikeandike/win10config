function Export-ScoopPackages {
    [CmdletBinding()]
    param (
        $FilePath
    )
    
    begin {
        $defaultFileName = "scoopInstalled.txt"
    }
    
    process {
        $Exported = (scoop export) | Select-String '^(\w+) ' |ForEach-Object { $_.matches.groups[1].value }
        
        if(-not [bool]$filepath) {
            return $exported    
        }
        if(Test-Path -PathType Container -Path $filepath){
            $Filepath = join-path $FilePath $defaultFileName
        }
        set-content -Force -Confirm:$False -Path $filepath -Value $Exported
        return
    }
    
    
}
function Import-ScoopPackages {
    [CmdletBinding()]
    param (
        $FilePath
    )

    process{
        if(-not (test-path $filepath -PathType Leaf)){
            throw "filepath '$filepath' is not valid"
        }
        $apps = get-content $filepath
        scoop install @apps

    }
}
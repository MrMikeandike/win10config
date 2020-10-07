function Import-ScoopPackages {
    [CmdletBinding()]
    param (
        
        [Parameter(ParameterSetName="MethodObj", ValueFromPipeline=$True)]
        [string[]]
        $Packages,
        [Parameter(ParameterSetName="MethodFP")]
        $FilePath
    )

    process{
        # if packages param was used
        if(($packages|measure-object).count -ne 0) {
            scoop install @packages
        } else {
            if(-not (test-path $filepath -PathType Leaf)){
                throw "filepath '$filepath' is not valid"
            }
            $apps = get-content $filepath
            scoop install @apps
        }
        

    }
}
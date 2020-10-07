
function Get-ScoopConfig {
    [CmdletBinding()]
    param (

        # Decides which type of output
        [Parameter(Mandatory = $False)]
        [string]
        $format = "json",
        # Specifies a path to one or more locations.
        [Parameter(Mandatory = $false,
            HelpMessage = "Path to scoop dir")]
        [Alias("PSPath")]
        [string]
        $ScoopDir = $(join-path $home "scoop")
    )
    
    
    
    process {
        try{
        $buckets = Get-ScoopBuckets -ScoopDir $scoopDir -ErrorAction "Stop"
        } catch {
            throw "Error retrieving scoop buckets", $_
            
        }
        try {
            $packages = Get-ScoopPackages -ErrorAction "Stop"
        } catch {
            throw "Error retrieving scoop packages", $_
        }

        switch ($format) {
            "json" {
                return $(@{
                        "buckets"  = $buckets
                        "packages" = $packages
                    } | convertto-json
                ) 
            }
        }
        
    }
    
    
}

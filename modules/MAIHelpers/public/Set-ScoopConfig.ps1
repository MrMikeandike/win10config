function Set-ScoopConfig {
    [CmdletBinding()]
    param (
        $inputObject,
        # Format can be json or object
        $format   
    )
    process {
        switch ($format) {
            "json" {
                $inputObject | convertfrom-json
                $buckets = $inputObject.Buckets
                $packages = $inputObject.Packages
            }
            "object" {
                $buckets = $inputobject.buckets
                $packages = $inputobject.packages
                
            }
        }
        $null = $buckets | Add-ScoopBucket
        $null = Import-ScoopPackages -Packages $packages
        
    }
}
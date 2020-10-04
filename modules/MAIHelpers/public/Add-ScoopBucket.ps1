function Add-ScoopBucket {
    [CmdletBinding()]
    param (
        
        [Parameter(
              Mandatory=$False,
              HelpMessage="Specifies url of unknown bucket (usually a git repo)",
              ValueFromPipelineByPropertyName=$true
        )]
        [string]
        $URL,
        
        [Parameter(
              Mandatory=$false,
              HelpMessage="Whether the bucket is known or not. This will execute 'scoop bucket add <name>' and omit any url",
              ValueFromPipelineByPropertyName=$true
        )]
        [bool]
        $known=$false,

        [Parameter(
              Mandatory=$True,
              HelpMessage="name of the bucket",
              ValueFromPipelineByPropertyName=$true
        )]
        [string]
        $name
    )
   begin {
     $allKnown = $(scoop bucket known).split()|ForEach-Object{$_.trim()}
     $InstalledBuckets = $(scoop bucket list).split()|ForEach-Object{$_.trim()}
   }
   process {
        if($known){
            if($name -in $allKnown){
                if ($name -notin $InstalledBuckets){
                    scoop bucket add $name
                }
            } else {
                throw "Issue when adding bucket '$name': bucket '$name' is not available as a known bucket"
            }
        } else {
            if($url -eq "" -or $null -eq $url){
                throw "Issue when adding bucket '$name': url is null and known=false."
            }
            if($name -notin $allKnown) {
                if($name -notin $InstalledBuckets){
                    scoop bucket add $name $url
                }
            } else {
                throw "Issue when adding bucket '$name': bucket name is reserved as a known bucket, but known=false"
            }
        }
    }
}
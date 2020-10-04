Function Get-ScoopBuckets {
    [CmdletBinding()]
    PARAM(
      $ScoopDir = $(join-path $HOME "scoop")
    )

    process {
      $bucketDir = join-path $scoopDir "buckets"
      if( (-not (test-path $scoopDir)) -or ( -not (test-path $bucketDir)) ) {
          throw "Scoop directory invalid"
      }
      $known = $(scoop bucket known).split()|ForEach-Object{$_.trim()}
      $Buckets = get-childitem $bucketDir| Select-Object -expand name
      $customBuckets = $buckets | Where-Object{$_ -notin $known}
      $knownBuckets = $buckets | Where-Object{$_ -in $known}
      $re = [regex]"url = (.+?)\s"
      $result = [system.collections.arraylist]::new()

      $customBuckets | ForEach-Object{
        $url = $re.match($(Get-Content $bucketDir\$_\.git\config)).groups[1].value;
        $null = $result.add([pscustomobject]@{
          name = $_;
          url = $url
          command = "scoop bucket add ${_} ${url}"
          known = "false"
          
        }) 
      }
      $knownbuckets | ForEach-Object{
        $null = $result.add([pscustomobject]@{
          name =$_;
          url ="";
          command = "scoop bucket add ${_}"
          known = $true
        })
      }
      return $result
  }
}

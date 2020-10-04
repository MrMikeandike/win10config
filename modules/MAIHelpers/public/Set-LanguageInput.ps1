function Set-LanguageInput {
    [CmdletBinding()]
    param (
        [string]
        $Language = "ja",
        $InputMethod = "0411:{03B5835F-F03C-411B-9CE2-AA23E1171E36}{A76C93D9-5523-4E90-AAFA-4DB112F9AC76}"
    )
    
    process {
        $list = get-winUserLanguageList
        if($language -notin $list.languageTag) {
            $LangaugeIndex = ($list|measure-object).count
            $list.add($Language)
            
        } else {
            $languageIndex = ($list|Measure-Object).count - 1
        }

        if($list[$languageIndex].InputMethodTips[0] -ne $InputMethod) {
            $list[$LangaugeIndex].InputMethodTips.clear()
            $list[$languageIndex].InputMethodTips.Add($InputMethod)    
        }
        return
    }
    
    
}
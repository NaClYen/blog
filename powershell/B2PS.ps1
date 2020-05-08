class B2PS {
    static [string]ConvertAll($txt) {
        $txt = [B2PS]::HandleVariable($txt)
        $txt = [B2PS]::HandleCommentSign($txt)
        return $txt
    }

    # convert "%aaa_bbb%" to "${aaa_bbb}"
    static [string]HandleVariable([string]$txt) {
        $expression = '\%\w+\%'

        while ($txt -match $expression) {
            $m = (Select-String $expression -InputObject $txt).Matches[0]
            $variableName = $m.Value.Substring(1, $m.Value.Length - 2)
            $newTxt = "`$`{$variableName`}"
            $txt = $txt -replace $m.Value, $newTxt
        }
    
        return $txt 
    }

    # convert "::aaaaaaaaaaaaaaaaaaaa" to "#aaaaaaaaaaaaaaaaaaaa"
    static [string]HandleCommentSign([string]$txt) {
        $expression = '(?m)^\:\:'
        return $txt -replace $expression, "#"
    }
}
# how-to-use
# PS>[B2PS]::ConvertAll($your_script) | Out-String

$ErrorActionPreference = "Stop" #using namespace System.Linq
function Format-Template { param( [string]$Template, [hashtable]$Dict)
    $formated = $Template
    foreach ($kvp in $Dict.GetEnumerator()) {
        $formated = $formated -replace "{$($kvp.Key)}", $kvp.Value
        $formated = $formated -replace "{Label-$($kvp.Key)}", ("$($kvp.Key): $($kvp.Value)", "")[$kvp.Value -eq ""]  
    }
    return $formated
}

$filetemplate = gc ".\src\core\file.md" -Raw
$dict = @{ 
    "Header" = gc ".\src\core\header.md" -Raw; 
    "Body" = gc ".\src\core\body.md" -Raw; 
    "Footer" = gc ".\src\core\footer.md" -Raw 
}
$filetemplate = Format-Template -Template $filetemplate -Dict $dict 
$rows = Import-Csv -Path .\pages.csv

foreach ($row in $rows)
{          
    $dict = @{"Content" = gc ".\src\$($row.Key).md" -ErrorAction SilentlyContinue}
    $row.psobject.properties | ForEach-Object { $dict[$_.Name] = $_.Value }
    $filecontent = ((Format-Template -Template $filetemplate -Dict $dict) -replace '\s+\r\n+', "`r`n`r`n").Trim()
    Set-Content -Path "docs/$($row.Key).md" -Value $filecontent
}
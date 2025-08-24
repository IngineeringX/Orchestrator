# Path to your folder
$folder = "garage\3d printer"

# Output README file
$readme = "$folder\README.md"

# Clear existing README content
"" | Out-File -FilePath $readme

# List of files in the correct order (using exact names)
$files = @(
    "3D Printer.one",
    "3d Printer+ CNC craving hybrid..md",
    "3d printer list.md",
    "BOM.md",
    "Market-research.md",
    "r&d.txt"
)

# Loop through files and append content with heading
foreach ($file in $files) {
    $filePath = Join-Path -Path $folder -ChildPath $file
    if (Test-Path $filePath) {
        "# $file" | Out-File -FilePath $readme -Append
        Get-Content -LiteralPath $filePath | Out-File -FilePath $readme -Append
        "`n`n" | Out-File -FilePath $readme -Append
    } else {
        Write-Host "File not found: $filePath"
    }
}

Write-Host "README.md created successfully!"

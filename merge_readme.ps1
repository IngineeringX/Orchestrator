# Path to your folder
$folder = "garage\3d printer"

# Output README file
$readme = "$folder\README.md"

# Clear existing README content
"" | Out-File -FilePath $readme

# Get all files in the folder
$allFiles = Get-ChildItem -Path $folder | Where-Object { -not $_.PSIsContainer }

foreach ($file in $allFiles) {
    $filePath = $file.FullName

    # Check if file extension is readable text
    $ext = $file.Extension.ToLower()
    if ($ext -in ".txt", ".md", ".csv") {

        # Append file name as heading
        "# $($file.Name)" | Out-File -FilePath $readme -Append

        # Append file content
        Get-Content -LiteralPath $filePath | Out-File -FilePath $readme -Append

        # Add extra space
        "`n`n" | Out-File -FilePath $readme -Append
    } else {
        Write-Host "Skipping non-text file: $($file.Name)"
    }
}

Write-Host "README.md created successfully!"

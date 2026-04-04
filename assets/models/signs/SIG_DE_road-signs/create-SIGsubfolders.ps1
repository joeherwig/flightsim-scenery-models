param (
    [int]$chunkSize = $(Get-Random -Minimum -3 -Maximum 12),      # Number of files to download in each chunk
    [int]$delaySeconds = $(Get-Random -Minimum -8 -Maximum 73)   # Delay between chunks in seconds
)

# Define the base folder where all SVGs and subfolders will be saved
$baseFolder = $PSScriptRoot  # Change this to your desired base folder path

# Create the base folder if it doesn't exist
if (!(Test-Path -Path $baseFolder)) {
    New-Item -ItemType Directory -Path $baseFolder | Out-Null
}

# Read the markdown file
$filePath = "SIG_DE_wikipedia_sources.md"  # Change this if the file is in a different location
$urls = Get-Content -Path $filePath

# Filter out already commented lines
$uncommentedUrls = $urls | Where-Object { $_ -notmatch '^\/\/' }

# Process URLs in chunks
for ($i = 0; $i -lt $uncommentedUrls.Count; $i += $chunkSize) {
    $chunk = $uncommentedUrls[$i..($i + $chunkSize - 1)]

    foreach ($url in $chunk) {
        $fileName = Split-Path $url -Leaf
        $fileNameWithoutExt = [System.IO.Path]::GetFileNameWithoutExtension($fileName)

        # Download the SVG
        $svgDestination = Join-Path -Path $baseFolder -ChildPath $fileName
        try {
            Invoke-WebRequest -Uri $url -OutFile $svgDestination
            Write-Host "Downloaded: $fileName"

            # Create the subfolder structure
            $signFolder = Join-Path -Path $baseFolder -ChildPath "SIG_DE-road-sign-$fileNameWithoutExt"
            $blenderTextureFolder = Join-Path -path $signFolder -ChildPath "blender-texture"
            $msfsModelFolder = Join-Path -path $signFolder -ChildPath "msfs-model"
            $msfsSignFolder = Join-Path -path $msfsModelFolder -ChildPath "SIG_DE-road-sign-$fileNameWithoutExt"

            # Create the subfolders
            if (!(Test-Path -Path $signFolder)) {
                New-Item -ItemType Directory -Path $signFolder | Out-Null
            }
            if (!(Test-Path -Path $blenderTextureFolder)) {
                New-Item -ItemType Directory -Path $blenderTextureFolder | Out-Null
            }
            if (!(Test-Path -Path $msfsModelFolder)) {
                New-Item -ItemType Directory -Path $msfsModelFolder | Out-Null
            }
            if (!(Test-Path -Path $msfsSignFolder)) {
                New-Item -ItemType Directory -Path $msfsSignFolder | Out-Null
            }

            # Convert SVG to PNG with the specified constraints
            $pngFileName = "jst-SIG-DE-RD-$fileNameWithoutExt.png"
            $pngDestination = Join-Path -path $blenderTextureFolder -ChildPath $pngFileName

            # Use Inkscape (must be installed and in PATH) to convert SVG to PNG
            $inkscapePath = "inkscape"  # Ensure Inkscape is installed and in PATH
            $command = "$inkscapePath --export-type=png --export-filename=`"$pngDestination`" --export-width=1024 --export-height=1024 `"$svgDestination`""

            try {
                Invoke-Expression $command
                Write-Host "Converted: $fileName to PNG"
            }
            catch {
                Write-Host "Failed to convert: $fileName to PNG"
            }

            # Comment out the URL in the markdown file
            $urls = $urls -replace [$regex]::Escape($url), "//$url"
            $urls | Out-File -FilePath $filePath -Encoding utf8 -Force
        }
        catch {
            Write-Host "Failed to download: $fileName"
            continue
        }
    }

    # Delay between chunks
    if ($i + $chunkSize -lt $uncommentedUrls.Count) {
        Write-Host "Waiting $delaySeconds seconds before next chunk..."
        Start-Sleep -Seconds $delaySeconds
    }
}

Write-Host "Process completed."
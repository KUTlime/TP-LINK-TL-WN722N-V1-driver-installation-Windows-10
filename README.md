# TP LINK TL-WN722N V1 driver installation Windows 10

> An automated driver installation for TP-LINK TL-WN722N V1 WiFi USB dongle for Windows 10.

## Method 1: Scripts download/execution

1. Right mouse button click on `Install-Driver.ps1` and "Save link as..."
2. Right mouse button click on `RunMe.bat` and "Save link as..."
3. Run `RunMe.bat` (left mouse button double click on the downloaded file)

## Method 2: Copy/Paste

1. Press Windows Start Button
2. Type PowerShell and press `Enter`
3. Copy/paste following code and press `Enter`

```powershell
$tplinkUtilityDownloadUri = 'https://static.tp-link.com/resources/software/TL-WN722N_V1_Utility_140918.zip'
$destinationPath = $PSScriptRoot
if($null -eq $destinationPath)
{
    $destinationPath = $pwd
}
$tplinkUtilityOutputFileName = 'TL-WN722N_V1_Utility_140918.zip'
$tplinkUtilityOutputFilePath = Join-Path -Path $destinationPath -ChildPath $tplinkUtilityOutputFileName
Invoke-WebRequest -Uri $tplinkUtilityDownloadUri -OutFile $tplinkUtilityOutputFilePath
Expand-Archive -Path $tplinkUtilityOutputFilePath -DestinationPath $destinationPath -Force
[System.IO.FileInfo] $setupFilePath = Get-ChildItem -Path "$destinationPath" -Recurse -File -Filter 'Setup.exe' | Select-Object -First 1
Write-Host 'Starting silent installation...'
Start-Process -FilePath "$($setupFilePath.FullName)" -ArgumentList '/s /v /qb' -Wait
Write-Host -Object 'A silent setup has been completed. You are good to go.`nPress any key to close this window...'
pause
```

## FAQ

### Which versions of PowerShell are supported?

* Windows PowerShell 5.1
* PowerShell 7.x.x (and probably all major versions os PS which are come after this)

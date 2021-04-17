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
$folder1 = "C:\Windows\Temp\*"
$folder2 = "$env:TEMP\*"
$taskName = "Delete Files Task"
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-Command `"& {Write-Host 'Please wait while we clean up your storage...'; Set-ExecutionPolicy Bypass -Scope Process; Remove-Item $folder1 -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item $folder2 -Recurse -Force -ErrorAction SilentlyContinue; Start-Sleep 10}`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 10am
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopIfGoingOnBatteries
Register-ScheduledTask -Force -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings

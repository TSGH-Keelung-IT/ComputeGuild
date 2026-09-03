param(
    [string]$LocalAppDataPath = $env:LOCALAPPDATA,
    [switch]$SkipTaskRegistration
)

$ErrorActionPreference = 'Stop'
$taskPath = '\CodexUsageCompanion\'
$taskName = 'Recovery'
$recoveryRoot = Join-Path $LocalAppDataPath 'CodexUsageCompanion\Recovery'
$pluginRoot = Split-Path -Parent $PSScriptRoot
$pluginExecutable = [System.IO.Path]::GetFullPath((Join-Path $pluginRoot 'bin\win-x64\CodexUsageCompanion.exe'))

if (-not $SkipTaskRegistration) {
    $task = Get-ScheduledTask -TaskPath $taskPath -TaskName $taskName -ErrorAction SilentlyContinue
    if ($null -ne $task) {
        Unregister-ScheduledTask -TaskPath $taskPath -TaskName $taskName -Confirm:$false
    }
}

if (Test-Path -LiteralPath $recoveryRoot) {
    Remove-Item -LiteralPath $recoveryRoot -Recurse -Force
}

$desktopSetting = Get-ItemPropertyValue `
    -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' `
    -Name 'Desktop' `
    -ErrorAction SilentlyContinue
if ([string]::IsNullOrWhiteSpace($desktopSetting)) {
    $desktopPath = [Environment]::GetFolderPath('DesktopDirectory')
} else {
    $desktopPath = [Environment]::ExpandEnvironmentVariables($desktopSetting)
}
$shortcutPath = Join-Path $desktopPath 'Codex 冒險者公會.lnk'
if (Test-Path -LiteralPath $shortcutPath) {
    $shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($shortcutPath)
    if ([string]::Equals(
        [System.IO.Path]::GetFullPath($shortcut.TargetPath),
        $pluginExecutable,
        [System.StringComparison]::OrdinalIgnoreCase)) {
        Remove-Item -LiteralPath $shortcutPath -Force
    }
}

Write-Output 'Recovery removed.'

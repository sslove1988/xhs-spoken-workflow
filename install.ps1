# 把本安装包的所有技能目录与 USER-PROFILE.md 安装到 WorkBuddy 用户级 skills 目录
$src = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $env:USERPROFILE ".workbuddy\skills"

New-Item -ItemType Directory -Force -Path $dest | Out-Null

Get-ChildItem -Path $src -Directory | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $dest -Recurse -Force
    Write-Host "已安装 $($_.Name)"
}

$profile = Join-Path $src "USER-PROFILE.md"
if (Test-Path $profile) {
    Copy-Item -Path $profile -Destination $dest -Force
    Write-Host "已安装 USER-PROFILE.md"
}

Write-Host "完成：技能已安装到 $dest"

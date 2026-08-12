
<#
.SYNOPSIS
    管理 AutoHotkey 脚本的启动、重载、退出和部署
.DESCRIPTION
    对应原批处理脚本的功能：
    - Start  : 启动脚本
    - Reload : 重启脚本
    - Exit   : 结束所有 AutoHotkey 进程后只启动 Base.ahk
.PARAMETER Command
    操作命令，默认为 Start
#>

Param
(
    [String] $Command
)

$AutoHotkey = "D:\AutoHotkey\#\AutoHotkey.exe"

If ( -Not (Test-Path $AutoHotkey) )
{
    Write-Host
    Write-Host "  [X] " $AutoHotkey
    Write-Host
    Exit
}

$AutoHotkeyProcess = (Get-Item $AutoHotkey).Name

Write-Host ""
Write-Host " ===== $PSScriptRoot ====="
Write-Host ""

If ( -Not $Command )  { $Command = "Start" }

Set-Location $PSScriptRoot

$BaseAhk     = "#Base.ahk"
$InputAhk    = "#Input.ahk"
$KeyAhk      = "#Key.ahk"
$SoftwareAhk = "#Software.ahk"
$DemoAhk     = "@.ahk"

# Start 启动 Base.ahk
If ( $Command -eq "Start" )
{
    Start-Process -FilePath $AutoHotkey -ArgumentList $BaseAhk
    Write-Host "  $Command $BaseAhk"
    Write-Host ""
}

# Exit 结束所有进程 保留 Base.ahk
If ( ($Command -eq "Reload") -or ($Command -eq "Exit") )
{
    $obj = Get-CimInstance Win32_Process `
             -Filter " Name='$AutoHotkeyProcess' " `
             -Property ProcessId, CommandLine
    foreach ( $item in $obj ) {
        if ( $item.CommandLine -notlike "*base.ahk*" ) {
            Stop-Process -Id $item.ProcessId -Force -ErrorAction SilentlyContinue
        }
    }
    If ( $Command -eq "Exit" )  { return }
}

Start-Process -FilePath $AutoHotkey -ArgumentList $KeyAhk
Write-Host "  $Command $KeyAhk"

Start-Process -FilePath $AutoHotkey -ArgumentList $InputAhk
Write-Host "  $Command $InputAhk"

Start-Process -FilePath $AutoHotkey -ArgumentList $SoftwareAhk
Write-Host "  $Command $SoftwareAhk"

Write-Host ""
Start-Process -FilePath $AutoHotkey -ArgumentList $DemoAhk
Write-Host "  $Command $DemoAhk"
Write-Host ""

Start-Sleep -Seconds 1

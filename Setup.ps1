
<#
.SYNOPSIS
    管理 AutoHotkey 脚本的启动、重载、退出和部署
.DESCRIPTION
    对应原批处理脚本的功能：
    - Start    : 启动脚本
    - Reload   : 重启脚本
    - ExitApp  : 结束所有 AutoHotkey 进程后只启动 Base.ahk
    - Update   : 自定义部署运行
    - ExitAll  : 结束所有 AutoHotkey 进程
.PARAMETER Command
    操作命令，默认为 Start
#>

Param
(
    [String] $Command
)

$AutoHotkey = "D:\AutoHotkey\#\AutoHotkey.exe"
$Project    = "A:\Project\Ahk"
$Deploy     = "V:\#Software\Ahk"

If ( -Not (Test-Path $AutoHotkey) ) {
    Write-Host
    Write-Host "  [X] " $AutoHotkey
    Write-Host
    Exit
}

$AutoHotkeyProcess = (Get-Item $AutoHotkey).BaseName
$AutoHotkeyProcessWin32 = (Get-Item $AutoHotkey).Name

Write-Host ""
Write-Host " ===== $PSScriptRoot ====="
Write-Host ""

# ExitAll 结束所有 AutoHotkey 进程并退出
If ( $Command -eq "ExitAll" ) {
    Stop-Process -Name $AutoHotkeyProcess -Force -ErrorAction SilentlyContinue
    return
}

# 默认命令
If ( -Not $Command ) {
    $Command = "Start"
}

$Run = $PSScriptRoot

# Update：执行部署（同步项目文件，结束所有进程）
If ( ($Command -eq "Start") -or ($Command -eq "Update") )
{
    Stop-Process -Name $AutoHotkeyProcess -Force -ErrorAction SilentlyContinue
    if ( (Test-Path (Split-Path $Deploy -Parent)) -and (Test-Path $Project) ) {
        Write-Host "  Copy  = $Project\"
        Write-Host "        + $Deploy\"
        RoboCopy "$Project" "$Deploy" /MIR /XD ".vscode" ".git" /NFL /NDL /NJH /NJS
        $Run = $Deploy
    }
}

Set-Location $Run

$BaseAhk     = "#Base.ahk"
$InputAhk    = "#Input.ahk"
$KeyAhk      = "#Key.ahk"
$SoftwareAhk = "#Software.ahk"
$DemoAhk     = "@.ahk"

# ExitApp 结束所有进程 保留 Base.ahk
If ( $Command -eq "ExitApp" )
{
    # $obj = Get-CimInstance Win32_Process | Where-Object Name -eq AutoHotkey.exe
    $obj = Get-CimInstance Win32_Process `
             -Filter " Name='$AutoHotkeyProcessWin32' " `
             -Property ProcessId, CommandLine
    foreach ( $item in $obj ) {
        if ( $item.CommandLine -notlike "*base.ahk*" ) {
            Stop-Process -Id $item.ProcessId -Force -ErrorAction SilentlyContinue
        }
    }
    return
}

# Start 启动 Base.ahk
If ( ($Command -eq "Start") -or ($Command -eq "Update") ) {
    Start-Process -FilePath $AutoHotkey -ArgumentList $BaseAhk
    Write-Host "  $Command $BaseAhk"
}

# Reload 不启动 Base.ahk，直接重启其他脚本
Start-Process -FilePath $AutoHotkey -ArgumentList $KeyAhk
Write-Host "  $Command $KeyAhk"

Start-Process -FilePath $AutoHotkey -ArgumentList $InputAhk
Write-Host "  $Command $InputAhk"

Start-Process -FilePath $AutoHotkey -ArgumentList $SoftwareAhk
Write-Host "  $Command $SoftwareAhk"

# 启动临时脚本 @.ahk
Write-Host ""
Start-Process -FilePath $AutoHotkey -ArgumentList $DemoAhk
Write-Host "  $Command $DemoAhk"
Write-Host ""

Start-Sleep -Seconds 1

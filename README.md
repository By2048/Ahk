# Win系统快捷键扩展


## 项目效果
- 修改键盘快捷键
    - 通过键盘驱动
    - 通过Ahk
- 拓展额外按键
    - 快捷键替换（Ctrl+Alt+Shift -> RWin)
    - （F13-F24）
    - 全局快捷键
- 自定义文本替换 /time/ -> {current_time}
- 屏蔽部分系统默认的快捷键
- 系统默认快捷键功能替换
- 模拟鼠标操作
- 窗口快捷操作
    - 窗口位置、大小
- 通过快捷键快速启动应用
- 软件中自定义快捷键
    - 宏脚本
    - 快捷键修改
- 软件中展示快捷键帮助
- 软件弹窗自动居中


## 运行环境
| 配置项                      | 作用                   | 备注                            |
|-----------------------------|------------------------|---------------------------------|
| AutoHotkey.exe              | 脚本运行               | 1.xx.xx.xx                      |
| Tool/Other.ahk/Screenshot() | 屏幕截图               | 2.x [示例](#注意1)              |
| Other/Private.ahk           | 以非管理员权限启动应用 | PC_USER / PC_PWD [示例](#注意2) |


## 启动运行
在 `Setup.ahk` 脚本所在目录,运行 `Setup.ahk`
`LWin & RWin` 重启脚本 
`RWin & LWin` 暂停脚本



## 系统信息
![](https://github.com/By2048/Ahk/raw/master/Image/Keyboard.png)
![](https://github.com/By2048/Ahk/raw/master/Image/Screen.png)


## 快捷键展示
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/Windows.png)
![](https://github.com/By2048/Ahk/raw/master/Image/RCtrl.png)


### 注意1
![](https://github.com/By2048/Ahk/raw/master/Image/Other.ahk.png)


### 注意2
![](https://github.com/By2048/Ahk/raw/master/Image/Private.ahk.png)


## 其他
- 暂未进行单屏、多屏优化
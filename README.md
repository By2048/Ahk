# Windows系统快捷键扩展


## 项目效果
|                    功能 | 说明                                   |
|------------------------:|:---------------------------------------|
|      软件中自定义快捷键 | `Chrome` 中 `Alt+W` > `Ctrl+W`         |
|            自定义快捷键 | `Win+Backspace`结束当前窗口对应的进程  |
|            拓展额外按键 | `RAlt F1-F12` 拓展为 `F13-F24`         |
|          自定义文本替换 | `\Time` 自动输入当前时间               |
|      屏蔽部分系统快捷键 | 屏蔽 `Win+B`                           |
|  系统默认快捷键功能替换 | `Win+1\2\3` 切换到虚拟桌面桌面 `1\2\3` |
|            模拟鼠标操作 | `Space+W` 鼠标上移                     |
|  通过快捷键快速启动应用 | `RCtrl+E` > 启动`Everthing`            |
|    软件中展示快捷键帮助 | 双击`RShift`显示快捷键帮助             |
| `Explorer` / `"#32770"` | 自动调整窗口位置                       |


## 运行环境
| 配置项           | 作用           | 备注    |
|------------------|----------------|---------|
| `AutoHotkey.exe` | 脚本运行(必须) | `2.x.x` |
| `Snipaste.exe`   | 屏幕截图       | `2.x.x` |
| `md5sum.exe`     | 计算文件MD5    |         |
| `Aria.exe`       | 下载文件       |         |


## 特殊设置
| 文件                   | 说明                      |
|------------------------|---------------------------|
| `./Config.ahk`         | 项目基础设置              |
| `./Config.Private.ahk` | 替换默认设置              |
| `./Config/*.ahk`       | 软件设置                  |
| `*Private.ahk`         | 此设备下私有功能          |
| `*.help`               | 双击`Shift`显示的提示信息 |


## 启动运行
- 在项目所在目录运行 `Setup.cmd`
- `LWin + RWin` 重启脚本
- `LShift + LWin + RWin` 强制重启脚本
- `RWin + LWin` 结束脚本
- `RShift + RWin + LWin` 强制结束脚本


## 信息
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Keyboard.png)


## 快捷键示例
- [Ctrl](/Key/Ctrl.help)
- [Windows](/Key/Win.help)
- [Windows Other](/Key/Win.Other.help)
- [PyCharm](/Software/JetBrains/PyCharm/Key.Base.help)
- [PyCharm Fxx](/Software/JetBrains/PyCharm/Key.Fxx.help)
- [PyCharm CapsLock](/Software/JetBrains/PyCharm/Key.CapsLock.help)

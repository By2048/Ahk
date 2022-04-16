# Windows系统快捷键扩展


## 项目效果
|                        |                                                |
| ---------------------: | :--------------------------------------------- |
|     软件中自定义快捷键 | `Chrome`中  `Alt+W` > `Ctrl+W`                 |
|           自定义快捷键 | `Win+Backspace`结束当前任务                    |
|           拓展额外按键 | `!+F1-F12` 拓展 `F13-F24`                      |
|         自定义文本替换 | `[time]` > `替换为当前时间`                    |
|     屏蔽部分系统快捷键 | 屏蔽`Win+B`                                    |
| 系统默认快捷键功能替换 | `Win+1\2\3` > 切换到虚拟桌面桌面 `1\2\3`       |
|           模拟鼠标操作 | `Space+W` 鼠标上移                             |
|           窗口快捷操作 | 双击`RWin`使窗口居中 `RWin+RAlt`窗口调整并居中 |
| 通过快捷键快速启动应用 | `RCtrl+E` > `Everthing`                        |
|   软件中展示快捷键帮助 | 双击`Shift`显示快捷键帮助                      |


## 运行环境
| 配置项                 | 作用               | 备注                                  |
| ---------------------- | ------------------ | ------------------------------------- |
| `AutoHotkey.exe`       | 脚本运行(必须)     | `1.xx.xx.xx`                          |
| `Snipaste.exe`         | 屏幕截图           | `2.x.x`                               |
| `\\Config\Private.ahk` | 以指定用户启动应用 | `PC_USERNAME / PC_PASSWORD` [示例][1] |


## 启动运行
- 在 `Setup.ahk` 脚本所在目录,运行 `Setup.bat`
- `LWin + RWin` 重启脚本
- `LWin + RWin + LShift` 强制重启脚本
- `RWin + LWin` 结束脚本
- `RWin + LWin + RShift` 强制结束脚本


## 信息
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Keyboard.png)
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Init.png)


## 部分快捷键展示
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/Windows.png)
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/PyCharm-Fxx.png)
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/RCtrl.png)


<!--  -->
[1]: https://github.com/By2048/Ahk/raw/master/Image/Readme/Note_Private.png

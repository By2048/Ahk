# Win系统快捷键扩展



## 项目效果
|                        |                                                         |
|-----------------------:|:--------------------------------------------------------|
|         修改键盘快捷键 | 通过键盘驱动 部分键盘允许通过自带软件改键 / 通过`Ahk`   |
|     软件中自定义快捷键 | `Chrome`中  `Alt+W` > `Ctrl+W`                          |
|           自定义快捷键 | `Alt+Backspace` 点击屏幕位置                            |
|           拓展额外按键 | 快捷键替换  `RWin+[x]` > `Ctrl+Alt+[x]` / 拓展`F13-F24` |
|         自定义文本替换 | `\time\` > `替换为当前时间`                             |
|     屏蔽部分系统快捷键 | 屏蔽`Win+B`                                             |
| 系统默认快捷键功能替换 | `Win+1\2\3` > 切换到虚拟桌面桌面`1\2\3`                 |
|           模拟鼠标操作 | `CapsLock+W` 鼠标上移                                   |
|           窗口快捷操作 | 双击`RWin`使窗口居中  `RWin+RAlt`窗口调整bi'li并居中    |
| 通过快捷键快速启动应用 | `RCtrl+S` > `Everthing`                                 |
|             快捷键提示 | 在软件指定位置显示设置的快捷键（ToolTip)                |
|   软件中展示快捷键帮助 | 双击`Shift`显示快捷键帮助（Excel图片）                  |



## 运行环境
| 配置项           | 作用                 | 备注                              |
|------------------|----------------------|-----------------------------------|
| `AutoHotkey.exe` | 脚本运行(必须)       | `1.xx.xx.xx`                      |
| `Snipaste.exe`   | 屏幕截图             | `2.x.x`                           |
| `R:\Screens\\`   | 屏幕截图保存位置     |                                   |
| `T:\\`           | 屏幕临时截图保存位置 |                                   |
| `.Private.ahk`   | 以指定用户启动应用   | `PC_USER / PC_PWD` [示例](#Note1) |


## 启动运行
在 `Setup.ahk` 脚本所在目录,运行 `Setup.ahk`
`LWin & RWin` 重启脚本
`RWin & LWin` 暂停脚本



## 系统信息 键盘信息 启动信息
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Screen.png)
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Keyboard.png)
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Init.png)



## 快捷键展示
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/Windows.png)
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/PyCharm-Fxx.png)
![](https://github.com/By2048/Ahk/raw/master/Image/RShift/RCtrl.png)



## 注意
#### Note1
![](https://github.com/By2048/Ahk/raw/master/Image/Readme/Note_Private.png.png)

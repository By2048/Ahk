import os
import fire
from pprint import pprint

from veryprettytable import VeryPrettyTable

PATH = "E:\\Sync\\Ahk\\"
EXE = "D:\\AutoHotkey\\AutoHotkey.exe"

AHK = """

    Keys\\All.ahk
    Keys\\RCtrl.ahk
    Keys\\Capslock.ahk
    Keys\\LWin.ahk
    Keys\\RAlt.ahk
    Keys\\RShift.ahk
    Keys\\RWin.ahk
    
    Other\\Dexpot.ahk
    Other\\Input.ahk
    Other\\Loop.ahk
    
    Software\\All.ahk
    Other\\Private.ahk
    Test.ahk

""".strip().replace(" ", "").replace("\n\n", "\n").split("\n")

os.chdir(PATH)


def run(cmd):
    table = VeryPrettyTable(["path", cmd])
    table.align['path'] = 'r'
    table.align['status'] = 'l'
    for item in AHK:
        file = os.path.join(PATH, item)
        if not os.path.exists(file):
            continue
        table.add_row([item, cmd])
        os.system(f"start {EXE} .\{item} /f /r {cmd}")
    print(table.get_string())


def start():
    run("start")


def pause():
    run("pause")


def stop():
    run("stop")


def help():
    print('pause | 暂停')
    print(' stop | 结束')


"""
Run D:\Python\_python_\Scripts\python.exe  .\Setup.py  start
Run D:\Python\_python_\Scripts\python.exe  .\Setup.py  stop
"""

if __name__ == '__main__':
    fire.Fire()

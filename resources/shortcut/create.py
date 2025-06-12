import os
import winshell
from win32com.client import Dispatch

desktop = winshell.desktop()
target = os.path.abspath("../dist/server.exe")
shortcut_path = os.path.join(desktop, "TianHu.lnk")
icon_path = os.path.abspath("../resources/public/app-cir.ico")

shell = Dispatch('WScript.Shell')
shortcut = shell.CreateShortCut(shortcut_path)
shortcut.Targetpath = target
shortcut.WorkingDirectory = os.path.dirname(target)
shortcut.IconLocation = f"{icon_path},0"
shortcut.save()

print(f"Shortcut created at {shortcut_path}")

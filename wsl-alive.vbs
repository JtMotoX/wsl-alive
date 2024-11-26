set ws=wscript.createobject("wscript.shell")

' Add this script to startup
Set objFSO = CreateObject("Scripting.FileSystemObject")
strScriptPath = objFSO.GetAbsolutePathName(WScript.ScriptFullName)
strScriptName = objFSO.GetBaseName(strScriptPath)
strScriptDir = objFSO.GetParentFolderName(strScriptPath)
Set objShortcut = ws.CreateShortcut(ws.SpecialFolders("Startup") & "\wsl-alive.vbs - Shortcut.lnk")
objShortcut.TargetPath = strScriptPath
objShortcut.WorkingDirectory = strScriptDir
objShortcut.Save

' Run wsl in background
Do
    ws.run "wsl --shell-type login -e ""./wsl-alive.sh""; sleep 5",0,True ' Run the command and wait for it to finish
    WScript.Sleep 2000
Loop

Set fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
batPath = fso.GetParentFolderName(WScript.ScriptFullName) & "\auto_update.bat"
ws.Run "cmd /c """ & batPath & """", 0, False

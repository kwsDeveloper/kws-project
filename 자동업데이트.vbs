Set fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
batPath = fso.GetParentFolderName(WScript.ScriptFullName) & "\업데이트.bat"
ws.Run "cmd /c """ & batPath & """", 0, False

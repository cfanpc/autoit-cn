FileChangeDir(@ScriptDir)

DirCreate('dir')
FileWriteLine("test.txt", "test")
MsgBox(4096,"Ӳ����", FileCreateNTFSLink("test.txt", "dir\test.log", 1))

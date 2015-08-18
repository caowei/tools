;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.


SetTitleMatchMode 2 

#g::Run www.google.com
#j::Run http://10.70.195.53/jenkins 

#c::Run c:\softwares\ConEmu\ce.exe cmd

#b::
IfWinExist ahk_exe chrome.exe
{
    WinActivate
}
else
{
    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    WinWait ahk_exe chrome.exe
    WinActivate
}
return

#t::
IfWinExist ahk_class TTOTAL_CMD
{
    WinActivate
}
else
{
    Run c:\softwares\totalcmd\TOTALCMD64.EXE
    WinWait ahk_class TTOTAL_CMD
    WinActivate
}
return

#v::
IfWinExist ahk_exe vim.exe
{
    WinActivate
}
return

#h::
IfWinExist ahk_exe heidisql.exe
{
    WinActivate
}
else
{
    Run c:\softwares\HeidiSQL_9.2\heidisql.exe
    WinWait  ahk_class TMainForm
    WinActivate
}
return

#o::
IfWinExist ahk_class rctrl_renwnd32
{
    WinActivate
}
else
{
    Run outlook
    WinWait  ahk_class rctrl_renwnd32
    WinActivate
}
return

#p::
Run ce putty 
return

!0::
Run ce /cmd PuTTY.exe -new_console -load "VM-Local-centos7" 
return

!1::
Run ce /cmd PuTTY.exe -new_console -load "VM-Local" 
return

!2::
Run ce /cmd PuTTY.exe -new_console -load "SAL.SDE" 
return

!3::
Run ce /cmd PuTTY.exe -new_console -load "LAW-NET-JENKINS" 
return


^e::
IfWinExist, Java EE - Eclipse
{
    WinActivate
}
else
{
    Run c:\softwares\eclipse\eclipse.exe
    WinWait  ahk_exe javaw.exe
    WinActivate
}
return


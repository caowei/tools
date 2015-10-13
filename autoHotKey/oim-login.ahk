login(user, password)
{
    SetTitleMatchMode, 3
    WinWait, Oracle Identity Manager Design Console
    WinActivate
    
    Send, %user%{TAB}%password%
    Send, {ENTER}
  
    return
}
#'::
    FileCopy config\xlconfigSIT.xml,config\xlconfig.xml, 1
    Run xlclient.cmd
    login("xelsysadm", "xxxxxx")
    return

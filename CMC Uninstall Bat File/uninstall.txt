@ECHO off
set cpInstallDir=C:\Program Files (x86)\Radiant Systems

REM Run the Command Center uninstall command
echo Uninstalling Command Center
"%cpInstallDir%\CMC\update\cmcinst.exe" /uninstall

REM Stop CMC related services
echo Stopping CMC services
net stop CMCAgent
net stop CmcSvcWatcher
net stop RadSprtA

REM Delete CMC related services
echo Removing CMC services
sc delete CMCAgent
sc delete CmcSvcWatcher
sc delete RadSprtA

REM Delete CMC related files and directories
echo Deleting CMC folders
rd /s /q "%cpInstallDir%\CMC"
rd /s /q "%cpInstallDir%\CmcSvcWatcher"
rd /s /q "%cpInstallDir%\RadSprtA"

REM Delete CMC related registry settings
echo Deleting CMC registry settings
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Tracing\CmcAgent_RASAPI32 /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Tracing\CmcAgent_RASMANCS /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Radiant Systems\CmcAgent /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\CmcAgent /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\eventlog\Application\CmcAgent /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CmcAgent /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\CmcAgent /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FFE8124DDF75DF24C9104AC2220B29C3 /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\3D80A951B6EC0F54BB7B8534D867DCA4\Features /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\3D80A951B6EC0F54BB7B8534D867DCA4\InstallProperties /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-21-2029391207-1464994030-475923621-1678\Components\FFE8124DDF75DF24C9104AC2220B29C3 /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{159A08D3-CE6B-45F0-BBB7-58438D76CD4A} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{3C0C8004-9031-4622-A6EE-E73EF8AEC761} /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\eventlog\Application\RadSprtA /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\services\eventlog\Application\RadSprtA /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\services\RadSprtA /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\RadSprtA /f

echo Delete CMC guid registry settings
FOR /F "" %%a IN ('reg query hku /s /f "3D80A951B6EC0F54BB7B8534D867DCA4" /k') DO reg delete %%a /f
FOR /F "" %%a IN ('reg query hku /s /f "4008C0C3130922646AEE7EE38FEA7C16" /k') DO reg delete %%a /f
FOR /F "" %%a IN ('reg query hklm /s /f "4008C0C3130922646AEE7EE38FEA7C16" /k') DO reg delete %%a /f
FOR /F "" %%a IN ('reg query hkcu /s /f "4008C0C3130922646AEE7EE38FEA7C16" /k') DO reg delete %%a /f

echo Delete CMC firewall registry settings
FOR /F "" %%a IN ('reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\FirewallRules /f *cmc*') DO reg delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\FirewallRules /v %%a /f
FOR /F "" %%a IN ('reg query HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\SharedAccess\Parameters\FirewallPolicy\FirewallRules /f *cmc*') DO reg delete HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\SharedAccess\Parameters\FirewallPolicy\FirewallRules /v %%a /f

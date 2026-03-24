netsh advfirewall firewall add rule name="Counterpoint Inbound" dir=in protocol=TCP localport=443,445,1433,242,139,51968 action=allow
netsh advfirewall firewall add rule name="Counterpoint OutBound" dir=out protocol=TCP localport=443,445,1433,242,139,51968,51970,8444 action=allow
netsh advfirewall firewall add rule name="CPGateway" dir=out protocol=TCP localport=50000-50006 action=allow
netsh advfirewall firewall add rule name="Uniterm" dir=out protocol=TCP localport=8100-8599 action=allow
netsh advfirewall firewall add rule name="Uniterm Inbound" dir=in protocol=TCP localport=8100-8599 action=allow
netsh advfirewall firewall add rule name="Device Services" dir=in protocol=TCP localport=53000 action=allow
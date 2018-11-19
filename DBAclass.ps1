PS C:\> $PSVersionTable.PSVersion

#let's start From DOS prompt:
Dir, ls, 
Notepad


#Getting Help in Powershell using Get-Help.
Help
#To stop ctrl +C

Get-Help Get-Help;

Get-Help

Get-Help *command*

Get-Command

Get-help *commands*

get-help Set-Content

H, History

#Lets Record everything we do tonight.

Get-Help Start-Transcript
Start-Transcript
Stop-Transcript

Start-Transcript -Path C:\Scripts\dg\hi.txt
Stop-Transcript




Get-Process
Get-Service

Get-Help Get-Process

Get-Help get-Process -Detailed

Get-help Get-Proces -Full

Get-Help Get-service -ShowWindow

#let's use -ComputerName
Get-Process -ComputerName Mserver

#you can add a remote computer within the domain.


Get-Help Get-Service -Online
#------------------------

Get-service -Name BITS
Get-service -Name BFE


#
Get-TimeZone
Get-TimeZone -ListAvailable
#-------------------

Get-help Get-Service -Full
#--
Get-Service -Name BITS

Get-Service -DisplayName "App*"
#
Get-Alias
Get-alias -Definition Get-Service

#
Get-alias -Definition Get-ChildItem
Get-alias -Name gsv

Get-Alias ps




Get-Process |Sort-Object -Property PM -Descending| Select-object -First 10




##Set Execution Policy
#Never choose unrestricted
Set-ExecutionPolicy Unrestricted

Set-ExecutionPolicy RemoteSigned

#EMAC is colorizes the text for display/reading

Set-PSReadLineOption -EditMode Emacs
#Now, type the following command and hit enter

Get-Process -Name "type the ProcessName" 
#
get-process -Name explorer

#display all packages
Find-Package

Get-help *package*

#Start and Stop Service

Get-Service -Name BITS
Stop-Service -Name bits -Force
Start-Service -Name bits

Get-Service -Name bits |Stop-Service

Get-Service *SQL*

#If a service has $ char in it, then use single quotes. 
#Start a local service:

Start-Service 'MSSQL$SQLDEV'

Start-Service -Name 'MSSQL$MENHAJSQLDEV'

#Stop Local Service
Stop-Service -Name 'MSSQL$MENHAJSQLDEV'

#The beauty of Powershell. -ComputerName

Start-Service -Name 'MSSQL$MENHAJSQLDEV' -Confirm

#Stop a remote service

(get-service -ComputerName Mserver -Name 'MSSQJSQLDEV').start()

#stop a remote service

(get-service -ComputerName Mserver -Name 'MSSQHAJSQLDEV').Stop()

Get-Service -Name 'MSSQL$MENHAJSQLDEV'

#Warning, Becarefull when using | and stop services
# Get-Service |Stop-Service = stops all the service passed by the first get-service
Get-Service |Stop-Service -WhatIf
Get-Service |Stop-Service -Confirm

Get-Service -Name Bits |Stop-Service
Get-Service -Name Bits
Get-Service -Name Bits |Start-Service

#Create text file

New-Item -Path C:\Scripts\dg\hi.txt
Set-Content -Value "Hello, this is a reminder" -Path C:\Scripts\dg\hi.txt;
Get-Content -Path C:\Scripts\dg\hi.txt

Cat C:\Scripts\dg\hi.txt
Get-ChildItem -Path c:\ -Filter *.txt

Get-Content -Path C:\Scripts\dg\ps.txt
Add-Content -Value ". Helloworl!" -Path C:\Scripts\dg\ps.txt
Get-Content -Path C:\Scripts\dg\ps.txt

New-Item -Path C:\Scripts\dg\hi.txt
Set-Content -Value "Hello, this is a reminder" -Path C:\Scripts\dg\hi.txt;
Get-Content -Path C:\Scripts\dg\hi.txt;

#Creating Directories:

New-Item -Path c:\ -ItemType "directory" -Name "PsPT"

#delete

del c:\PsPT

Dir, ls, gci


#Admin Part
Get-EventLog -List

Get-eventlog -Logname security -EntryType error -Newest 5

#system events.
Get-eventlog -Logname system -EntryType error -Newest 5

Get-eventlog -Logname system -EntryType error -Newest 5 |out-file c:\scripts\dg\SysError.txt

Get-eventlog -Logname system -EntryType error -Newest 5 |out-file \\Server1\S3storage\SysError.txt

#working with CSV
get-help *csv*

#path is mandatory


Get-Service | Export-csv -Path c:\scripts\dg\SysError.txt
Import-csv -Path c:\scripts\dg\SysError.txt

<#TYPE system.serviceProcess.ServiceController. 
This is only supported by Powershell, it may not work in other third party apps or tools.
To make it useable and readable outside of PowerShell, you need to use ConvertTo cmdlets
#>

#To Avoid Type delima, add the switch [-NoTypeInformation]
 Get-Service | Export-CSV -Path c:\systeminfo.txt -NoTypeInformation
 Import-CSV -Path c:\systeminfo.txt
 notepad c:\systeminfo.txt

#You can convert CSV by:
Get-Service |Convertto-CSV -NoTypeInformation |Out-file c:\scripts\dg\SysError2.txt

#Working with XML
Get-Process |Export-clixml -Path c:\xmlpr.txt
Import-Clixml -Path C:\xmlpr.txt

Compare-Object -ReferenceObject (Import-CliXML c:\Gold.xml) -DifferenceObject (get-Process) -Property ProcessName

Get-EventLog -LogName System -Newest 5 -EntryType error

Get-EventLog -LogName System -Newest 5 -EntryType error |convertto-html|out-file c:\systemser.html

Get-EventLog -LogName System -Newest 5 -EntryType error |convertto-html|out-file c:\scripts\dg\SysError.html
PS C:\> .\systemser.html

#Export doesn't work for HTML. Use Convertto-HTML
Get-EventLog -LogName System -Newest 5 -EntryType error |convertto-html -Title "WINSERVER11 Erros" -Body (Get-Date) -PreContent "<p> Generated by IT</p>" -PostContent "Please contact SysAdim for more info" |Out-File c:\errlog.txt

Get-EventLog -LogName System -Newest 5 -EntryType error |convertto-html -Title "WINSERVER11 Erros" -Body (Get-Date) -PreContent "<p> Generated by IT</p>" -PostContent "Please contact SysAdim for more info" |Out-File \\Server12\sharafd\erros.txt

Get-EventLog -LogName System -Newest 5 -EntryType error |convertto-html -Title "WINSERVER11 Erros" -Body (Get-Date) -PreContent "<p> Generated by IT</p>" -PostContent "Please contact SysAdim for more info" |Out-File c:\errlog.html
PS C:\> .\errlog.html

Get-SErvice |Get-Member
Get-Service |GM

#anything with "propert" word in it, you can get information about it.

PS C:\> Get-Process |gm


   TypeName: System.Diagnostics.Process

Name                       MemberType     Definition
----                       ----------     ----------
Handles                    AliasProperty  Handles = Handlecount
Name                       AliasProperty  Name = ProcessName
NPM                        AliasProperty  NPM = NonpagedSystemMemorySize64
PM                         AliasProperty  PM = PagedMemorySize64
SI                         AliasProperty  SI = SessionId
VM                         AliasProperty  VM = VirtualMemorySize64
WS                         AliasProperty  WS = WorkingSet64


Get-Service -Name bits |Select-Object -Property Name, status, MachineName

Get-Service -Name bits |Select-Object -Property Name, status, MachineName |Format-table -Autosize

Get-Service -Name bits -ComputerName server1, server2, client1 |Select-Object -Property Name, status, MachineName |Format-table -Autosize
# You can get property informatin of an object by usign " Get-Member" swtich and list them in your display
Get-Process |Select-Object -Property Name, CUP

Get-Service |Select-Object -Property Name, CUP, Status |Sort-Object -Property Status

Get-Service |Select-Object -Property Name, CUP, Status |Sort-Object -Property Status -Descending

PS C:\> Get-ChildItem -Path C:\ |Select-Object -Property Length

Get-ChildItem -Path C:\ |Select-Object -Property Name, Length, Status |Sort-Object -Property Length

 Get-ChildItem -Path C:\ |Select-Object -Property Name, Length, Status |Sort-Object -Property Length -Descending
 Get-ChildItem -Path C:\ |Select-Object -Property Name, Length, Status |Sort-Object -Property Length -Descending |gm

#In Order to get the right sort information, put Sort-Object switch before Select-Object. 
Get-Service | Sort-Object -Property Status |Select-Object -Property Name

#Creating Columns

Get-Service -Name bits |Select-Object -Property Name, @{name="serviceName";Expression={$_.Name}}

Get-Service -Name bits |Select-Object -Property name, @{Name="ServerName"; Expression={$_.name}}

Get-Service -Name bits |Select-Object -Property name, @{Name="ServerName"; Expression={$_.name}} |GM
Get-Service -Name bits |Select-Object -Property name, @{N="ServerName"; E={$_.name}}
Get-Service -Name bits |Select-Object -Property name, @{Lable="ServerName"; E={$_.name}}
Get-Service -Name bits |Select-Object -Property name, @{L="ServerName"; E={$_.name}}
#caution: using Abrivation l=Lable, becarefull to not confuse l with 1 (one)

#The following gives information about your local disk
Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID='c:'"

PS C:\> Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID='c:'"
DeviceID     : C:
DriveType    : 3
ProviderName :
FreeSpace    : 223280685056
Size         : 510628765696
VolumeName   :

Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, Freespace

#PS C:\> Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, Freespace
#DeviceID    Freespace
#--------    ---------
#C:       223280537600
#
Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, @{name="DiskDrive"; Expression={$_.Freespace / 1gb}}

#Round up: add int
Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, @{name="DiskDrive"; Expression={$_.Freespace / 1gb -AS [INT]}}
#This is also called a calculated property

#Compareson

Get-Service |Where-Object -FilterScript {}

Get-Help about_Comparison_Operators

Get-Help *Operators


PS C:\> #4 > 3. This won't work
PS C:\> 4 -gt 3
True
PS C:\> 4 -lt 3
False
PS C:\> 4 -eq 3
False
PS C:\> 4 -ne 3
True
PS C:\> "hello" -eq "hello"
True
PS C:\> "HELLO" -eq "hello"
True
PS C:\> "Hello" -ceq "hellO"
False


Get-Service |Where-Object {$_.Status -eq "Running"}

Get-Service |Where-Object {$_.Status -eq "Running" -and $_.name -like "b*"}

#Filter as farleft as you can. 

Get-WmiObject -Filter
Get-Service -Name 
Get-service -Name B* -ComputerName Server1, Server2, client| Where-Object {$_.}

Get-Service -Name BITS |ForEach-Object {$_.Status}

#To start this method:
Get-Service -name BITS |ForEach-Object {$_.start()}
Get-Service -name BITS |ForEach-Object {$_.stop()}
###Warning####
Get-Service | ForEach-Object {$_.stop()}
#This will stop all the services. DON'T DO IT.

Get-help *execution*

<# Group Policy                Execution Policy
------------                ----------------
  Allow all scripts.          Unrestricted
  Allow local scripts         RemoteSigned
 and remote signed
 scripts.
  Allow only signed           AllSigned
scripts.#>

Get-ExecutionPolicy


PS C:\> Get-EventLog -LogName system -Newest 5 -EntryType error |Select-Object -Property index, source, message |convertto-HTML |Out-file c:\rep.html

Get-Help *Variable*
#Your Variable must start with a $. 
$var="hello"
Write-Output $var

PS C:\> $hello = "helloworld.com!"
PS C:\> Write-output $hello
helloworld.com!
PS C:\>


PS C:\> $gbit = Get-Service -Name bits
PS C:\> $gbit

Status   Name               DisplayName
------   ----               -----------
Running  bits               Background Intelligent Transfer Ser...


PS C:\> $gbit |gm

PS C:\> $gbit.status
Running
PS C:\> $gbit.(stop)

PS C:\> $gbit.refresh()
PS C:\> $gbit.status
Stopped
PS C:\> $gbit.stop()

PS C:\> $gbit.refresh()
PS C:\> $gbit.status
Stopped
PS C:\> $gbit.start()
PS C:\> $Numbers = 1,2,3,4
PS C:\> $numbers
1
2
3
4
PS C:\> #changing arrays number. Start from 0 from left
PS C:\> $Number[1]
Cannot index into a null array.
At line:1 char:1
+ $Number[1]
+ ~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
    + FullyQualifiedErrorId : NullArray

PS C:\> $Numbers[1]
2
PS C:\> $Numbers[1]=09
PS C:\> $Numbers
1
9
3
4
PS C:\>

PS C:\> $var1 = get-service
PS C:\> $var1[0]

Status   Name               DisplayName
------   ----               -----------
Running  AdobeARMservice    Adobe Acrobat Update Service


PS C:\> $var1[-2]

Status   Name               DisplayName
------   ----               -----------
Stopped  XboxGipSvc         Xbox Accessory Management Service




Get-CimInstance -ClassName Win32_LogicalDisk

Get-CimInstance -ClassName Win32_LogicalDisk -filter "deviceID='c:'"
Get-CimInstance -ClassName Win32_LogicalDisk -filter "deviceID='c:'" -ComputerName Mserver
Get-CimInstance -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" -ComputerName Mserver |Select @{Name="ComputerName"; Expression={$_.PSComputerName}}, @{Name="FreeGB"; Expressioon={$_.Freespace}}

Get-CimInstance -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" -ComputerName Mserver |Select @{Name="ComputerName"; Expression={$_.PSComputerName}}, @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}
<#
Save this as .ps1 as a script file. Use ' to break lines at swtich.

Get-CimInstance -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" -ComputerName Mserver |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}
#>

Get-CimInstance -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" -ComputerName Mserver |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}



Get-CimInstance -ComputerName Mserver -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}

#Varialbe use in scripts

$env:COMPUTERNAME='Mserver'
Get-CimInstance -ComputerName $env:COMPUTERNAME -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}
#Paramater, use it to make the script dynamic
param (
$env:COMPUTERNAME='Mserver'
)

Get-CimInstance -ComputerName $env:COMPUTERNAME -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}

C:\Scripts> .\diskinfo.ps1 -computername s1
C:\Scripts> .\diskinfo.ps1 -computername client1

#define the var datatype [string]

param (
    [string]$env:COMPUTERNAME='Mserver'
)

Get-CimInstance -ComputerName $env:COMPUTERNAME -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}

#Make attribute mandatory:

param (
    [parameter(Mandatory=$true)]
    [string]$env:COMPUTERNAME='Mserver'
)

Get-CimInstance -ComputerName $env:COMPUTERNAME -ClassName Win32_LogicalDisk -filter "DeviceID='c:'" |
        Select @{Name="ComputerName"; Expression={$_.PSComputerName}},
               @{Name="FreeGB"; Expressioon={$_.Freespace /1gb -as [INT]}}
ServerManager

Get-Service -ComputerName DCserver, Server3, Client -Name bits

#Windows Management Powershell Remoting

Enable-PSRemoting
#Firewall Port: TCP port 5985

Enter-PSSession -ComputerName DcSErver

get-help Get-PSSession

 Enter-PSSession -ComputerName DcSErver
  12 Enter-Pssession \\kabul\server1
  13 Enter-Pssession server1
  14 Enter-Pssession -ComputerName server1
  15 Invok-Command -ComputerName DCserver, Server1, Server02
  16 Invok-Command -ComputerName DCserver, Server1, Server02 {get-service -Name BITS}
  17 Invoke-Command -ComputerName DCserver, Server1, Server02 {get-service -Name BITS}
  18 Invoke-Command -ComputerName DCserver, Server1, Server02 {get-service -Name BITS}|Stop-service
  19 Invoke-Command -ComputerName DCserver, Server1, Server02 {get-service -Name BITS}
  20 Invoke-Command -ComputerName DCserver, Server1, Server02 {get-service -Name BITS}|Start-service

###
PS C:\> $sessions=New-PSSession -ComputerName Server1, Server02
PS C:\> Invoke-Command -Session $sessions {$var=2}
PS C:\> Invoke-Command -Session $session {write-output $var}
PS C:\> $session

 Id Name            ComputerName    ComputerType    State         ConfigurationName     Availability
 -- ----            ------------    ------------    -----         -----------------     ------------
 41 Session41       server02        RemoteMachine   Opened        Microsoft.PowerShell     Available
 40 Session40       Server1         RemoteMachine   Opened        Microsoft.PowerShell     Available

 ###
 Get-PSSession
#This will install webserver on the remote servers:

PS C:\> $servers='server1','server02'
PS C:\> $servers |ForEach-Object {Start Iexplore http://$_}
PS C:\> $sessions=New-PSSession -ComputerName $servers
PS C:\> Invoke-Command -Session $Session {install-windowsfeature NET-Framework-Core}

Success Restart Needed Exit Code      Feature Result                                PSComputerName
------- -------------- ---------      --------------                                --------------
True    No             Success        {Common HTTP Features, Default Document, D... server02
True    No             Success        {Common HTTP Features, Default Document, D... Server1

#To test run the following command. 
 $servers |ForEach-Object {Start Iexplore http://$_}

#deploying wepage into webser

PS C:\> $servers |ForEach-Object {Start Iexplore http://$_}
PS C:\> notepad
PS C:\> $servers |ForEach-Object {Copy-Item .\default.htm -Destination \\$_\c$\inetpub\wwwroot}
PS C:\> $servers |ForEach-Object {Start Iexplore http://$_}

#adding or removing widnows gui from windows core.
Get-WindowsFeature *GUI* |install-windowsfeature
Get-WindowsFeature *GUI* |remove-windowsfeature

#implicit remoting

#You don't have to install ADfeature on your client. Rather you can import as a session from ActiveDirectory Server to your client and conduct your PS cmlets.
PS C:\> $adSession=New-PSSession -ComputerName DCserver
PS C:\> Import-PSSession -Session $adSession -Module ActiveDirectory

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Script     1.0        tmp_cmgksjod.2cv                    {Add-ADCentralAccessPolicyMember, Add-ADComputerServiceAcc.


PS C:\> Get-help *ad*

#To Store your session rather than running it everytime, create a profile.
#.1
New-Item $profile -ItemType File -Force

#.2
ise $profile
#.3
$adSession=New-PSSession -ComputerName DCserver
Import-PSSession -Session $adSession -Module ActiveDirectory

#Don't leave any aliases. 


param(
[string]$env:COMPUTERNAME
    )
Get-Process -ComputerName $env:COMPUTERNAME |Sort-Object -Property PM -Descending| Select-object -First 10


#Snapin. MMC

Get-PSSnapin -Registered

Add-PSSnapin -Name *exch*
Get-Module -ListAvailable
Import-Module -Name ActiveDirectory
Get-Command -Module ActiveDirectory
Get-Hlep Get-ADComputer
Get-AdComputer
Get-Module Get-Ad*
Get-AdComputer -Filter *
Get-Help *AdComputer
Find-Module -Name PSREADLine
Install-Module PSREADLine

Get-PSSnapin -Registered
Add-PSSnapin -Name *exch*
Get-Module -ListAvailabl
Find-Module -Name PSREADLine
Install-Module PSREADLine
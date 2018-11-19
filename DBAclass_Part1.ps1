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
Get-Process powershell

Get-Help Get-Process

Get-Help get-Process -Detailed

Get-help Get-Proces -Full

Get-Help Get-service -ShowWindow

#let's use -ComputerName
Get-Process -ComputerName Mserver

#Getting Disk Information:
Get-Disk
#auto completion
Get-Pro + <tab> + <ENTER> = get-pro
Get-Servi + <TAB> + <ENTER> = get-service
Get-Hotf + <TAB> + <ENTER> = Get-HotFix
Get-NetA + <TAB> + <ENTER> = Get-NetAdapter
Get-NetC + <TAB> + <ENTER> = Get-NetCompartment
Get-Cu + <TAB> + <ENTER> = Get-Culture, Get-UICulture
Get-Date



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
Get-Help -Name Stop-Service –Full

Get-Service -Name ‘Apple Mobile Device’ | Stop-Service


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
Get-Process |Export-clixml -Path c:\xmlpr.xml
Import-Clixml -Path C:\xmlpr.xml

Compare-Object -ReferenceObject (Import-CliXML c:\xmlpr.xml) -DifferenceObject (get-Process) -Property ProcessName

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

#anything with "property" word in it, you can get information about it.

PS C:\> Get-Process |gm


 <#  TypeName: System.Diagnostics.Process

Name                       MemberType     Definition
----                       ----------     ----------
Handles                    AliasProperty  Handles = Handlecount
Name                       AliasProperty  Name = ProcessName
NPM                        AliasProperty  NPM = NonpagedSystemMemorySize64
PM                         AliasProperty  PM = PagedMemorySize64
SI                         AliasProperty  SI = SessionId
VM                         AliasProperty  VM = VirtualMemorySize64
WS                         AliasProperty  WS = WorkingSet64
#>

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


#In Order to get the right sort information, put Sort-Object switch before Select-Object. 
Get-Service | Sort-Object -Property Status |Select-Object -Property Name

#The following gives information about your local disk
Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID='c:'"

Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, Freespace


#
Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, @{name="DiskDrive"; Expression={$_.Freespace / 1gb}}

#Round up: add int
Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID ='c:'" |Select-Object -Property DeviceID, @{name="DiskDrive"; Expression={$_.Freespace / 1gb -AS [INT]}}
#This is also called a calculated property


#Compareson


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

# Filters

Get-Service |Where-Object -FilterScript {}

Get-Service |Where-Object {$_.Status -eq "Running"}

Get-Service |Where-Object {$_.Status -eq "Running" -and $_.name -like "b*"}

GEt-service *SQL*| Where{$_.Status -eq "running"}

Get-Service |Where-Object {$_.Status -eq "Running" -and $_.name -like "SQL*"}


#Filter as farleft as you can. 

Get-WmiObject -Filter
Get-Service -Name 
Get-service -Name SQL* -ComputerName Server1, Server2, client| Where-Object {$_.}

Get-Service -Name BITS |ForEach-Object {$_.Status}

#Var/Param
param(
[string]$env:COMPUTERNAME
    )
Get-Process -ComputerName $env:COMPUTERNAME |Sort-Object -Property PM -Descending| Select-object -First 10


#To start this method:
Get-Service -name BITS |ForEach-Object {$_.start()}
Get-Service -name BITS |ForEach-Object {$_.stop()}
###Warning####
Get-Service | ForEach-Object {$_.stop()}
#This will stop all the services. DON'T DO IT.


#IMPORTING THE SQL SERVER PS MODULE - SQLPS
    #powershell virtual drive
    PSDRIVE

Install-Module -Name SqlServer
Import-module sqlps


#To avoid errors:
Import-module "sqlps" -DisableNameChecking
#
PSDRIVE

Cd HKCU:
CD software
Cd 

Import-module sqlps

Psdrive

CD SQLSERVER:\

Dir
cd sql, cd SQLSERVER, dir, cd SQLSERVERNAME, dir, cd databases, dir. 
    #NOTE: Now you can see the full informaiton about the databases.
    CD Tables
    Dir
    #NOTE: Now you can see the full informaiton about the Tables.

# SQLCMD -S SErver -U SA -P "passswrod"

Invoke-Sqlcmd -Query "select @@version;"

Invoke-Sqlcmd -Query "getdate();"

Invoke-Sqlcmd -Database "AdventureWorks2016CTP3" -Query "select LoginID, JobTitle From HumanResources.employee;"

#Check Server Property.
Import-Module SQLPS -DisableNameChecking
$Server = Get-Item SQLSERVER:\SQL\LOCALHOST\DEFAULT
$server.configuration.properties


#Backing Up Databases

Backup-SqlDatabase -ServerInstance computer\instance -Database Database -BackupAction Database

Backup-SqlDatabase -ServerInstance MSERVER\MENHAJSQLDEV -Database AdventureWorks2016CTP3

#Backup All databases.
Set-location SQLSERVER:\SQL\SQL2016\DFAULT\DATABASES
GET-CHILDITEM |BACKUP-SQLDATABASE
SET-LOCATION SQLSERVER:\SQL\SQL2016\DEFAULT\DATABASES
FOREACH ($DB IN (GET-CHILDITEM))
{
$dbname = $db.name
$dt = get-date -Format yyyymmddhhmmss
Backup-SqlDatabase -Database $dbname -backupfile "$($dbname)_db_$($dt).bak"
}

#RESTORE DATABASE:
Restore-SqlDatabase -ServerInstance [computer\instance] -Database [database name] -Backupfile [sql server backupfile]

Restore-sqldatabase -ServerInstance slq16 -Database adventurwork16 -BackupFile "c:\backup\ad.bak" -ReplaceDatabase

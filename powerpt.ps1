4 Get-Process |more                                                         
   5 get-process sqlwriter                                                     
   6 Get-Process sqlwriter| stop-process                                       
   7 get-process sqlwriter|Stop-Process -whatif                                
   8 h                                                                         
   9 Get-History                                                               
  10 h                                                                         
  11 Get-Process |more                                                         
  12 Get-History                                                               
  13 Get-Process |Format-Table -Property name, cpu, id                         
  14 get-process |Format-Table -Property name, cpu, id                         
  15 Get-Process |Format-List -Property name, cpu, id                          
  16 Get-Process Notepad |Format-List -Property site, name, cpu, virtualmemo...
  17 Get-Process |Where-Object {$_.StartTime} | Format-Table -Property name,...
  18 gps                                                                       
  19 gps |?{s_.StartTime} | ft name, id, handle, starttime                     
  20 gps |?{$_.StartTime} | ft name, id, handle, starttime                     
  21 Get-Service                                                               
  22 get-service |more                                                         
  23 Get-Service |SQLSERVERB                                                   
  24 Get-Service |Where-Object {$_.Status -eg "running"} more                  
  25 Get-Service |Where-Object {$_.Status -eg "running"}                       
  26 Get-Service |Where-Object {$_.Status "running"}                           
  27 Get-Service |Where-Object {$_.Status}                                     
  28 get-service -Name *running*                                               
  29 Get-Service | Where-Object = 'running'                                    
  30 Get-Service | Where-Object {$_.Status -eq "running"} |more                
  31 Get-Service |Where-Object {$_.Status -eq "running"}                       
  32 Get-Service |Where-Object {$_.Status -eg                                  
  33 Get-Service |Where-Object {$_.Status -eg "stopped"}                       
  34 Get-Service                                                               
  35 Get-Service |Where-Object {$_.Status -eg "running"}|more                  
  36 Get-Service |Where-Object {$_.Status -eg "running"}                       
  37 Get-Service |Where-Object{$_.Status -eg "running"}                        
  38 Get-Service |Where-Object {$_.Status -eq "running"}                       
  39 Get-Service |Where-Object {$_.Status -eq "stopped"}                       
  40 Get-Service |Where-Object {$_.Status -eq "stopped"}|more                  
  41 history                                                                   
  42 Get-Service |Where-Object {$_.Status -eq "stopped"}| Sort Displayname     
  43 Get-Service |Where-Object {$_.Status -eq "stopped"}| Sort Displayname more
  44 Get-Service |Where-Object {$_.Status -eq "stopped"}| Sort Displayname |...
  45 Get-Service |Where-Object {$_.Status -eq "running"}| Sort Displayname |...
  46 Get-Service appinfo                                                       
  47 Get-Service appinfo |Format-list *                                        
  48 Get-Service |?{$_.StartType -eq "manual"} |?{$_.Status -eq "Running"} |...
  49 Get-Service |Where-Object{$_.StartType -eq "manual"} |?{$_.Status -eq "...
  50 Get-EventLog -LogName                                                     
  51 Get-EventLog -LogName Application                                         
  52 Get-EventLog -LogName ...                                                 
  53 Get-EventLog -LogName Security...                                         
  54 Get-EventLog -LogName Application -Newest 10 |Group sources               
  55 Get-EventLog -LogName Application -Newest 10                              
  56 dir                                                                       
  57 ls                                                                        
  58 ls -LiteralPath                                                           
  59 list                                                                      
  60 mkdir jan                                                                 
  61 cd jan                                                                    
  62 touch helloworld.txt                                                      
  63 get-help touch                                                            
  64 cat                                                                       
  65 get-help cat                                                              
  66 getni jan3                                                                
  67 ni jan1                                                                   
  68 md jan2                                                                   
  69 remove jan1                                                               
  70 get-help rd                                                               
  71 rmdir jan1                                                                
  72 rd jan3                                                                   
  73 del jane                                                                  
  74 ls                                                                        
  75 del jan2                                                                  
  76 dir                                                                       
  77 dir |Format-Table                                                         
  78 dir |Format-Table *                                                       
  79 cd ..                                                                     
  80 dir |Format-Table name, path, mode                                        
  81 pwd                                                                       
  82 dir |Format-Table name, path, type, mode                                  
  83 dir |Where{$_.Name -eq "apan"}|Format-List *                              
  84 dir |Where{$_.Name -eq "apan"}|Format-List *                              
  85 mkdir jan                                                                 
  86 mkdir jan                                                                 
  87 dir |Where{$_.Name -eq "jan"}|Format-List *                               
  88 copy jan c:\                                                              
  89 mkdir jan1                                                                
  90 move jan1 c:\                                                             
  91 c:                                                                        
  92 ls                                                                        
  93 dir |where{$_.Name -eq "jan"}|Format-Table *                              
  94 dir |where{$_.Name -eq "jan"}|Format-list*                                
  95 dir |where{$_.Name -eq "jan"}|Format-list *                               
  96 dir |where{$_.Name -eq "jan"}|Format-list *                               
  97 Get-Process|...                                                           
  98 Get-Process|...                                                           
  99 Get-Process | Sort_Object CPU | Format-TAble 



Get-Process|
Sort-Object CPU|
Format-Table name, cpu

/*....*/


Get-Process|
Where {$_.cpu -ge "10"}|
Sort-Object CPU|
Format-Table name, cpu


Get-Process|
Where {$_.cpu -ge "10"}|
Sort-Object CPU -Descending|
Format-Table name, cpu



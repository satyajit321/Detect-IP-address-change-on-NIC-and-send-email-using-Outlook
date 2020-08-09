Description:
This script is to extract current IP from a PC store it in a file, then the next time it runs it will compare the current IP with the existing IP on the file.
If any change is observed it will trigger an email using MS Outlook.
Script would do nothing if there is no change.
This can be useful, when you are using a PC remotely, and accessing it via RDP , FileShare etc. and would like to monitor any changes on IP, which would make it unaccessible.

The script is fairly simple configurable componets\variables are inside the script.
If run manually using shell it would display basic output text on the action performed such as , Email Sent,No Change,File Created
 
Configuration:
ScriptName: IPCompare-SendEmail.ps1
*Copy and paste the IPCompare-SendEmail.ps1 in C:\Scripts\ (Can be different too, my testing and reference in this article would be to that location)
Open the script and update the $Mail.To variable to the desired address in the below section.
PowerShell
#Configure Names 
$IPAddFile = "IPCompare-SendEmail.dat" #File which keeps the old IP record 
$Mail.To = "username@contoso.com"
*For the script to automatically monitor and send email you need to configure a Scheduled Task in Windows.
 
Refer to the below guide for setting it up.
Use the Windows Task Scheduler to Run a Windows PowerShell Script
Few configuration specific to us on the task are as follows in the Actions section:
Program/script: 
powershell -file "C:\Scripts\IPCompare-SendEmail.ps1"
Start in(optional):  C:\Scripts\
 
You can also use the task I created to Import it into your PC
Open Task Scheduler(Local) -> Task Scheduler Library ->Right click-> Import Task->OK
Task name: IPCompare-SendEmail.xml
You can configure and check with other options as you like, I have tested with User Logged In.
You might want to edit below sections using NOTEPAD or via the GUI, incase you have a separate location

XML
<Command>powershell</Command>  
<Arguments>-file "C:\Scripts\IPCompare-SendEmail.ps1"</Arguments>  
<WorkingDirectory>C:\Scripts\</WorkingDirectory>
 
Usage:
This script can be run using a PS session in PS C:\Scripts> ".\IPCompare-SendEmail.ps1" or any other location. Please note that the location from where you are running will be used for the old IP storage file.
When ran for the first time it would have created a file similar to this. (You can open using Notepad to see or edit the IP to something else to test)
IPCompare-SendEmail.dat
When you run it for the second time it will either display that "No change" or "Email Sent" to the specified email address.
We can put this as a scheduled task to run every hour.
Once tested the scheduled task will execute the script every hours 24X7, you need to keep the PC running all the time ofcourse for it to work.
Sample Test Run:
PowerShell
PS C:\Scripts> .\IPCompare-SendEmail.ps1 
File Created 
PS C:\Scripts> .\IPCompare-SendEmail.ps1 
No Change, No Email 
PS C:\Scripts> .\IPCompare-SendEmail.ps1 
Email Sent 
PS C:\Scripts>
 
Sample Email Triggered upon IP changed
HTML
From:                              Satyajit 
Sent:                               Friday, June 19, 2015 10:32 AM 
To:                                  Satyajit 
Subject:                           IP has changed to 10.187.87.154 
  
 
 Old IP was 10.187.87.153  
 New IP is 10.187.87.154  
 
 
Limitations:
It doesn't accept any parameters.
And is not designed to handle PC with multiple NIC cards, but is doable with some modification to the IP extraction portion. It might need some additional logic to work on.
Send email is currently using Outlook only, but can be modified in future to use a SMTP relay as well.
 
 
Refercences:
Script that shows current IP address(es) in PowerShell window title.
https://gallery.technet.microsoft.com/scriptcenter/Script-that-shows-current-611f6eaa

PowerShell Send-Email Function
http://www.computerperformance.co.uk/powershell/powershell_function_send_email.htm

Use the Windows Task Scheduler to Run a Windows PowerShell Script
http://blogs.technet.com/b/heyscriptingguy/archive/2012/08/11/weekend-scripter-use-the-windows-task-scheduler-to-run-a-windows-powershell-script.aspx

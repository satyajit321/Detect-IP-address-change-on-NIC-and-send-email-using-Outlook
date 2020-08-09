#Script to compare current IP with old IP and sends email if change detected
#Satyajit5:53 PM 6/18/2015
#Script would do nothing if there is no change.
#We can put this as a scheduled task to run every hour.
#ScriptName: IPCompare-SendEmail.ps1

$IPAddFile = "IPCompare-SendEmail.dat" #File which keeps the old IP record

$IP = get-wmiobject win32_networkadapterconfiguration | ? { $_.IPAddress -ne $null }

$IP_new = $Ip.IPAddress[0]

#Check if old IP record exists
If(Test-Path "$IPAddFile")
{
#Get old IP
$IP_old = Get-Content "$IPAddFile"

	#Compare IPs
	if(-not($IP_new -eq $IP_old))
	{

		$Outlook = New-Object -ComObject Outlook.Application
		$Mail = $Outlook.CreateItem(0)
		$Mail.To = "satyajit.baruah@accenture.com"
		$Mail.Subject = "IP has changed to $IP_new"

		$Mail.Body =" Old IP was $IP_old `n New IP is $IP_new"
		#$Mail.Subject
		
		$Mail.Send()

		$Outlook.GetNameSpace("MAPI").SendAndReceive(1) 
		"Email Sent"

		# Section to prevent error message in Outlook, but closes user outlook session as well.
		#$Outlook.Quit()
		#if(-not([System.Runtime.Interopservices.Marshal]::ReleaseComObject($Outlook)))
		#{"Outlook Closed"}
		$Outlook = $null

		#Overwrite and update new IP
		#$IP_new |  Out-File $IPAddFile

	}
	else
	{"No Change, No Email"}

}
else
{
#Create new as file not found
$IP_new |  Out-File $IPAddFile
"File Created"
}


#Refercences:
#https://gallery.technet.microsoft.com/scriptcenter/Script-that-shows-current-611f6eaa
#http://www.computerperformance.co.uk/powershell/powershell_function_send_email.htm
#http://blogs.technet.com/b/heyscriptingguy/archive/2012/08/11/weekend-scripter-use-the-windows-task-scheduler-to-run-a-windows-powershell-script.aspx
<div><strong>Description:</strong></div>
<div>This script is to extract current IP from a PC store it in a file, then the next time it runs it will compare the current IP with the existing IP on the file.</div>
<div>If any change is observed it will trigger an email using MS Outlook.</div>
<div>Script would do nothing if there is no change.</div>
<div></div>
<div>This can be useful, when you are using a PC remotely, and accessing it via RDP , FileShare etc. and would like to monitor any changes on IP, which would make it unaccessible.<br /> <br /> The script is fairly simple configurable componets\variables are inside the script.</div>
<div>If run manually using shell it would display basic output text on&nbsp;the&nbsp;action performed&nbsp;such as , Email Sent,No Change,File Created</div>
<div>&nbsp;</div>
<div><strong>Configuration:</strong></div>
<div>ScriptName: IPCompare-SendEmail.ps1</div>
<div></div>
<div></div>
<div>*Copy and paste the IPCompare-SendEmail.ps1 in C:\Scripts\ (Can be different too, my testing and reference in this article would be to that location)</div>
<div>Open the script and update the <strong>$Mail.To </strong>variable to the desired address in the below section.</div>
<div>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">#Configure Names
$IPAddFile = "IPCompare-SendEmail.dat" #File which keeps the old IP record
$Mail.To = "username@contoso.com"</pre>
<div class="preview">
<pre class="powershell"><span class="powerShell__com">#Configure&nbsp;Names</span>&nbsp;
<span class="powerShell__variable">$IPAddFile</span>&nbsp;=&nbsp;<span class="powerShell__string">"IPCompare-SendEmail.dat"</span>&nbsp;<span class="powerShell__com">#File&nbsp;which&nbsp;keeps&nbsp;the&nbsp;old&nbsp;IP&nbsp;record</span>&nbsp;
<span class="powerShell__variable">$Mail</span>.To&nbsp;=&nbsp;<span class="powerShell__string">"username@contoso.com"</span></pre>
</div>
</div>
</div>
<div class="endscriptcode">*For the script to automatically monitor and send email you need to configure a Scheduled Task in Windows.</div>
<div class="endscriptcode"></div>
<div class="endscriptcode">&nbsp;</div>
<div class="endscriptcode">Refer to the below guide for setting it up.</div>
</div>
<div><a href="http://blogs.technet.com/b/heyscriptingguy/archive/2012/08/11/weekend-scripter-use-the-windows-task-scheduler-to-run-a-windows-powershell-script.aspx">Use the Windows Task Scheduler to Run a Windows PowerShell Script</a></div>
<div></div>
<div>Few configuration specific to us on the task are as follows in the Actions section:</div>
<div></div>
<div></div>
<div>Program/script:&nbsp; <br /> powershell -file "C:\Scripts\IPCompare-SendEmail.ps1"</div>
<div>Start in(optional):&nbsp; C:\Scripts\</div>
<div></div>
<div>&nbsp;</div>
<div>You can also use the task I created to Import it into your PC</div>
<div></div>
<div></div>
<div>Open Task Scheduler(Local) -&gt;&nbsp;Task Scheduler Library -&gt;Right click-&gt; Import Task-&gt;OK</div>
<div></div>
<div></div>
<div>Task name: <a id="139086" href="/Detect-IP-address-change-aeb51118/file/139086/1/IPCompare-SendEmail.xml"> IPCompare-SendEmail.xml</a></div>
<div></div>
<div></div>
<div>You can configure and check with other options as you like, I have tested with User Logged In.</div>
<div>You might want to edit below sections using NOTEPAD or via the GUI, incase you have a separate location</div>
<div><br />
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>XML</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">xml</span>
<pre class="hidden">&lt;Command&gt;powershell&lt;/Command&gt; 
&lt;Arguments&gt;-file "C:\Scripts\IPCompare-SendEmail.ps1"&lt;/Arguments&gt; 
&lt;WorkingDirectory&gt;C:\Scripts\&lt;/WorkingDirectory&gt;</pre>
<div class="preview">
<pre class="js">&lt;Command&gt;powershell&lt;/Command&gt;&nbsp;&nbsp;
&lt;Arguments&gt;-file&nbsp;<span class="js__string">"C:\Scripts\IPCompare-SendEmail.ps1"</span>&lt;/Arguments&gt;&nbsp;&nbsp;
&lt;WorkingDirectory&gt;C:\Scripts\&lt;/WorkingDirectory&gt;</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
</div>
<div></div>
<div></div>
<div><strong>Usage:</strong></div>
<div>This script can be run using a PS session in PS C:\Scripts&gt; ".\IPCompare-SendEmail.ps1" or any other location. Please note that the location from where you are running will be used for the old IP storage file.</div>
<div></div>
<div></div>
<div>When ran for the first time it would have created a file similar to this. (You can open using Notepad to see or edit the IP to something else&nbsp;to test)</div>
<div></div>
<div></div>
<div><a id="139085" href="/Detect-IP-address-change-aeb51118/file/139085/1/IPCompare-SendEmail.dat">IPCompare-SendEmail.dat</a></div>
<div></div>
<div></div>
<div>When you run it for the second time it will either display that "No change" or "Email Sent" to the specified email address.</div>
<div>We can put this as a scheduled task to run every hour.</div>
<div></div>
<div>Once tested the scheduled task will execute the script every hours 24X7, you need to keep the PC running all the time ofcourse for it to work.</div>
<div></div>
<div>Sample Test Run:</div>
<div>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">PS C:\Scripts&gt; .\IPCompare-SendEmail.ps1
File Created
PS C:\Scripts&gt; .\IPCompare-SendEmail.ps1
No Change, No Email
PS C:\Scripts&gt; .\IPCompare-SendEmail.ps1
Email Sent
PS C:\Scripts&gt;</pre>
<div class="preview">
<pre class="powershell"><span class="powerShell__alias">PS</span>&nbsp;C:\Scripts&gt;&nbsp;.\IPCompare<span class="powerShell__operator">-</span>SendEmail.ps1&nbsp;
File&nbsp;Created&nbsp;
<span class="powerShell__alias">PS</span>&nbsp;C:\Scripts&gt;&nbsp;.\IPCompare<span class="powerShell__operator">-</span>SendEmail.ps1&nbsp;
No&nbsp;Change,&nbsp;No&nbsp;Email&nbsp;
<span class="powerShell__alias">PS</span>&nbsp;C:\Scripts&gt;&nbsp;.\IPCompare<span class="powerShell__operator">-</span>SendEmail.ps1&nbsp;
Email&nbsp;Sent&nbsp;
<span class="powerShell__alias">PS</span>&nbsp;C:\Scripts&gt;</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;
<div class="endscriptcode">Sample Email Triggered upon IP changed</div>
<div class="endscriptcode"></div>
<div class="endscriptcode">
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>HTML</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">html</span>
<pre class="hidden">From:                              Satyajit
Sent:                               Friday, June 19, 2015 10:32 AM
To:                                  Satyajit
Subject:                           IP has changed to 10.187.87.154
 

 Old IP was 10.187.87.153 
 New IP is 10.187.87.154 
</pre>
<div class="preview">
<pre class="html">From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Satyajit&nbsp;
Sent:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Friday,&nbsp;June&nbsp;19,&nbsp;2015&nbsp;10:32&nbsp;AM&nbsp;
To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Satyajit&nbsp;
Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP&nbsp;has&nbsp;changed&nbsp;to&nbsp;10.187.87.154&nbsp;
&nbsp;&nbsp;
&nbsp;
&nbsp;Old&nbsp;IP&nbsp;was&nbsp;10.187.87.153&nbsp;&nbsp;
&nbsp;New&nbsp;IP&nbsp;is&nbsp;10.187.87.154&nbsp;&nbsp;
</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
</div>
</div>
</div>
<div><strong>&nbsp;</strong></div>
<div><strong>Limitations:</strong></div>
<div>It doesn't accept any parameters.</div>
<div>And is not designed to handle PC with multiple NIC cards, but&nbsp;is doable&nbsp;with some modification to the IP extraction portion. It might need some additional logic to work on.</div>
<div>Send email is currently using Outlook only, but can be modified in future&nbsp;to use a SMTP relay as well.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>Refercences:</strong><br />
<p>Script that shows current IP address(es) in PowerShell window title.<br /> <a href="https://gallery.technet.microsoft.com/scriptcenter/Script-that-shows-current-611f6eaa">https://gallery.technet.microsoft.com/scriptcenter/Script-that-shows-current-611f6eaa</a></p>
<p>PowerShell Send-Email Function<br /> <a href="http://www.computerperformance.co.uk/powershell/powershell_function_send_email.htm">http://www.computerperformance.co.uk/powershell/powershell_function_send_email.htm</a></p>
<p>Use the Windows Task Scheduler to Run a Windows PowerShell Script<br /> <a href="http://blogs.technet.com/b/heyscriptingguy/archive/2012/08/11/weekend-scripter-use-the-windows-task-scheduler-to-run-a-windows-powershell-script.aspx">http://blogs.technet.com/b/heyscriptingguy/archive/2012/08/11/weekend-scripter-use-the-windows-task-scheduler-to-run-a-windows-powershell-script.aspx</a></p>
</div>

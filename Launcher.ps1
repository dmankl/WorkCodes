$SCCM = 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe'
$User = "pcc-domain\wadmin_" + $env:UserName
$creds = Get-Credential -Credential $User
$Title = "Program Launching"
$Message = "What Program Do You Want To Run?"
$Options = "&SCCM", "&AD"
$DefaultChoice = 0
$Result = $Host.UI.PromptForChoice($Title, $Message, $Options, $DefaultChoice)
switch ($Result) {
    0 { Start-Process $SCCM -Credential $creds }
    1 { Start-Process "C:\Windows\System32\cmd.exe" -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c dsa.msc" }
}

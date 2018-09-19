# Description: Boxstarter Script  
# Author: Microsoft
# Common dev settings for desktop app development

Disable-UAC

New-Item -Path "$env:userprofile\AppData\Local\ChocoCache" -ItemType directory -Force | Out-Null
$common = "--cacheLocation=`"$env:userprofile\AppData\Local\ChocoCache`""

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}



choco feature enable -n allowGlobalConfirmation  
choco feature enable -n allowEmptyChecksums

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
executeScript "VirtualizationTools.ps1";

#--- Tools ---
#--- Installing VS and VS Code with Git 
# See this for install args: https://chocolatey.org/packages/VisualStudio2017Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community 
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
# visualstudio2017community 
# visualstudio2017professional
# visualstudio2017enterprise

choco install visualstudio2017professional -y --package-parameters "--add Microsoft.VisualStudio.Component.Git" $common
Update-SessionEnvironment #refreshing env due to Git install

#--- UWP Workload and installing Windows Template Studio ---
choco install -y visualstudio2017-workload-azure $common
choco install -y visualstudio2017-workload-netweb $common
choco install -y visualstudio2017-workload-netcoretools $common
choco install -y visualstudio2017-workload-manageddesktop $common
choco install -y visualstudio2017-workload-node $common
#executeScript "WindowsTemplateStudio.ps1";
#executeScript "GetUwpSamplesOffGithub.ps1";

#Joining to domain and renaming computer
if($env:USERDNSDOMAIN.ToLower() -ne "kfs.local")
{
    $wsname = Read-host -Prompt "Enter computer name"
    $creds = Get-Credential
    Rename-Computer $wsname
    add-computer -DomainName "kfs.local" -NewName $wsname -Credential $creds -Restart -Force
}
#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
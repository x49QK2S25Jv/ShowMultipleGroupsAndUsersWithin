######################################################
######################################################
#Get members of a single group
$GetAdGroupSingle = Read-Host "Please enter a group name"
Get-ADGroupMember -Identity $GetAdGroupSingle | Select-Object Name
Clear-Host
Write-Host "$GetAdGroupSingle"
Write-Host "$GetAdGroupSingle"
#Completed############################################
######################################################
######################################################
######################################################

#Get Multiple Groups and return mulitple members in those groups
Clear-Host
$ADGroupSearch = Read-Host -Prompt "Please enter the search group name e.g. Role-"
$ReturnedADGroups = Get-ADGroup -Filter * | Where {$_.SamAccountName -Like "*$ADGroupSearch*"} | Sort-Object 


ForEach ($Group in $ReturnedADGroups) {
Get-ADGroupMember -Identity "$Group" | Select-Object Name
Write-Host "$ReturnedADGroups"
Write-Host "$Group"
Write-Host ""
Write-Host "==============" -ForegroundColor Red
}


#Works
Get-ADGroup -Filter * | Sort-Object | Select-Object Name,SamAccountName | where {$_.SamAccountName -like "*Role*"}


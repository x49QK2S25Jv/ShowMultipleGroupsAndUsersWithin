######################################################
######################################################
#Get members of a single group
#$GetAdGroupSingle = Read-Host
#Get-ADGroupMember -Identity $GetAdGroupSingle | Select-Object Name
#Clear-Host
#Write-Host "$GetAdGroupSingle"
#Write-Host "$GetAdGroupSingle_"
#Completed############################################
######################################################
######################################################
######################################################

#Get Multiple Groups and return mulitple members in those groups
Clear-Host
Write-Host "Please enter the search group name e.g. Role-"
$ADGroupSearch = Read-Host
$ReturnedADGroups = Get-ADGroup -Filter * | where {$_.SamAccountName -like "*$ADGroupSearch*"} | Select-Object @{=Name,GroupCategory,Groupscope,ObjectClass


ForEach ($AdGroup in $ReturnedADGroups) {
Get-ADGroupMember -Identity "$AdGroup" #| where {$_.SamAccountName -like "$ADGroup"}
Write-Host "$ReturnedADGroups"
Write-Host "$AdGroup"
Write-Host ""
Write-Host "==============" -ForegroundColor Red
}
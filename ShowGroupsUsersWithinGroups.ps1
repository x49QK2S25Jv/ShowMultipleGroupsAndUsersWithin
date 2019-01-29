######################################################
######################################################
#Get members of a single group
$GetAdGroupSingle = Read-Host "Please enter a group name"
Get-ADGroupMember -Identity $GetAdGroupSingle | Select-Object Name
Clear-Host
Write-Host "$GetAdGroupSingle"
Write-Host "$GetAdGroupSingle"
#####################Completed########################
######################################################
######################################################
######################################################

#Get Multiple Groups and return mulitple members in those groups
Clear-Host
$ADGroupSearch = Read-Host -Prompt "Please enter the search group name e.g. Role-"
$ReturnedADGroups = Get-ADGroup -Filter * | Where {$_.SamAccountName -Like "*$ADGroupSearch*"}



ForEach ($Group in $ReturnedADGroups) {
$GroupNameFormatted = Get-ADGroup -Identity $Group | Select-Object Name -ExpandProperty Name
Write-Host "Group Name " -NoNewline -ForegroundColor Green
Write-Host  "$GroupNameFormatted"
$ADGroupMembers = Get-ADGroupMember -Identity "$Group" | Select-Object Name -ExpandProperty Name
Write-Host "Group members " -ForegroundColor Green
Write-Host "$ADGroupMembers"
Write-Host ""
Write-Host "==========" -ForegroundColor Red

}

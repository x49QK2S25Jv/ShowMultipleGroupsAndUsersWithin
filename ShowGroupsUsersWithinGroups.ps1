#Get members of a single group
$GetAdGroupSingle = Read-Host
Get-ADGroupMember -Identity $GetAdGroupSingle | Select-Object Name
Clear-Host
Write-Host "$GetAdGroupSingle"
Write-Host "$GetAdGroupSingle_"

#Get Multiple Groups and return mulitple members in those groups
$ADGroups = Get-ADGroup -Filter {Name -like "Role-*"} | Select-Object Name
ForEach-Object ($AdGroup in $ADGroups) {


}
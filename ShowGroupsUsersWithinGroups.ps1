$menu=@"
1 Show members of a single group
2 Search for all groups with a similar name
Select a task by number or Q to quit
"@


do {
$r = Read-Host $menu

Switch ($r) {
"1" {
#Get members of a single group
$GetAdGroupSingle = Read-Host "Please enter a group name"
Get-ADGroupMember -Identity $GetAdGroupSingle | Select-Object Name
Clear-Host
Write-Host "$GetAdGroupSingle"
Write-Host "$GetAdGroupSingle"
    }  
"2" {
Clear-Host
$ADGroupSearch = Read-Host -Prompt "Please enter the search group name e.g. Role-"
$ReturnedADGroups = Get-ADGroup -Filter * | Where {$_.SamAccountName -Like "*$ADGroupSearch*"}



ForEach ($Group in $ReturnedADGroups) {
$GroupNameFormatted = Get-ADGroup -Identity $Group | Select-Object Name -ExpandProperty Name
Write-Host "Group Name " -NoNewline -ForegroundColor Green
Write-Host  "$GroupNameFormatted"
$ADGroupMembers = Get-ADGroupMember -Identity "$Group" | Select-Object Name -ExpandProperty Name | Out-String
Write-Host "Group members " -ForegroundColor Green
Write-Output "$ADGroupMembers"
Write-Host "==========" -ForegroundColor Red `n
}
        }
default {
    Write-Host "I don't understand what you want to do." -ForegroundColor Yellow
    }
"Q" {
    Write-Host "Closing" -ForegroundColor Green
    Sleep 1
    Exit
    }
        }}#end switch
until ($response -eq "q")

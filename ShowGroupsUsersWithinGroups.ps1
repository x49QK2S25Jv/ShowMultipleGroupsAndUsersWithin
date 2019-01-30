$menu=@"
1 Show members of a single group
2 Search for all groups with a similar name
3 Search for all groups with a similar name and export to csv
Select a task by number or Q to quit
"@

Clear-Host
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
Start-Sleep -Milliseconds 10
Write-Host "Group Name " -NoNewline -ForegroundColor Green
Write-Host  "$GroupNameFormatted"
$ADGroupMembers = Get-ADGroupMember -Identity "$Group" | Select-Object Name -ExpandProperty Name | Out-String
Write-Host "Members " -ForegroundColor Green
Write-Output "$ADGroupMembers"
Write-Host "==========" -ForegroundColor Red `n
}
        }
"3"{
Clear-Host
$Date = Get-date -Format dd-MM-yyyy
$ADGroupSearch = Read-Host -Prompt "Please enter the search group name e.g. Role-"
$ReturnedADGroups = Get-ADGroup -Filter * | Where {$_.SamAccountName -Like "*$ADGroupSearch*"}
$ExportSaveLocation = Read-Host -Prompt "Please enter the location to save the output"
$ExportJoin = Join-Path -Path "$ExportSaveLocation" -ChildPath "GroupAndMember-Export-$Date"

ForEach ($Group in $ReturnedADGroups) {
$GroupNameFormatted = Get-ADGroup -Identity $Group | Select-Object Name -ExpandProperty Name
Start-Sleep -Milliseconds 10
Write-Host "Group Name " -NoNewline -ForegroundColor Green
Write-Host  "$GroupNameFormatted"
$ADGroupMembers = Get-ADGroupMember -Identity "$Group" | Select-Object Name -ExpandProperty Name | Out-String
Write-Host "Members " -ForegroundColor Green
Write-Output "$ADGroupMembers"
Write-Host "==========" -ForegroundColor Red `n
} Out-File  "$ExportJoin.txt"
    }
default {
    Write-Host "I don't understand what you want to do." -ForegroundColor Yellow
    }
"q" {
    Write-Host "Closing" -ForegroundColor Green
    Sleep 1
    Exit
    }
        }}#end switch
until ($response -eq "q")
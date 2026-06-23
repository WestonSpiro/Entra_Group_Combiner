#Connect-MgGraph -Scopes "Group.Read.All"
#Connect-Entra -Scopes 'GroupMember.ReadWrite.All'
#Use Object ID as group identifier
#Source_Group is the group you want to copy from
$Source_Group  = Read-Host "Enter Source Group"
#Target_Group is the group you want to copy to
$Target_Group = Read-Host "Enter Target Group"

$Source_Members = Get-MgGroupMember -GroupID $Source_Group -All
foreach ($Member in $Source_Members) {
    Add-EntraGroupMember -GroupID $Target_Group -MemberId $Member.Id
    Write-Output "'$Member.Id' successfully added to '$Target_Group'." -ForegroundColor Green
}
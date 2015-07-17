# Script to retrieve AD Users who have not logged on in the last 90 days.
# Based off of script by Michael Trigg on www.spiceworks.com
# http://community.spiceworks.com/scripts/show/1861-find-and-disable-or-remove-inactive-ad-computer-accounts

# Defines cut off date as 90 days before today
Get-ADUser -Filter  {(Enabled -eq "True")} -Properties Name,distinguishedname,PasswordLastSet | 
    ? { ($_.distinguishedname -notlike '*Service Accounts*') } |
where-object {$_.PasswordLastSet -lt $((Get-Date).AddDays(-90))} |
Select-Object Name,PasswordLastSet,Enabled 
    

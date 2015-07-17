# Script to retrieve AD Users who have not logged on in the last 90 days.
# Based off of script by Michael Trigg on www.spiceworks.com
# http://community.spiceworks.com/scripts/show/1861-find-and-disable-or-remove-inactive-ad-computer-accounts

# Defines cut off date as 90 days before today
import-module activedirectory

$last90Days = (Get-Date).AddDays(-89)

Get-ADUser 
  -Properties SamAccountName,lastLogonDate 
  -Filter {(lastLogonDate -lt $last90Days) -and (enabled -eq 'True')} | 
  Select-Object SamAccountName,lastLogonDate | 
  Export-CSV 'C:\Users\chris.smith\Documents\Sec\AD Reports\07-09-2015-LogOn.xlsx' 
  -NoTypeInformation 
  -Encoding UTF8
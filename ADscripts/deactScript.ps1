# Script for deactivating user accounts in AD

$deactList = @(import-csv "C:\Users\chris.smith\Documents\Sec\PSpasswordLastSet.csv")
$deactList
$i = 0

foreach($UserName in $deactList)
{
	set-aduser -enabled 0 -identity $deactList[$i].UserName
	write-host "Name: " $deactList[$i].UserName " has been disabled."
	$i++
}
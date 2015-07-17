# A script to compare two excel spreadsheets.

$listAD = @(import-csv 'C:\users\chris.smith\Documents\Sec\PSdeactList.csv')
$listExcel = @(import-csv 'C:\users\chris.smith\Documents\Sec\listExcel.csv')
$listResults = @(import-csv 'C:\users\chris.smith\Documents\Sec\listExcel')
$i = 0
$j = 0

foreach($accountName in $listAD)
{
	$testName = $listAD[$i].SamAccountName
	$j = 0
	foreach($userName in $listExcel)
	{
		if($testName -eq $listExcel[$j].UserName)
		{
			$listResults.Remove($listExcel[$j].UserName)
			$j++
		}
		else
		{
			$j++
		}
	}
#	$listResults += $testName
	$i++
}

#$listResults
$listResults.Count
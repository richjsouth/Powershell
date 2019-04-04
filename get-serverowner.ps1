$strPath="C:\Scripts\Powershell\get-serverowner\test.xlsx" 
$objExcel=New-Object -ComObject Excel.Application 
$objExcel.Visible=$false 
$WorkBook=$objExcel.Workbooks.Open($strPath) 
$worksheet = $workbook.sheets.item("test") 
# $intRowMax = ($worksheet.UsedRange.Rows).count $Columnnumber = 1 
# $xl.Cells.Find("UEASITS01")
$serverName = "UEASITS01"
$serverName = Read-Host -Prompt "Server Name: "


$Searcher = $worksheet.usedrange.find($serverName)
$owner = $Searcher.offset(0,16)
$use = $Searcher.offset(0,17)
$location = $Searcher.offset(0,1)
$os = $Searcher.offset(0,8)
$serial = $Searcher.offset(0,5)
$patching = $Searcher.offset(0,18)


Write-Host ("Server: ", $serverName)
Write-Host ("Owner: ", $owner.value2)
Write-Host ("Use: ", $use.value2)
Write-Host ("Location: ", $location.value2)
Write-Host ("OS: ", $os.value2)
Write-Host ("Serial: ", $serial.value2)
Write-Host ("Patching: ", $patching.value2)

Read-Host


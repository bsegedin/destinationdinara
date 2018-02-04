Import-Module WebAdministration
$webPathInMaterijali = "\Dinara\Website\Dev\destinationdinara-website\Website"
$iisAppName = "destinationdinara"
$iisAppPoolName = "destinationdinara"

$iisAppPoolDotNetVersion = "v4.0"
$iisAppPoolEnable32Bit = "True"

function Pause ($Message="Press any key to continue...")
{
	Write-Host -NoNewLine $Message
	$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	Write-Host ""
}

if (Test-Path -Path "Env:/MATERIJALI") { $materijali = (get-item env:"MATERIJALI").Value } else { $materijali = "D:\Materijali" }
$directoryPath = $materijali + $webPathInMaterijali


#check if the path exists
if (!(Test-Path -Path $directoryPath))
{
    Write-Host "GRESKA! Folder ne postoji: " $directoryPath
    return
}

#navigate to the app pools root
cd IIS:\AppPools\

#check if the app pool exists
if (!(Test-Path $iisAppPoolName -pathType container))
{
    #create the app pool
    $appPool = New-Item $iisAppPoolName
    $appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value $iisAppPoolDotNetVersion
	$appPool | Set-ItemProperty -Name "enable32BitAppOnWin64" -Value $iisAppPoolEnable32Bit
}

#navigate to the sites root
cd IIS:\Sites\

#check if the site exists
if (Test-Path $iisAppName -pathType container)
{
    return
}

#create the site
$iisApp = New-Item $iisAppName -bindings @{protocol="http";bindingInformation=":80:" + $iisAppName} -physicalPath $directoryPath
$iisApp | Set-ItemProperty -Name "applicationPool" -Value $iisAppPoolName

Pause
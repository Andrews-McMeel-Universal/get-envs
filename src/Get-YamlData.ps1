param (
    [parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$Yaml
)

#Check to see if powershell-yaml is installed 
if (Get-Module -Name powershell-yaml) {
   #It's installed, this would be if you are running locally. 
}
else {
    Write-Host "Installing Powershell-Yaml."
    Install-Module -Name powershell-yaml -Confirm:$false -Force
}

Import-Module powershell-yaml

Write-Host "Getting configuration from yaml."

$Values = Get-Content $Yaml | ConvertFrom-Yaml

return $Values
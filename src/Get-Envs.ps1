param (
    [parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$AppEnv,
    [parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$ChartYaml,
    [parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]$ValuesYaml
)

$AppConfig = ./Get-YamlData.ps1 -Yaml $ChartYaml
$ChartConfig = ./Get-YamlData.ps1 -PathToYaml $ValuesYaml
$AppName = $ChartConfig.name
$ConfigMap = $AppConfig.deployment.configMap
$ConfigSecret = $AppConfig.deployment.secret
$Ingress = $AppConfig.ingress.host
$DomainName = ($Ingress.Split('.') | Select-Object -Last 2) -join '.'
$HostName = $Ingress -replace $DomainName, ''
$HostName = $HostName.Substring(0,$HostName.Length-1)
switch ($AppEnv) {
  'development' {$HostName = "development.$Hostname"; $Ingress = "development.$Ingress"}
  'staging' {$HostName = "staging.$Hostname"; $Ingress = "staging.$Ingress"}
}
$ImagePullSecret = "$AppName-pull-secret"
Write-Output "::set-output name=application_name::$AppName"
Write-Output "::set-output name=configmap::$ConfigMap"
Write-Output "::set-output name=configsecret::$ConfigSecret"
Write-Output "::set-output name=ingress::$Ingress"
Write-Output "::set-output name=domainname::$DomainName"
Write-Output "::set-output name=hostname::$HostName"
Write-Output "::set-output name=image_pull_secret::$ImagePullSecret"
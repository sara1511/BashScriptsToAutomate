# Bash Script To Automate Node CPU Profiling

*** 

## 1st Task
### Clone the existing App/New Slot/New App using Powershell
`Set-AzContext -SubscriptionName "Your Subscription Name"`

`$srcapp = Get-AzWebApp -ResourceGroupName "Your RG Name" -Name "Your Web App Name"`

`$destapp = New-AzWebApp -ResourceGroupName "Your RG Name" -Name "Your Web App Name-clone" -Location "Your Desired Location" -AppServicePlan "Your New ASP Name" -SourceWebApp $srcapp`

***
## 2nd Task
### Run the Profiling 1st script file

***
## 3rd Task 
### Restart the web app using Powershell command
`Restart-AzWebApp -ResourceGroupName "Your RG Name" -Name "Your Web App Name-clone"`

***
## 4th Task
### Run the Profiling 2nd script file
`You can also try editing this script to point your autocannon for specific routes`

***
## 5th Task 
### Finally you are done with profiling and now it's time to analyze the flamegraph
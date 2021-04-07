. $PSScriptRoot/helpers/Get-GreetingHelper.ps1

function Get-Greeting ($Text) { 
    if ($Text -eq "hello") { 
        "How are you?"
    }
    else { 
        Get-GreetingHelper
    }
}
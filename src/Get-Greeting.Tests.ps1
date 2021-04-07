BeforeAll { 
    . $PSScriptRoot/Get-Greeting.ps1
}

Describe "Get-Greeting" { 
    It "asks how am I when getting 'hello'" { 
        Get-Greeting -Text "hello" | Should -BeExactly "How are you?"
    }

    It "says what's up when given something else" { 
        Get-Greeting -Text "hey" | Should -BeExactly "What's up bro?"
    }
}
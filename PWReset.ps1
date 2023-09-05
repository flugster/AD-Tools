$Identity=Read-Host -Prompt "Enter User Name"
$password=Read-Host -Prompt "Enter Password"

# Import-Module ActiveDirectory

Set-ADAccountPassword -Identity $Identity  -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$password" -Force) -PassThru -Confirm:$false
Set-ADUser -ChangePasswordAtLogon $true -Identity $Identity -Confirm:$false -verbose

Write-host 'Password reset successfully and set to change at Next Logon' -F green

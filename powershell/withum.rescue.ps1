<#
.DESCRIPTION
    This script will add,update, or delete the Withum Rescue account 

.INPUTS
    rescuePass
    rescueTask 
    

.OUTPUTS
    None

.INFO
    Author:  Andrew Schumacher
    GitHub: https://github.com/Schu-/Withum.Rescue

.VERSION
    V1.0
#>

##Variables START##

#Define Script Variables
$global:account_exists = $null
$global:rmm_rescuePass = $env:rescuePass
$global:rmm_rescueTask = $env:rescueTask


##Variables END##


##FUNCTIONS START##

function Check-Accounts {
# Check for Withum Rescue account.

$userName = "wrescue"
$checkForUser = (Get-LocalUser).Name -Contains $userName

if ($checkForUser -eq $false) { 

$global:account_exists = $false 

} ElseIf ($checkForUser -eq $true) { 

$global:account_exists = $true

}

}

function Set-Account {
    write-host "Creating Withum Rescue Account"
    net user /add wrescue $global:rmm_rescuePass
    net localgroup administrators wrescue /add
}

function Update-Account {
    write-host "Updating Withum Rescue Account"
    net user wrescue $global:rmm_rescuePass
}

function Delete-Account {
    write-host "Deleting Withum Rescue Account"
    net user wrescue /delete
}

##FUNCTIONS END##



##SCRIPT START##
write-host "Withum Rescue Account Creation Script"

#Check for Rescue Account
write-host "Checking for a Withum Rescue account"
Check-Accounts

#Perform Rescue Function
write-host "Running RMM Task"
if ($global:rmm_rescueTask -eq "create_update") {
    if ($global:account_exists -eq $false) {
        Set-Account
    } elseif ($global:account_exists -eq $true) {
        Update-Account
    } else {
   #Issues & Task did not run
   write-host "CREATE/UPDATE TASK FAILED!!"
   exit 1 
    }
} elseif ($global:rmm_rescueTask -eq "delete") {
    if ($global:account_exists -eq $true) {
        Delete-Account
    } else {
   #No Account to Delete
   write-host "No Withum Rescue Account to Delete"
   exit 1 
    }
}else {
    #Issues & Task did not run
   write-host "Withum Rescue Script FAILED!!"
    exit 1
}

write-host "Withum Rescue Complete!"
##SCRIPT END##
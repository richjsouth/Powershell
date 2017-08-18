# Powershell script to display which usernames and user are in a specific AD group 
# RS - 18/08/2017

# Prompt for group name and store in $groupname variable
$groupname = read-host "Enter group name"

# Look for the members in $group, pass each username in turn into get-aduser 
# Dispaly only the user's username and their real name (stored in Display Name) 
get-ADGroupMember -identity "$groupname" -Recursive | Get-ADUser -Property DisplayName | Select Name,DisplayName

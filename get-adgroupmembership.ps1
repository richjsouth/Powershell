# Powershell script to display which usernames and user are in a specific AD group 
# RS - 29/08/2017 - Accept group as command-line argument

param([string]$groupName = "groupname")

# Look for the members in $group, pass each username in turn into get-aduser 
# Dispaly only the user's username and their real name (stored in Display Name) 
get-ADGroupMember -identity "$groupName" -Recursive | Get-ADUser -Property DisplayName | Select Name,DisplayName

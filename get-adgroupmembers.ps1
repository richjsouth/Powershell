# Powershell script to display which usernames and user are in a specific AD group 
# RS - 14/09/2017 - Accept a CSV output file

#Set the group name to be a mandatory field, the destination file is optional
param([parameter(Mandatory=$true)][string]$groupName, [string]$destinationFile)

# If a destination file is specified...
if($destinationFile)
{
	# Look for the members in $group, pass each username in turn into get-aduser 
	# Dispaly only the user's username and their real name (stored in Display Name)
	# Output to a .csv described in $destinationFile (second command-line parameter)	
	get-ADGroupMember -identity "$groupName" -Recursive | Get-ADUser -Property DisplayName | Select Name,DisplayName | export-csv -Path $destinationFile	
}
# If a destination file isn't specified...
else
{
	# Dispaly only the user's username and their real name (stored in Display Name) 
	# Look for the members in $group, pass each username in turn into get-aduser 
	get-ADGroupMember -identity "$groupName" -Recursive | Get-ADUser -Property DisplayName | Select Name,DisplayName
}
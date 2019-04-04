# Powershell script to display which user information
# RS - 27/10/2017

#Set the group name to be a mandatory field, the destination file is optional
param([parameter(Mandatory=$true)][string]$userName)

get-aduser $userName | Select GivenName, Surname, UserPrincipalName

Read-Host
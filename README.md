# Github-api Script
### Bash script to interact with the github api

<br>
<br>
<br>

### Usage

###### install script

`wget https://raw.githubusercontent.com/maxbybee/github-api/master/github-api.sh -O github-api.sh`

###### allow script to be executed

`chmod +x github-api.sh`

<br>
<br>
<br>
#### Run Script:



###### Create repo (personal)
`./github-api.sh -F PATH/TO/APIKEY -c -nNAME_OF_REPO -dDESCRIPTION_OF_REPO -p`

###### Create repo (for organization)
`./github-api.sh -F PATH/TO/APIKEY -c -nNAME_OF_REPO -dDESCRIPTION_OF_REPO -o -uORGANIZATION_NAME`

<br>
<br>
<br>

###### List public repos for account
`./github-api.sh -l -uUSERNAME`

###### List public repos for a organization
`./github-api.sh -o -l -uORGANIZATION_NAME`

<br>
<br>
<br>


###### List all personal repos
`./github-api.sh -F PATH/TO/APIKEY -l`

###### List all repos (organization)
`./github-api.sh -F PATH/TO/APIKEY -l -o -uORGANIZATION_NAME`



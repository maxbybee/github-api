# Github-api Script
### Bash script to interact with the github api

<br>
<br>
<br>

#### Installation
---
##### download from github

`wget https://raw.githubusercontent.com/maxbybee/github-api/master/github-api.sh -O github-api.sh`

##### allow script to be executed

`chmod +x github-api.sh`

<br>
<br>
<br>

#### Run Script:
---


##### Create repo (personal, private)
`./github-api.sh -F PATH/TO/APIKEY -nNAME_OF_REPO -dDESCRIPTION_OF_REPO -p -c`

##### Create repo (for organization)
`./github-api.sh -F PATH/TO/APIKEY -nNAME_OF_REPO -dDESCRIPTION_OF_REPO -o -uORGANIZATION_NAME -c`

<br>
<br>
<br>

##### List public repos for account
`./github-api.sh -UUSERNAME -l`

##### List public repos for a organization
`./github-api.sh -UORGANIZATION_NAME -o -l`

<br>
<br>
<br>


##### List all personal repos
`./github-api.sh -F PATH/TO/APIKEY -l`

##### List all repos (organization)
`./github-api.sh -F PATH/TO/APIKEY -UORGANIZATION_NAME -o -l`

<br>
<br>
<br>

### Todo:
- [x] Create repo (personal)
- [x] \Create repo (organization)
- [x] List repos (public)
- [x] List repos (all)
- [x] \List repos (all, org)


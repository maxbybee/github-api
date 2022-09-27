#!/bin/bash
VERSION=V0.1.3;
DEVELOPER=maxbybee;
FROM=https://github.com/maxbybee/github-api;
GITLINK=https://api.github.com/user/repos;
NAME=github-api;
OPT_V=0;
APIKEY=0;
REPO_NAME="DEFAULT";
REPO_DESC="This Repository was created without a description. How sad!";
REPO_PRIVATE=true;
REPO_VISIBILITY="private";
USER=0; # if you have the username 0, sorry for using you as the default :)
ORG=0;
function interact_create {
curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $APIKEY" $GITLINK -d '{"name":"'"$REPO_NAME"'","description":"'"$REPO_DESC"'","private":"'"$REPO_PRIVATE"'","visibility":"'"$REPO_VISIBILITY"'"}';
};

function interact_list {
if [ ! ${#APIKEY} -eq 1 ]; then curl -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $APIKEY" $GITLINK; fi;
if [ ${#APIKEY} -eq 1 ] && [ $ORG -eq 0 ]; then curl -H "Accept: application/vnd.github+json" https://api.github.com/users/$USER/repos; 
elif [ $ORG -eq 1 ]; then curl -H "Accept: application/vnd.github+json" https://api.github.com/orgs/$USER/repos; fi;
if [ ${#USER} -eq 1 ] && [ ${#APIKEY} == 1 ]; then curl  -H "Accept: application/vnd.github+json" https://api.github.com/repositories; echo ""; echo "you've just printed all the repositories!"; echo "you might want to specify a user/org with -U"; echo "Or you might want to specify an account with -K or -F"; fi;
};


# `cat << EOF` This means that cat should stop reading when EOF is detected
function helptext {
cat << EOF
Usage: ./github-api.sh -[VvhloipCuc] &  [ -F <file location> | -K <api key> ] & -u <user/org name> -n <repository name> -d <repository description> -o <other>

Information:

-h     (help)                  Display help

-v     (version)               Display version

-V     (verbose)               Display verbose information, should be the first argument

Api key:

-F <location>  (file)          Import github api key from file

-K <key>       (key)           Use api key from argument (NOT SAFE!)

Repository:

-l             (list repos)    List github repos

-o             (organization)  Use organization for command

-u             (update)        Update a repository

-c             (create)        Create a repository

-n             (name)          Name for Repository (default:DEFAULT)

-d             (description)   Repository description

-i             (visibility)    set "Visibility" Value to public (default: private)

-p             (private)       set "Private" Value to false (default: true)

-U             (user)          User/Org to apply to

-C             (contributors)  List Contributors

-O             (other)         List other items, will be applied to https://api.github.com/repos/OWNER/REPO/$other.
                               must be used with -u (OWNER) and -n (REPO)
                               Ex: [languages | tags | teams | topics ]

EOF
};

PARAM=" :F:K:n:d:U:Vvhcplo";

while getopts $PARAM opt; do
  case $opt in
    V)
       echo "-V option was supplied." >&2
       OPT_V=1;
        ;;
    K)
	if [ $OPT_V -eq 1 ]; then echo "-K option was supplied. OPTARG: $OPTARG" >&2 ; fi;
	OPT_K=$OPTARG;
        APIKEY=$OPTARG;
	;;
    F)
	if [ $OPT_V -eq 1 ]; then echo "-F option was supplied. OPTARG: $OPTARG" >&2 ; fi;
        OPT_F=$OPTARG;
        APIKEY=$(cat $OPTARG);
        ;;
    o)
	if [ $OPT_V -eq 1 ]; then echo "-o option was supplied. OPTARG: $OPTARG" >&2 ; fi;
	ORG=1;
	GITLINK="https://api.github.com/orgs/$USER/repos";
         ;;
    v)
	if [ $OPT_V -eq 1 ]; then echo "-v option was supplied." >&2 ; fi;
        echo "Name: $NAME $VERSION, By $DEVELOPER";
	echo "Github link: $FROM";
	echo "Copyright (c) $(date "+%Y"), $DEVELOPER";
	echo "All rights reserved.";
	echo "License: BSD 3-Clause License: https://raw.githubusercontent.com/maxbybee/github-api/master/LICENSE";
	;;
    h)
        helptext | less;
         ;;
    U)
	if [ $OPT_V -eq 1 ]; then echo "-U option was supplied. OPTARG: $OPTARG" >&2 ; fi;
        USER=$OPTARG;
         ;;
    n)
	if [ $OPT_V -eq 1 ]; then echo "-n option was supplied. OPTARG: $OPTARG" >&2 ; fi;
        REPO_NAME=$OPTARG;
         ;;
    d)
	if [ $OPT_V -eq 1 ]; then echo "-d option was supplied. OPTARG: $OPTARG" >&2 ; fi;
        REPO_DESC=$OPTARG;
         ;;
    c)
	if [ $OPT_V -eq 1 ]; then echo "-c option was supplied. OPTARG: $OPTARG" >&2 ; fi;
        interact_create;
         ;;
    l)
	if [ $OPT_V -eq 1 ]; then echo "-c option was supplied. OPTARG: $OPTARG" >&2 ; fi;
        interact_list;
         ;;
    :)
        echo hi;
	exit 1;
         ;;
    *)
         ## default
         exit 1;
  esac
done

if [ $OPT_V -eq 1 ]; then echo " opt k: $OPT_K opt f: $OPT_F opt v: $OPT_V apikey $APIKEY";echo $GITLINK ; fi;


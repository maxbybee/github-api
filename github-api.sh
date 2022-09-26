#!/bin/bash
VERSION=V0.1.0;
DEVELOPER=maxbybee;
FROM=https://github.com/maxbybee/github-api;
GITLINK=https://api.github.com/user/repos;
NAME=github-api;
OPT_V=0;
APIKEY=;
REPO_NAME=DEFAULT;
REPO_PRIVATE=;
REPO_VISIBILITY=;
# `cat << EOF` This means that cat should stop reading when EOF is detected
function main {
curl -X POST -H "Accept: application/vnd.githubjson" -H "Authorization: Bearer $APIKEY" $GITLINK -d '{"name":"$REPO_NAME","private": $REPO_PRIVATE,"visibility": "$REPO_VISIBILITY"}'
};


function usage {
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

-U             (user)          User to apply to (CANNOT be used with org)

-C             (contributors)  List Contributors

-O             (other)         List other items, will be applied to https://api.github.com/repos/OWNER/REPO/$other.
                               must be used with -u (OWNER) and -n (REPO)
                               Ex: [languages | tags | teams | topics ]

EOF
};

PARAM=" :F:K:Vvh";

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
    v)
	if [ $OPT_V -eq 1 ]; then echo "-v option was supplied." >&2 ; fi;
        echo "Name: $NAME $VERSION, By $DEVELOPER";
	echo "Github link: $FROM";
	echo "Copyright (c) $(date "+%Y"), $DEVELOPER";
	echo "All rights reserved.";
	echo "License: BSD 3-Clause License: https://raw.githubusercontent.com/maxbybee/github-api/master/LICENSE";
	;;
    h)
        usage | less;
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

if [ $OPT_V -eq 1 ]; then echo " opt k: $OPT_K opt f: $OPT_F opt v: $OPT_V apikey $APIKEY"; fi;


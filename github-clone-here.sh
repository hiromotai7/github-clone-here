#!/bin/bash

URL=$1
GITHUBHTTPS=https://github.com/
GITHUBSSH=git@github.com:
if [[ $URL =~ ^git@github ]]; then
	GITHUB=$GITHUBSSH
fi
if [[ $URL =~ ^https ]]; then
	GITHUB=$GITHUBHTTPS
fi
GITREPO=${URL#${GITHUB}}

test -d $GITREPO || mkdir -p $GITREPO
git clone ${GITHUB}${GITREPO} $GITREPO

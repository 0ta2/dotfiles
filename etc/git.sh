#!/bin/bash
####################################
#
# Git setup
#
####################################

echo "==>gitconfigに追加します"
git config --global alias.gr "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
echo git config --global alias.gr "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"

git config --global alias.st status
echo git config --global alias.st status

git config --global alias.cm commit
echo git config --global alias.cm commit

git config --global alias.ch checkout
echo git config --global alias.ch checkout

git config --global alias.br branch
echo git config --global alias.br branch

git config --global push.default simple
echo git config --global push.default simple

git config --global fetch.prune true
echo git config --global fetch.prune true

git config --global core.quotepath false
echo git config --global core.quotepath false

git config --global core.safecrlf true
echo git config --global core.safecrlf true

git config --global core.autocrlf false
echo git config --global core.autocrlf false

git config --global color.ui auto
echo git config --global color.ui auto

git config --global credential.helper wincred
echo git config --global credential.helper wincred

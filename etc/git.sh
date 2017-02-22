#!/bin/bash
####################################
#
# Git setup
#
####################################

git config --global alias.gr "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.ch checkout
git config --global alias.br branch
git config --global push.default simple
git config --global fetch.prune true
git config --global core.quotepath false
git config --global core.safecrlf true
git config --global core.autocrlf false
git config --global color.ui auto
git config --global credential.helper wincred


#!/bin/bash

####################################
#
# Go setup
#
####################################

export GOPATH=${HOME}/.go

gopackage='
github.com/motemen/ghq
'

if [ -d "${HOME}/.go" ]; then
  echo "===> mkdir ${HOME}/.go"
  mkdir -p ${HOME}/.go/bin
fi

# go installを実行
for go_install in ${gopackage}; do
  go_package_name=`basename ${go_install}`
  if [ `find ${HOME}/.go/bin -name ${go_package_name}` ]; then
    echo "===> ${go_install}をインストールします。"
    go get ${go_install}
  else
    echo "===> ${go_install}は、すでにインストールされています。"
    go get ${go_install}
  fi
done

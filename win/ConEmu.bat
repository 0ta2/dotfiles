@echo off

rem ConEmu64.exe を起動する
rem -LoadCfgFile ConEmu の設定ファイルを読み込む
rem -Dir 作業ディレクトリを指定する
rem -run git-cmd を起動する。
start "" "C:\Program Files\ConEmu\ConEmu64.exe" -LoadCfgFile C:\Dev\git\dotfiles\win\ConEmu.xml -Dir C:\ -run "C:\Program Files\Git\git-cmd.exe" --no-cd --command=usr/bin/bash.exe -l -i
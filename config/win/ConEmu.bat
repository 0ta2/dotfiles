@echo off

rem ConEmu64.exe ���N������
rem -LoadCfgFile ConEmu �̐ݒ�t�@�C����ǂݍ���
rem -Dir ��ƃf�B���N�g�����w�肷��
rem -run git-cmd ���N������B
start "" "C:\Program Files\ConEmu\ConEmu64.exe" -LoadCfgFile C:\Dev\git\dotfiles\win\ConEmu.xml -Dir C:\ -run "C:\Program Files\Git\git-cmd.exe" --no-cd --command=usr/bin/bash.exe -l -i
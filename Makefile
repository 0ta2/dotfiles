#
# dotfiles setup
#

.PHONY: install
.PHONY: uninstall
.PHONY: clean

install:
	./etc/setup.sh

symlink:
	./etc/symlink.sh

vim:
	./etc/vim-plug.sh

go:
	./etc/go.sh

git:
	./etc/git.sh
brew:
	./etc/brew.sh

zplug:
	./etc/zplug.sh

clean:
	unlink ~/.vim
	unlink ~/.vimrc
	unlink ~/.zsh
	unlink ~/.zshrc
	unlink ~/.tmux.conf

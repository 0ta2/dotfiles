#
# dotfiles setup
#

.PHONY: install
.PHONY: uninstall
.PHONY: clean

install:
	@sh ./etc/setup.sh

symlink:
	@sh ./etc/symlink.sh

vim:
	@sh ./etc/vim-plug.sh

go:
	@sh ./etc/go.sh

git:
	@sh ./etc/git.sh
brew:
	@sh ./etc/brew.sh

clean:
	unlink ~/.vim
	unlink ~/.vimrc
	unlink ~/.zsh
	unlink ~/.zshrc
	unlink ~/.tmux.conf

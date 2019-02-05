#-------------------
# dotfiles setup
#-------------------

.PHONY: instal.
.PHONY: symlink
.PHONY: vim-plug
.PHONY: go
.PHONY: git
.PHONY: brew
.PHONY: zlug
.PHONY: tpm
.PHONY: clean

install:
	./etc/setup.sh

symlink:
	./etc/symlink.sh

vim-plug:
	./etc/vim-plug.sh

go:
	./etc/go.sh

git:
	./etc/git.sh

brew:
	./etc/brew.sh

zplug:
	./etc/zplug.sh

tpm:
	./etc/tpm.sh

clean:
	unlink ~/.vim
	unlink ~/.vimrc
	unlink ~/.zsh
	unlink ~/.zshrc
	unlink ~/.tmux.conf
	unlink ~/.tmux

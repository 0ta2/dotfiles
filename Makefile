DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

define print_error
    printf "\033[31m    [×] $1\033[m\n"
endef

define print_success
    printf "\033[32m    [✓] $1\033[m\n"
endef

define print_warning
    printf "\033[33m    [!] $1\033[m\n"
endef

define print_title
    printf "\n\n\033[35m$1\033[m\n\n"
endef

define print_list
    printf "\033[36m$1\n"
endef

all:

init: update install deploy ## Environment setup for dotfiles
	@exec $$SHELL

update: ## Update dotfiles
	@$(call print_title, Start to update dotfiles)
	git pull origin main

install: ## Run make update, deploy, init
	@$(call print_title, Start to install dotfiles)
	@$(call print_success, `cat ./homebrew//Brewfile.all ./homebrew/Brewfile.${WORKSTATION} | brew bundle --file=-`)
	@$(call print_success, `mise install`)

brew-sync: ## brewでインストールされているものを同期します。(Brewfileにないファイルは削除されます)
	@$(call print_title, Start to brew sync)
	@$(call print_success, `cat ./homebrew//Brewfile.all ./homebrew/Brewfile.${WORKSTATION} | brew bundle --cleanup --file=-`)

deploy: ## Create symlink to home directory
	@$(call print_title, Start to deploy dotfiles to home directory)
	@mkdir -p $(HOME)/.config
	@$(call print_success, `ln -sfnv $(DOTPATH)/zsh/.zshenv ~/.zshenv`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zsh ~/.config/zsh`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/mise ~/.config/mise`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/.default-go-packages ~/.default-go-packages`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/nvim ~/.config/nvim`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/nvim/.ideavimrc ~/.ideavimrc`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zed/settings.json ~/.config/zed/settings.json`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zed/keymap.json ~/.config/zed/keymap.json`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/code/settings.json ~/Library/Application\ Support/Code/User/settings.json`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/code/settings.json ~/Library/Application\ Support/Code/User/keybindings.json`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zellij ~/.config/zellij`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/tmux ~/.config/tmux`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/efm-langserver ~/.config/efm-langserver`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/karabiner ~/.config/karabiner`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/ghostty ~/.config/ghostty`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/git ~/.config/git`)

clean: ## Remove the dot files and this repo
	@$(call print_title, Remove dot files in your home directory...)
	@-$(call print_success, `rm -fr $(HOME)/.zshenv`)
	@-$(call print_success, `rm -fr $(HOME)/.config/zsh`)
	@-$(call print_success, `rm -fr $(HOME)/.config/nvim`)
	@-$(call print_success, `rm -fr $(HOME)/.config/tmux`)
	@-$(call print_success, `rm -fr $(HOME)/.config/alacritty`)
	@-$(call print_success, `rm -fr $(HOME)/.config/zed`)
	@-$(call print_success, `rm -fr $(HOME)/.config/efm-langserver`)
	@-$(call print_success, `rm -fr $(HOME)/.config/karabiner`)
	@-$(call print_success, `rm -fr $(HOME)/.config/zellij`)
	@-$(call print_success, `rm -fr $(HOME)/.config/ghostty`)
	@-$(call print_success, `rm -fr $(HOME)/.config/git`)
	@-$(call print_success, `rm -fr $(HOME)/Library/Application\ Support/Code/User/settings.json`)
	@-$(call print_success, `rm -fr $(HOME)/Library/Application\ Support/Code/User/keybindings.json`)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

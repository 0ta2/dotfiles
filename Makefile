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

init: ## Setup environment settings
	@$(call print_title, Start to init dotofiles)
	@$(foreach val, $(wildcard ./init/*.sh), bash $(val);)

update: ## Fetch changes for this repo
	@$(call print_title, Start to update dotfiles)
	git pull origin main
	git submodule update --init --recursive
	git submodule foreach git pull origin master

install: update deploy init ## Run make update, deploy, init
	@exec $$SHELL

vs-install: ## Installing the vscode extension.
	@$(call print_title, Start to vscode extension)
	sh $(DOTPATH)/init/07_vscode.sh

deploy: ## Create symlink to home directory
	@$(call print_title, Start to deploy dotfiles to home directory)
	@mkdir -p $(HOME)/.config
	@$(call print_success, `ln -sfnv $(DOTPATH)/zsh/.zshenv ~/.zshenv`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zsh ~/.config/zsh`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/nvim ~/.config/nvim`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/nvim/.ideavimrc ~/.ideavimrc`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/tmux ~/.config/tmux`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/alacritty ~/.config/alacritty`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zed/settings.json ~/.config/zed/settings.json`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/efm-langserver ~/.config/efm-langserver`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/karabiner ~/.config/karabiner`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/zellij ~/.config/zellij`)
	@$(call print_success, `ln -sfnv $(DOTPATH)/mise ~/.config/mise`)

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

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

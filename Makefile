DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

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

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), $(call print_list,`/bin/ls -dF $(val)`);)

deploy: ## Create symlink to home directory
	@$(call print_title, Start to deploy dotfiles to home directory)
	@$(foreach val, $(DOTFILES), $(call print_success, `ln -sfnv $(abspath $(val)) $(HOME)/$(val)`);)
	@$(call print_success, `ln -sfnv $(HOME)/.vim ~/.config/nvim`)
	@$(call print_success, `ln -sfnv $(HOME)/.vimrc ~/.config/nvim/init.vim`)
	@$(call print_success, `mkdir -p $(HOME)/.config && ln -sfnv $(DOTPATH)/powerline ~/.config/powerline`)

init: ## Setup environment settings
	@$(call print_title, Start to init dotofiles)
	@$(foreach val, $(wildcard ./etc/*.sh), bash $(val);)

update: ## Fetch changes for this repo
	@$(call print_title, Start to update dotfiles)
	git pull origin master
	git submodule update --init --recursive

install: update deploy init ## Run make update, deploy, init
	@exec $$SHELL

clean: ## Remove the dot files and this repo
	@$(call print_title, Remove dot files in your home directory...)
	@-$(foreach val, $(DOTFILES), $(call print_success, `rm -vrf $(HOME)/$(val)`);)
	$(call print_success, `-rm -rf $(DOTPATH)`)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

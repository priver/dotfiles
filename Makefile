install: \
	install-homebrew \
	install-fisher

config: \
	config-bash \
	config-editorconfig \
	config-fish \
	config-git \
	config-mc \
	config-nano \
	config-ssh

install-homebrew:
ifeq ($(shell uname),Darwin)
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=$(PWD)/homebrew/Brewfile
endif

install-fisher:
ifeq ($(shell uname),Darwin)
	fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
endif

config-bash:
	ln -sf $(PWD)/bash/bash_aliases ~/.bash_aliases
	ln -sf $(PWD)/bash/bashrc ~/.bashrc
	ln -sf $(PWD)/bash/profile ~/.profile

config-editorconfig:
	ln -sf $(PWD)/.editorconfig ~/.editorconfig

config-fish:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/fish/functions/* ~/.config/fish/functions/
	ln -sf $(PWD)/fish/conf.d/* ~/.config/fish/conf.d/
	ln -sf $(PWD)/fish/fish_plugins ~/.config/fish/fish_plugins
	fish -c "fisher update"
endif

config-git:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig
endif

config-nano:
	ln -sf $(PWD)/nano/nanorc ~/.nanorc

config-mc:
	mkdir -p  ~/.local/share/mc/skins
	mkdir -p  ~/.config/mc
	ln -sf $(PWD)/mc/dracula256.ini ~/.local/share/mc/skins/dracula256.ini
	ln -sf $(PWD)/mc/ini ~/.config/mc/ini

config-ssh:
ifeq ($(shell uname),Darwin)
	mkdir -p ~/.ssh
	ln -sf $(PWD)/ssh/config ~/.ssh/config
endif

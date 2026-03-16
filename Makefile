all: install config

install: install-homebrew

config: \
	config-zsh \
	config-bat \
	config-editorconfig \
	config-ghostty \
	config-git \
	config-mc \
	config-nano \
	config-ssh

install-homebrew:
ifeq ($(shell uname),Darwin)
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	ln -sf $(PWD)/homebrew/Brewfile ~/Brewfile
	brew bundle --file=~/Brewfile
endif

config-bat:
	ln -sf $(PWD)/bat/config $$(bat --config-dir)/config

config-editorconfig:
	ln -sf $(PWD)/.editorconfig ~/.editorconfig

config-fresh:
	ln -sf $(PWD)/fresh/config.json ~/.config/fresh/config.json

config-ghostty:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/ghostty/config ~/.config/ghostty/config
endif

config-git:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig
endif

config-mc:
	mkdir -p  ~/.config/mc
	ln -sf $(PWD)/mc/ini ~/.config/mc/ini

config-nano:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/nano/nanorc ~/.nanorc
else
	ln -sf $(PWD)/nano/nanorc.debian ~/.nanorc
endif

config-ssh:
ifeq ($(shell uname),Darwin)
	mkdir -p ~/.ssh/config.d
	ln -sf $(PWD)/ssh/config ~/.ssh/config
endif

config-zsh:
	ln -sf $(PWD)/zsh/p10k.zsh ~/.p10k.zsh
	ln -sf $(PWD)/zsh/zimrc ~/.zimrc
	ln -sf $(PWD)/zsh/zshrc ~/.zshrc

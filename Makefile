all: install config

install: \
	install-bat \
	install-homebrew \
	install-iterm2

config: \
	config-zsh \
	config-editorconfig \
	config-git \
	config-mc \
	config-nano \
	config-ssh

install-bat:
	mkdir -p $$(bat --config-dir)/themes
	ln -sf $(PWD)/bat/GitHubDark.tmTheme $$(bat --config-dir)/themes
	bat cache --build

install-homebrew:
ifeq ($(shell uname),Darwin)
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	ln -sf $(PWD)/homebrew/Brewfile ~/Brewfile
	brew bundle --file=~/Brewfile
endif

install-iterm2:
	curl -fsSL https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

config-editorconfig:
	ln -sf $(PWD)/.editorconfig ~/.editorconfig

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
	ln -sf $(PWD)/zsh/priver.zsh-theme ~/priver.zsh-theme
	ln -sf $(PWD)/zsh/zimrc ~/.zimrc
	ln -sf $(PWD)/zsh/zshrc ~/.zshrc

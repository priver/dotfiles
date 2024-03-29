apt := $(shell command -v apt 2> /dev/null)

install: \
	config-homebrew \
	install-homebrew \
	install-apt \
	install-zsh

config: \
	config-zsh \
	config-editorconfig \
	config-git \
	config-mc \
	config-nano \
	config-ssh

config-homebrew:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/homebrew/Brewfile ~/Brewfile
endif

install-homebrew:
ifeq ($(shell uname),Darwin)
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	brew bundle --file=~/Brewfile
endif

install-apt:
ifdef apt
	sudo apt -y install zsh batcat fd-find ripgrep
	sudo ln -s /usr/bin/batcat /usr/local/bin/bat
	sudo ln -s /usr/bin/fdfind /usr/local/bin/fd
endif

install-zsh:
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ifeq ($(shell uname),Darwin)
	corepack enable
	pnpm install-completion zsh
endif

config-zsh:
	ln -sf $(PWD)/zsh/p10k.zsh ~/.p10k.zsh
	ln -sf $(PWD)/zsh/zshrc ~/.zshrc

config-editorconfig:
	ln -sf $(PWD)/.editorconfig ~/.editorconfig

config-git:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig
endif

config-mc:
	mkdir -p  ~/.local/share/mc/skins
	mkdir -p  ~/.config/mc
	ln -sf $(PWD)/mc/dracula256.ini ~/.local/share/mc/skins/dracula256.ini
	ln -sf $(PWD)/mc/ini ~/.config/mc/ini

config-nano:
	ln -sf $(PWD)/nano/nanorc ~/.nanorc

config-ssh:
ifeq ($(shell uname),Darwin)
	mkdir -p ~/.ssh
	ln -sf $(PWD)/ssh/config ~/.ssh/config
endif

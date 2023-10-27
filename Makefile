install: \
	config-homebrew \
	install-homebrew \
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
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=~/Brewfile
endif

install-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

	corepack enable
	pnpm install-completion zsh

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

install: \
	install-bash \
	install-bin \
	install-git \
	install-nano \
	install-linters \
	install-vscode

install-bash:
	ln -sf $(PWD)/bash/bash_aliases ~/.bash_aliases
	ln -sf $(PWD)/bash/bashrc ~/.bashrc
	ln -sf $(PWD)/bash/profile ~/.profile

install-bin:
	mkdir -p ~/bin/
	ln -sf $(PWD)/bin/* ~/bin/

install-git:
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig

install-nano:
	ln -sf $(PWD)/nano/nanorc ~/.nanorc

install-linters:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/linters/flake8 ~/.config/flake8
	ln -sf $(PWD)/linters/pydocstyle ~/.pydocstyle
	ln -sf $(PWD)/linters/eslintrc.json ~/.eslintrc.json
	ln -sf $(PWD)/linters/stylelintrc ~/.stylelintrc
endif

install-vscode:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/vscode/settings.json ~/Library/Application\ Support/Code/User
	ln -sf $(PWD)/vscode/extensions.json ~/Library/Application\ Support/Code/User
endif

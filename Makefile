install: install-bash install-nano install-git install-subl

install-bash:
	ln -sf $(PWD)/bash/bash_aliases ~/.bash_aliases
	ln -sf $(PWD)/bash/bash_completion ~/.bash_completion
	ln -sf $(PWD)/bash/bashrc ~/.bashrc
	ln -sf $(PWD)/bash/profile ~/.profile

install-git:
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig

install-nano:
	ln -sf $(PWD)/nano/nanorc ~/.nanorc

install-subl:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/sublimetext3/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
	ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
endif

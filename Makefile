install: install-bash install-nano install-git

install-bash:
	ln -sf $(PWD)/bash/bash_aliases ~/.bash_aliases
	ln -sf $(PWD)/bash/bash_completion ~/.bash_completion
	ln -sf $(PWD)/bash/bashrc ~/.bashrc
	ln -sf $(PWD)/bash/profile ~/.profile

install-git:
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig

install-nano:
	ln -sf $(PWD)/nano/nanorc ~/.nanorc

install-x:
	mkdir -p ~/.xsession.d
	ln -sf $(PWD)/xsession/xsessionrc ~/.xsessionrc

install-x-abyssus:
	mkdir -p ~/.xsession.d
	ln -sf $(PWD)/xsession/abyssus.sh ~/.xsession.d/

install: install-nano install-git install-xsession

install-nano:
	ln -sf `pwd`/nano/nanorc ~/.nanorc

install-git:
	ln -sf `pwd`/git/gitconfig ~/.gitconfig

install-xsession:
	mkdir -p ~/.xsession.d
	ln -sf `pwd`/xsession/xsessionrc ~/.xsessionrc

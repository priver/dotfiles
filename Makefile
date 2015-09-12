install: \
	install-bash \
	install-bin \
	install-nano \
	install-git \
	install-ruby \
	install-ansible \
	install-subl

install-bash:
	ln -sf $(PWD)/bash/bash_aliases ~/.bash_aliases
	ln -sf $(PWD)/bash/bash_completion ~/.bash_completion
	ln -sf $(PWD)/bash/bashrc ~/.bashrc
	ln -sf $(PWD)/bash/profile ~/.profile

install-bin:
	mkdir -p ~/bin/
	ln -sf $(PWD)/bin/* ~/bin/

install-git:
	ln -sf $(PWD)/git/gitconfig ~/.gitconfig

install-nano:
	ln -sf $(PWD)/nano/nanorc ~/.nanorc

install-ruby:
ifeq ($(shell uname),Darwin)
	gem install bundler
	bundle install --gemfile=$(PWD)/ruby/Gemfile
endif

install-ansible:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/ansible/ansible.cfg ~/.ansible.cfg
endif

install-subl:
ifeq ($(shell uname),Darwin)
	ln -sf $(PWD)/sublimetext3/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
	ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
	ln -sf $(PWD)/linters/jshintrc ~/.jshintrc
	ln -sf $(PWD)/linters/jscsrc ~/.jscsrc
	ln -sf $(PWD)/linters/scss-lint.yml ~/.scss-lint.yml
endif

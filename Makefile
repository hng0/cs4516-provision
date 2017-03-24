all:
	git submodule init && git submodule update
	ansible-playbook -i secnet-hosts site.yml

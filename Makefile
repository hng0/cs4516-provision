.PHONY: git-submodule-init-level-0 build-floodlight

all: git-submodule-init-level-0 build-floodlight deploy

deploy:
	ansible-playbook -i secnet-hosts site.yml

git-submodule-init-level-0:
	git submodule init && git submodule update

build-floodlight:
	git submodule init roles/floodlight/files/fl
	git submodule update roles/floodlight/files/fl
	cd roles/floodlight/files/fl; ant


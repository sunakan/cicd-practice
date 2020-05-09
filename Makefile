export ANSIBLE_IP=192.168.1.123
export CI_IP=192.168.2.11
export CD_IP=192.168.2.12
export DEV_IP=192.168.2.13

plugin:
	vagrant plugin install vagrant-hosts

up: plugin
	vagrant up

chmod:
	chmod 600 .vagrant/machines/*/virtualbox/private_key

rsync-auto:
	vagrant rsync-auto

# SSHのオプションとSSH先
# $1：VMマシン名(VirtualBox側の名前)
# $2：VM側のIP(VirtualBox側の名前)
define ssh-option
	-o StrictHostKeyChecking=no \
	-o UserKnownHostsFile=/dev/null \
	-i .vagrant/machines/$1/virtualbox/private_key \
	vagrant@$2
endef
ansible: chmod
	ssh $(call ssh-option,ansible,${ANSIBLE_IP})
ci: chmod
	ssh $(call ssh-option,ci,${CI_IP})
cd: chmod
	ssh $(call ssh-option,cd,${CD_IP})

clean:

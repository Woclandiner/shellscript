#!/bin/bash

eval `ssh-agent -s`
ssh-add ~/keys/ifood-ansible-endpoint

/usr/bin/ansible-pull -U git@github.com:Woclandiner/ansible.git -i /etc/ansible/hosts


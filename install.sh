#!/bin/env bash

mkdir -p ansible
mkdir -p dotfiles

GIT_SSH_COMMAND="ssh -i keys/workstation" git clone git@github.com:henman95/ansible.workstation.git  ansible/workstation
GIT_SSH_COMMAND="ssh -i keys/workstation" git clone git@github.com:henman95/dotfiles.git dotfiles/core 
GIT_SSH_COMMAND="ssh -i keys/workstation" git clone git@github.com:henman95/dotfiles.private.git dotfiles/private

#!/bin/env bash

SSH_KEY="keys/workstation"

if [[ ! -f "${SSH_KEY}" ]]; then
  echo "Error: Key ${SSH_KEY} not found. Please install ssh key into ${SSH_KEY}." >&2
  exit 1
fi

if grep -q "Fedora" /etc/os-release; then
  sudo /usr/bin/dnf install -y stow ansible-core ansible-collection-community-general
fi


GIT_SSH_COMMAND="ssh -i ${SSH_KEY}" git clone git@github.com:henman95/ansible.workstation.git  ansible/workstation
GIT_SSH_COMMAND="ssh -i ${SSH_KEY}" git clone git@github.com:henman95/dotfiles.git dotfiles/core 
GIT_SSH_COMMAND="ssh -i ${SSH_KEY}" git clone git@github.com:henman95/dotfiles.private.git dotfiles/private

mkdir -p ${HOME}/bin
stow -t ${HOME} -d setup_files $(ls setup_files)

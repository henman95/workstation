#!/bin/env bash
WORKSTATION_DIR=${HOME}/workstation

# Update dotfiles
for config in $(ls ${WORKSTATION_DIR}/dotfiles); do
  echo $config
  SOURCE=${WORKSTATION_DIR}/dotfiles/${config}
  TARGET=${HOME}
  stow -t ${TARGET} -d ${SOURCE} $(ls ${SOURCE})
done

#!/bin/bash

# Install neovim
cd ${HOME} && \
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
tar xvfz nvim-linux64.tar.gz
export PATH="${HOME}/nvim-linux64/bin:${PATH}"

if [ ! -d "${HOME}/.config/nvim" ]; then
    # Setup neovim configs if not already available
    mkdir -p ${HOME}/.config && \
    cd ${HOME}/.config && \
    git clone https://github.com/akshaysubr/nvim.git
fi

# For containers, install venv for Mason LSP installs
if [ "$(id -u)" -eq 0 ]; then
    source /etc/os-release
    case $ID in
          ubuntu) apt update && apt install -y python3.10-venv 
              ;;

          *) echo "This is an unknown distribution."
              ;;
    esac
fi

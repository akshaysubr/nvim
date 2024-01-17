#!/bin/bash

# Install neovim
cd ${HOME} && \
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
tar xvfz nvim-linux64.tar.gz
export PATH="${HOME}/nvim-linux64/bin:${PATH}"

# Setup neovim configs
mkdir -p ${HOME}/.config && \
cd ${HOME}/.config && \
git clone https://github.com/akshaysubr/nvim.git

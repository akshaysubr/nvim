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

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install all packer packages
${HOME}/nvim-linux64/bin/nvim --headless +"sleep 5" +"autocmd User PackerComplete quitall" +"silent PackerSync" +qa
# Install treesitter LSPs
${HOME}/nvim-linux64/bin/nvim --headless +"sleep 5" +"silent TSInstall" +"sleep 5" +qa

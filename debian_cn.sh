#!/bin/sh

sudo apt install -y build-essential clang emacs nmap gnome-tweaks neovim chromium-browser fd-find ripgrep valgrind ncat gdb hyperfine fonts-jetbrains-mono fonts-dejavu-mono python3-pip tcpdump npm lldb

# sudo apt install -y delve golang wireshark reaver arpwatch hashcat rkhunter gobuster hping3 ffuf whatweb nbtscan socat yersinia kismet macchanger dnsenum cryptsetup testdisk subfinder lynis foremost chntpw capstone binwalk medusa bluez yara steghide sslscan evolution-ews bzip2 texlive texlive-multirow texlive-overpic texlive-appendix texlive-cjk texlive-ctex virt-manager john nikto hydra parsero @virtualization

cp $HOME/.bashrc $HOME/.bashrc.bak
# echo 'source "$HOME/.bash_git.sh"' >> $HOME/.bashrc
echo 'alias ls="ls --group-directories-first --color"' >> $HOME/.bashrc
echo 'alias vim="nvim"' >> $HOME/.bashrc
echo 'PATH="$HOME/.local/share/nvim/mason/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"' >> $HOME/.bashrc
echo 'export RUSTUP_DIST_SERVER="https://rsproxy.cn"' >> $HOME/.bashrc
echo 'export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"' >> $HOME/.bashrc

curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh

mkdir -vp ${CARGO_HOME:-$HOME/.cargo}

cat << EOF | tee -a ${CARGO_HOME:-$HOME/.cargo}/config.toml
[source.crates-io]
replace-with = 'rsproxy-sparse'

[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"

[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"

[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"

[net]
git-fetch-with-cli = true
EOF

ln -s $HOME/tools/dotfiles/nvim $HOME/.config/
ln -s $HOME/tools/dotfiles/helix $HOME/.config/
ln -s $HOME/tools/dotfiles/alacritty $HOME/.config/
ln -s $HOME/tools/dotfiles/.tmux.conf $HOME/
ln -s $HOME/tools/dotfiles/bash_git.sh $HOME/.bash_git.sh
ln -s $HOME/tools/dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/tools/dotfiles/vim/vim $HOME/.vim
ln -s $HOME/tools/dotfiles/cargo/config.toml $HOME/.cargo/config.toml

# git config --global url."https://gitclone.com/".insteadOf https://

# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# git clone https://github.com/alacritty/alacritty-theme ~/tools/dotfiles/alacritty/alacritty-theme

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# pip install pandas wheel scikit-learn

# Golang proxy in China
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

npm config set registry https://registry.npmmirror.com

# rustup component add rust-analyzer

# npm i bash-language-server vscode-langservers-extracted yaml-language-server@next

# pip install -U 'python-lsp-server[all]'

#!/bin/sh

sudo dnf install clang golang mozilla-openh264 gnome-tweaks neovim chromium yaru-theme arc-theme wireshark gcc-g++ fd-find ripgrep reaver arpwatch hashcat netcat rkhunter gobuster hping3 ffuf whatweb nbtscan socat yersinia kismet macchanger dnsenum cryptsetup testdisk subfinder lynis foremost chntpw capstone binwalk medusa bluez  yara steghide sslscan evolution-ews bzip2 texlive texlive-multirow texlive-overpic texlive-appendix texlive-cjk texlive-ctex virt-manager emacs nmap john nikto hydra parsero valgrind gdb hyperfine jetbrains-mono-fonts jetbrains-mono-nl-fonts dejavu-fonts-all python3-pip tcpdump npm delve lldb helix -y

cp $HOME/.bashrc $HOME/.bashrc.bak
# echo 'source "$HOME/.bash_git.sh"' >> $HOME/.bashrc
echo 'alias ls="ls --group-directories-first --color"' >> $HOME/.bashrc
echo 'alias vim="nvim"' >> $HOME/.bashrc
echo 'PATH="$HOME/.local/share/nvim/mason/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"' >> $HOME/.bashrc
echo 'export RUSTUP_DIST_SERVER="https://rsproxy.cn"' >> $HOME/.bashrc
echo 'export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"' >> $HOME/.bashrc

curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh

ln -s $HOME/tools/dotfiles/nvim $HOME/.config/
ln -s $HOME/tools/dotfiles/helix $HOME/.config/
ln -s $HOME/tools/dotfiles/alacritty $HOME/.config/
ln -s $HOME/tools/dotfiles/.tmux.conf $HOME/
ln -s $HOME/tools/dotfiles/bash_git.sh $HOME/.bash_git.sh
ln -s $HOME/tools/dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/tools/dotfiles/cargo/config.toml $HOME/.cargo/config.toml

# git config --global url."https://gitclone.com/".insteadOf https://

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# git clone https://github.com/alacritty/alacritty-theme ~/tools/dotfiles/alacritty/alacritty-theme

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# pip install pandas wheel scikit-learn

# Golang proxy in China
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

npm config set registry https://registry.npmmirror.com

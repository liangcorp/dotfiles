#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo dnf install clang golang mozilla-openh264 gnome-tweaks neovim chromium yaru-theme arc-theme wireshark gcc-g++ fd-find ripgrep reaver arpwatch hashcat netcat rkhunter gobuster hping3 ffuf whatweb nbtscan socat yersinia kismet macchanger dnsenum cryptsetup testdisk subfinder lynis foremost chntpw capstone binwalk medusa bluez bettercap yara steghide sslscan evolution-ews bzip2 texlive virt-manager emacs nmap john nikto aircrack-ng hydra parsero valgrind gdb hyperfine jetbrains-mono-fonts jetbrains-mono-nl-fonts dejavu-fonts-all python3-pip tcpdump npm delve lldb helix gnucash @virtualization -y

sudo systemctl start libvirtd
sudo systemctl enable libvirtd

pip install pandas wheel scikit-learn

ln -s $HOME/tools/dotfiles/nvim $HOME/.config/
ln -s $HOME/tools/dotfiles/helix $HOME/.config/
ln -s $HOME/tools/dotfiles/alacritty $HOME/.config/
ln -s $HOME/tools/dotfiles/.tmux.conf $HOME/
ln -s $HOME/tools/dotfiles/bash_git.sh $HOME/.bash_git.sh
ln -s $HOME/tools/dotfiles/vim/vimrc $HOME/.vimrc

cp $HOME/.bashrc $HOME/.bashrc.bak
# echo 'source "$HOME/.bash_git.sh"' >> $HOME/.bashrc
echo 'alias ls="ls --group-directories-first --color"' >> $HOME/.bashrc
echo 'alias vim="nvim"' >> $HOME/.bashrc
echo 'PATH="$HOME/.local/share/nvim/mason/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"' >> $HOME/.bashrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

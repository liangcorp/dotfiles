#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo dnf install clang go git mozilla-openh264 gnome-tweaks neovim chromium yaru-theme arc-theme wireshark gcc-g++ fd-find ripgrep reaver arpwatch hashcat netcat rkhunter gobuster hping3 ffuf whatweb nbtscan socat yersinia kismet macchanger dnsenum cryptsetup testdisk subfinder lynis foremost chntpw capstone binwalk medusa bluez bettercap yara steghide sslscan evolution-ews bzip2 texlive virt-manager emacs nmap john nikto aircrack-ng hydra parsero valgrind gdb hyperfine jetbrains-mono-fonts jetbrains-mono-nl-fonts dejavu-fonts-all python3-pip -y

pip install pandas wheel scikit-learn

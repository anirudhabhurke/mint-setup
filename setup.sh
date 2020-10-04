#!/bin/bash

echo 'Removing Firefox LibreOffice hexchat Thunderbird warpinator drawing'
sudo apt-get purge firefox libreoffice* hexchat thunderbird* warpinator drawing -y
sudo rm -Rf /etc/firefox/
sudo rm -Rf /usr/lib/firefox*

echo 'Installing git'
sudo apt install git -y

echo 'Installing Papirus Icon theme'
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt-get update -y
sudo apt-get install papirus-icon-theme -y

echo 'Setting theme'
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.cinnamon.theme name "Mint-Y-Dark-Blue"
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Dark-Blue"
gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-Y-Dark"
gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.cinnamon workspace-osd-visible false
gsettings set org.cinnamon.muffin tile-maximize true
gsettings set org.cinnamon.desktop.notifications bottom-notifications true
gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:0', 'panel1:left:2:grouped-window-list@cinnamon.org:1', 'panel1:right:1:systray@cinnamon.org:2', 'panel1:right:2:xapp-status@cinnamon.org:3', 'panel1:right:3:notifications@cinnamon.org:4', 'panel1:right:4:printers@cinnamon.org:5', 'panel1:right:5:removable-drives@cinnamon.org:6', 'panel1:right:6:keyboard@cinnamon.org:7', 'panel1:right:7:network@cinnamon.org:8', 'panel1:right:8:sound@cinnamon.org:9', 'panel1:right:9:power@cinnamon.org:10', 'panel1:right:12:calendar@cinnamon.org:11', 'panel1:right:15:show-desktop@cinnamon.org:12', 'panel1:left:1:workspace-switcher@cinnamon.org:13', 'panel1:right:11:separator@cinnamon.org:14', 'panel1:right:14:separator@cinnamon.org:15']"
gsettings set org.cinnamon alttab-switcher-style 'thumbnails'
gsettings set org.cinnamon.desktop.wm.preferences num-workspaces 3
gsettings set org.x.editor.preferences.editor scheme 'oblivion'
gsettings set org.nemo.preferences quick-renames-with-pause-in-between true
gsettings get org.gnome.Terminal.ProfilesList default
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ audible-bell true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ background-color '#232323'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ foreground-color '#f8f8f8'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ cursor-shape 'ibeam'

echo 'Installing Brave Browser'
sudo apt install apt-transport-https curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

echo 'Setting up Indian Time'
timedatectl set-timezone Asia/Kolkata
timedatectl set-local-rtc 1 --adjust-system-clock
gsettings set org.cinnamon.desktop.interface clock-use-24h false

echo 'Installing Visual Studio Code'
sudo apt update
sudo apt install software-properties-common apt-transport-https -y
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt update
sudo apt install code -y

echo 'Installing Cascadia Code Fonts'
sudo apt install fonts-cascadia-code -y

echo 'Installing TLP'
sudo add-apt-repository ppa:linrunner/tlp -y
sudo apt update
sudo apt install tlp tlp-rdw -y
sudo tlp start

echo 'Installing scrcpy'
sudo apt install scrcpy -y

echo 'Installing Parcellite Clipboard Manager'
sudo apt install parcellite -y

echo 'Installing Pinta'
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable -y
sudo apt-get update -y
sudo apt-get install pinta -y

echo 'Adding Android Utils to ~/.bashrc'
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc

echo 'Installing Node.js'
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts

echo 'Optimizing things'
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ font 'Cascadia Code PL Regular 12'
echo 'Done!'

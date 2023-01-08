#!/bin/bash

echo 'Installing Brave Browser'
sudo apt install apt-transport-https curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

echo 'Installing Visual Studio Code'
sudo apt update
sudo apt install software-properties-common apt-transport-https -y
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt update
sudo apt install code -y

sudo apt install fonts-firacode

echo 'Installing vim editor'
sudo apt-get install vim -y

echo 'Installing scrcpy'
sudo apt install scrcpy -y

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
sudo ufw logging off

echo ''
echo 'Done!'

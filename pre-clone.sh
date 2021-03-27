#!/bin/sh

echo "Installing git"
brew install git

echo "Generating SSH key"
if [ ! -a $HOME/.ssh/id_rsa.pub ]
then
    ssh-keygen -t rsa
fi

pbcopy < $HOME/.ssh/id_rsa.pub
echo "SSH public key has been copied. Please add it to GitHub, then press ENTER to continue."
read

# clone the dot-files project
echo "Cloning hapham's dot-file project"
mkdir $HOME/projects
cd $HOME/projects
git clone git@github.com:fanliver/dot-files.git

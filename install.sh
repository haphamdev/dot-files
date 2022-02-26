#!/bin/sh
if [ -d $HOME/projects/dot-files ]
then
    echo "A dot file directory alreay exists at $HOME/projects/dot-files. Skipped cloning."
else
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
fi

./install/install_tools.sh
./install/setup_configs.fish

#!/bin/sh
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is installed"
else
  echo "Homebrew is not installed. Installing..."
fi

if [ -d $HOME/projects/personal/dot-files ]; then
  echo "A dot file directory alreay exists at $HOME/projects/dot-files. Skipped cloning."
else
  mkdir -p $HOME/projects/personal
  echo "Installing git"
  brew install git

  echo "Generating SSH key"
  if [ ! -a $HOME/.ssh/id_ed25519.pub ]; then
    ssh-keygen -t rsa
    ssh-keygen -t ed25519 -C 'hapham.dev@gmail.com'
  fi

  pbcopy <$HOME/.ssh/id_ed25519.pub
  echo "SSH public key has been copied. Please add it to GitHub, then press ENTER to continue."
  read

  # clone the dot-files project
  echo "Cloning hapham's dot-file project"
  mkdir $HOME/projects
  cd $HOME/projects
  git clone git@github.com:fanliver/dot-files.git
fi

cd $HOME/projects/dot-files
./install/setup_configs.fish

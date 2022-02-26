#!/usr/local/bin/bash

install_if_not_exist () {
    app_command=$1

    if [ -z "$2" ]
    then
        app_name=$app_command
    else
        app_name=$2
    fi
    
    if command -v $app_command > /dev/null
    then
        echo "'$app_name' was installed already. Skip"
    else
        echo "Installing '$app_name'..."
        if [ $# -eq 1 ]
        then
            brew install $app_name
            return
        elif [ $# -eq 2 ]
        then
            brew install $app_name
            return
        else
            echo 'Wrong usage. Please pass 1 or 2 argument(s).'
            echo 'Example:'
            echo '    install_if_not_exist lazygit'
            echo "    install_if_not_exist alacritty '--cask alacritty'"
            return 1
        fi
    fi
}

install_if_not_exist bash
install_if_not_exist tmux
install_if_not_exist htop
install_if_not_exist urlview
install_if_not_exist fish
install_if_not_exist gitui
install_if_not_exist nvim
install_if_not_exist alacritty '--cask alacritty'
install_if_not_exist tmux
install_if_not_exist rg ripgrep
install_if_not_exist pgcli
install_if_not_exist mycli
install_if_not_exist gradle
install_if_not_exist jq
install_if_not_exist ncdu
install_if_not_exist agrind angle-grinder
install_if_not_exist fd
install_if_not_exist fzf
install_if_not_exist lazygit
install_if_not_exist delta git-delta
install_if_not_exist bat
install_if_not_exist ranger
install_if_not_exist exa
install_if_not_exist http httpie
install_if_not_exist procs
install_if_not_exist sd
install_if_not_exist zoxide
install_if_not_exist lnav

# create a directory for lnav logs
echo "Creating directory ~/lnav-logs..."
mkdir -p ~/lnav-logs


# change default shell to fish
echo
if [[ "$SHELL" == '/usr/local/bin/fish' ]];
then
    echo "Fish is default shell already. Skip"
else
    echo "Changing default shell to fish..."
    chsh -s /usr/local/bin/fish
    echo "Fish is not the default shell"
fi

# Change key mappings for home/end keys
echo "Mapping home/end keys to behave same as on Windows"
cat ~/projects/dot-files/mac-keybindings/DefaultKeyBinding.dict > ~/Library/KeyBindings/DefaultKeyBinding.dict
echo "Please restart your PC to apply the key mappings"


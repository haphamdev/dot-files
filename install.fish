#!/usr/local/bin/fish

mkdir -p $HOME/.config

set dir_dot_files $HOME/projects/dot-files
set dir_config $HOME/.config

# ============================================================================
# Utils
# ============================================================================

function file_not_exist
    if not test -e $argv[1]
        return 0
    else
        return 1
    end
end

function dir_not_exist
    if not test -d $argv[1]
        return 0
    else
        return 1
    end
end

function symlink_not_exist
    if not test -L $argv[1]
        return 0
    else
        return 1
    end
end

# ============================================================================
# Fish config
# ============================================================================
set sdir_fish_config $dir_dot_files/fish
set ddir_fish_config $dir_config/fish

function link_fish_config
    set -l sfile_fish_config $sdir_fish_config/config.fish
    set -l dfile_fish_config $ddir_fish_config/config.fish


    if symlink_not_exist $dfile_fish_config
        echo "Linking fish config..."
        mkdir $ddir_fish_config
        ln -s $sfile_fish_config $dfile_fish_config
        echo "Fish config is linked successfully"
    else
        echo "Fish config is linked already. Skip."
    end
end

function link_fish_functions
    set -l sdir_fish_functions $sdir_fish_config/functions
    set -l ddir_fish_functions $ddir_fish_config/functions


    if symlink_not_exist $ddir_fish_functions
        echo "Linking fish functions..."
        mkdir $ddir_fish_config
        ln -s $sdir_fish_functions $ddir_fish_functions
        echo "Fish functions are linked successfully"
    else
        echo "Fish functions are linked already. Skip"
    end
end

function install_oh_my_fish
    if type -q omf
        echo "Oh my fish is already installed. Skip installation."
        return
    end

    echo "Installing Oh my fish..."
    curl -L https://get.oh-my.fish | fish
    omf theme zish

    if test $status -eq 0
        echo "Oh my fish is installed successfully"
    else
        echo "Failed to install Oh my fish"
    end
end

# ============================================================================
# tmux
# ============================================================================
function link_tmux_config_file
    set sfile_tmux_config $dir_dot_files/tmux/tmux.conf
    set dfile_tmux_config $HOME/.tmux.conf

    if symlink_not_exist $dfile_tmux_config
        echo "Linking Tmux config..."
        ln -s $sfile_tmux_config $dfile_tmux_config
        echo "Tmux config is linked successfully"
        echo "Cloning Tmux plugin manager..."
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    else
        echo "Tmux config is linked already. Skip"
    end
end

# ============================================================================
# Alacritty
# ============================================================================
function link_alacritty
    set sfile_alacritty_config $dir_dot_files/alacritty.yml
    set ddir_alacritty_config $dir_config/alacritty
    set dfile_alacritty_config $ddir_alacritty_config/alacritty.yml

    if symlink_not_exist $dfile_alacritty_config
        echo "Linking Alacritty config..."
        mkdir -p $ddir_alacritty_config
        ln -s $sfile_alacritty_config $dfile_alacritty_config
        echo "Alacritty config is linked successfully"
    else
        echo "Alacritty config is linked already. Skip"
    end
end

# ============================================================================
# Neo vim
# ============================================================================
function link_neo_vim
    set sfile_nvim_config $dir_dot_files/nvim/init.vim
    set ddir_nvim_config $dir_config/nvim
    set dfile_nvim_config $ddir_nvim_config/init.vim

    if symlink_not_exist $dfile_nvim_config
        echo "Linking Neovim config..."
        mkdir -p $ddir_nvim_config
        ln -s $sfile_nvim_config $dfile_nvim_config
        echo "Neovim config is linked successfully"
    else
        echo "Neo vim config is linked already. Skip"
    end
end

link_fish_config
link_fish_functions
install_oh_my_fish
link_tmux_config_file
link_alacritty
link_neo_vim

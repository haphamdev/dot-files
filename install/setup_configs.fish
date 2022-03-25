#!/opt/homebrew/bin/fish

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
        rm -rf $ddir_fish_functions
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
    set sdir_nvim_lua $dir_dot_files/nvim/lua
    set ddir_nvim_lua $dir_nvim_config/lua

    if symlink_not_exist $dfile_nvim_config
        echo "Linking Neovim config..."
        mkdir -p $ddir_nvim_config
        ln -s $sfile_nvim_config $dfile_nvim_config
        ln -s $sdir_nvim_lua $ddir_nvim_lua
        echo "Neovim config is linked successfully"
    else
        echo "Neo vim config is linked already. Skip"
    end
end

# ============================================================================
# Linking config for IdeaVim plugin (Intellij IDEA)
# ============================================================================
function link_idea_vimrc
    set sfile_ideavim_config $dir_dot_files/jetbrains/ideavimrc
    set dfile_ideavim_config $HOME/.ideavimrc

    if symlink_not_exist $dfile_ideavim_config
        echo "Linking IdeaVim config..."
        ln -s $sfile_ideavim_config $dfile_ideavim_config
        echo "Intellij IdeaVim config is linked successfully"
    else
        echo "Intellij IdeaVim config is linked already. Skip"
    end
end

# ============================================================================
# Linking config for gitui
# More info: https://github.com/extrawurst/gitui/blob/master/KEY_CONFIG.md
# ============================================================================
function link_gitui
    set sfile_gitui_config $dir_dot_files/git/gitui/key_bindings.ron
    set ddir_gitui_config $HOME/.config/gitui
    set dfile_gitui_config $ddir_gitui_config/key_bindings.ron

    if symlink_not_exist $dfile_gitui_config
        echo "Linking gitui key binding config..."
        mkdir -p $ddir_gitui_config
        ln -s $sfile_gitui_config $dfile_gitui_config
        echo "Gitui key binding config is linked successfully"
    else
        echo "Gitui key binding config is linked already. Skip"
    end
end

# ============================================================================
# Linking config for gitui
# More info: https://github.com/extrawurst/gitui/blob/master/KEY_CONFIG.md
# ============================================================================
function link_gitconfig
    set sfile_git_config $dir_dot_files/git/gitconfig
    set dfile_git_config $HOME/.gitconfig

    if symlink_not_exist $dfile_git_config
        echo "Linking git config..."
        ln -s $sfile_git_config $dfile_git_config
        echo "Git config is linked successfully"
    else
        echo "Git config is linked already. Skip"
    end
end


link_fish_config
link_fish_functions
install_oh_my_fish
link_tmux_config_file
link_alacritty
link_neo_vim
link_idea_vimrc
link_gitui
link_gitconfig

# Use VIM key binding for fish
fish_vi_key_bindings

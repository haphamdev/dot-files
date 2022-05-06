#!/usr/local/bin/fish
set -a fish_function_path $HOME/projects/dot-files/fish/functions/hplib

eval (/opt/homebrew/bin/brew shellenv)
set -x JAVA_HOME (/usr/libexec/java_home -v 11.0.11)
set -x PATH $JAVA_HOME $PATH '/Users/hapham/.config/kotlin-language-server/server/build/install/server/bin' 
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH (go env GOPATH)/bin
set -x PATH $PATH '/Users/hapham/Library/Application Support/edgedb/bin'
set -x LC_AL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x GPG_TTY `tty`
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x NVM_DIR "$HOME/.nvm"

# Configure less to clear screen after exit and case-insensitive search
set -x DELTA_PAGER "/opt/homebrew/bin/less -R -i"
set -x LESS Ri 

set -x DELTA_NAVIGATE 1 # use n/N to navigate file by file in delta

# Personio
set -x AWS_VAULT_KEYCHAIN_NAME "login"
set -x AWS_VAULT_KEYCHAIN_NAME "12h"


# fish_vi_key_bindings

abbr -a rl 'source ~/.config/fish/config.fish'
abbr -a x 'exit'
abbr -a ef 'nvim ~/projects/dot-files/fish/config.fish'
abbr -a effn 'nvim ~/.config/fish/functions/'
abbr -a ea 'nvim ~/.aws'
abbr -a ls exa
abbr -a ll exa -l
abbr -a lt exa --tree -l --git-ignore --level=2

# Git abbreviations
abbr -a gf 'git fetch -p'
abbr -a gc 'git commit'
abbr -a gst 'git status'
abbr -a gm 'git merge'
abbr -a gma 'git stash; git checkout master;'
abbr -a gbr 'git checkout -b'
abbr -a gp 'git stash pop'
abbr -a gdc 'git checkout -- .'
abbr -a grm 'git rebase master -i'
abbr -a gs 'git status'
abbr -a gbk 'git checkout -'
abbr -a gbp 'git checkout -; git pop'
abbr -a gl 'git log --oneline --no-merges'
abbr -a glm 'git log --oneline'
abbr -a gdf 'git diff'
abbr -a gdfs 'git diff --staged'
abbr -a gu 'gitui'
abbr -a gfu 'git rebase -i HEAD~10'
abbr -a cbr 'git branch --show-current | pbcopy'
abbr -a k 'kubectl'
abbr -a gback 'git checkout -'
abbr -a gcm 'git commit -m'
abbr -a gcma 'git commit -am'
abbr -a batdiff 'git diff --name-only --diff-filter=d | xargs bat --diff'
abbr -a r 'ranger'

abbr -a e 'nvim'
abbr -a lg 'lazygit'
abbr -a pc '/opt/homebrew/bin/perctl'
abbr -a mc '~/projects/personio/monolith-cli'
abbr -a plg 'lnav ~/projects/personio/app/storage-local/logs/laravel.log'
abbr -a psn 'cd ~/projects/personio'
abbr -a kgp 'kubectl get pods'
abbr -a wkgp 'watch kubectl get pods'
abbr -a kdc 'kubectl describe'
abbr -a proj 'cd ~/projects'
abbr -a ev 'nvim ~/projects/dot-files/nvim/init.vim'
abbr -a etm 'nvim ~/projects/dot-files/tmux/tmux.conf'
abbr -a eal 'nvim ~/projects/dot-files/alacritty.yml'
abbr -a tm 'tmux attach || tmux'

abbr -a pre 'pr e'
abbr -a prc 'pr c'
abbr -a pr 'pr cd'
abbr -a fpe 'prfzf e'
abbr -a fpc 'prfzf c'
abbr -a fp 'prfzf cd'

abbr -a glc './gradlew.local'
abbr -a grd './gradlew'
abbr -a edb edgedb

# In vi mode, press Ctrl+f to accept autocompletion
bind -M insert \cf forward-char

# In vi mode, press Ctrl-p/Ctrl-n to search history backward and forward
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

# In vi mode, jj to escape insert mode
bind -M insert -m default jj backward-char force-repaint
    
fish_add_path /usr/local/opt/ruby/bin
fish_add_path /usr/local/go/bin
set -x GOPATH $HOME/go
fish_add_path $GOPATH/bin

zoxide init fish --cmd j | source

#!/usr/local/bin/fish
set -a fish_function_path $HOME/projects/dot-files/fish/functions/hplib

set -x JAVA_HOME (/usr/libexec/java_home -v 11)
set -x PATH $JAVA_HOME $PATH '/Users/hapham/.config/kotlin-language-server/server/build/install/server/bin' 
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH /usr/local/go/bin
set -x LC_AL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x GPG_TTY `tty`
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Configure less to clear screen after exit and case-insensitive search
set -x DELTA_PAGER "/usr/local/bin/less -R -i"
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
abbr -a kct 'set -x KUBECONFIG "$HOME/.kube/"(ls ~/.kube/ | grep "yml\|config" | fzf)'
abbr -a gback 'git checkout -'
abbr -a gcm 'git commit -m'
abbr -a gcma 'git commit -am'
abbr -a batdiff 'git diff --name-only --diff-filter=d | xargs bat --diff'
abbr -a r 'ranger'

abbr -a e 'nvim'
abbr -a nv '~/nvim-0.5/bin/nvim'
abbr -a lg 'lazygit'
abbr -a pc '~/projects/personio/perctl'
abbr -a plg 'lnav ~/projects/personio/app/storage-local/logs/laravel.log'
abbr -a dplg 'rm ~/projects/personio/app/storage-local/logs/laravel.log'
abbr -a psn 'cd ~/projects/personio'
abbr -a is 'cd ~/projects/invoice-service'
abbr -a kgp 'kubectl get pods'
abbr -a wkgp 'watch kubectl get pods'
abbr -a kdc 'kubectl describe'
abbr -a proj 'cd ~/projects'
abbr -a aps 'cd ~/projects/admin-panel-service'
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
abbr -a vpn 'sudo /usr/local/opt/openvpn/sbin/openvpn --config ~/openvpn/client.ovpn'

abbr -a tmp tmux popup -EE -h 70% -w 70%

function fish_right_prompt
	set st $status
	if test $st -eq 0
		set_color green
	else
		set_color red
	end
	echo -n $st
	set_color normal
	echo -n '|'
	date "+%H:%M:%S"
end

# set fish_color_autosuggestion d2d2d2
    
fish_add_path /usr/local/opt/ruby/bin

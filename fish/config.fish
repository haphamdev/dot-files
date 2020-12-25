#!/usr/local/bin/fish

set -x JAVA_HOME '/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home'
set -x PATH $JAVA_HOME $PATH '/Users/hapham/.config/kotlin-language-server/server/build/install/server/bin' 
set -x PATH $PATH $HOME/.cargo/bin
set -x LC_AL en_US.UTF-8
set -x LANG en_US.UTF-8

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

abbr -a e 'nvim'
abbr -a pc '~/projects/personio/perctl'
abbr -a plg 'lnav ~/projects/personio/app/storage-local/logs/laravel.log'
abbr -a dplg 'rm ~/projects/personio/app/storage-local/logs/laravel.log'
abbr -a psn 'cd ~/projects/personio'
abbr -a is 'cd ~/projects/invoice-service'
abbr -a kgp 'kubectl get pods'
abbr -a wkgp 'watch kubectl get pods'
abbr -a kd 'kubectl describe'
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
    

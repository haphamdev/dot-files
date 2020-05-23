#!/usr/local/bin/fish

# fish_vi_key_bindings

abbr -a rl 'source ~/.config/fish/config.fish'
abbr -a ef 'nvim ~/.config/fish/config.fish'
abbr -a effn 'nvim ~/.config/fish/functions/'
abbr -a ev 'nvim ~/.config/nvim/init.vim'
abbr -a etm 'nvim ~/.tmux.conf'

# Git abbreviations
abbr -a gf 'git fetch -p'
abbr -a gc 'git commit'
abbr -a gst 'git status'
abbr -a gm 'git merge'
abbr -a gma 'git stash; git checkout master;'
abbr -a gco 'git checkout'
abbr -a gbr 'git checkout -b'
abbr -a gp 'git stash pop'
abbr -a gdc 'git checkout -- .'
abbr -a grm 'git rebase master -i'
abbr -a gs 'git status'
abbr -a gback 'git checkout -'
abbr -a gbp 'git checkout -; git pop'
abbr -g gl 'git log --oneline'

abbr -a e 'nvim'

abbr -a kgp 'kubectl get pods'
abbr -a wkgp 'watch kubectl get pods'
abbr -a kd 'kubectl describe'
abbr -a ke 'kubectl exec -it'
abbr -a klg 'kubectl logs'
abbr -a kdc 'kubectl describe'

# Arch
abbr -a pci sudo pacman -S

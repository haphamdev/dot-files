function fish_greeting
    echo -n "👏👏👏 "
    set lines (cat ~/projects/dot-files/english-learning.txt)
    echo (random choice $lines)
end

#!/usr/local/bin/fish
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



if file_not_exist $HOME/not_exist;  
    echo 'not exist' 
else 
    echo 'exists' 
end

if file_not_exist $HOME/projects/learn-gradle/build.gradle
    echo 'not exist' 
else 
    echo 'exists' 
end

if dir_not_exist $HOME/not_exist
    echo 'not exist' 
else 
    echo 'exists' 
end

if dir_not_exist $HOME/projects
    echo 'not exist' 
else 
    echo 'exists' 
end

symlink_not_exist $HOME/not_exist
if test $status -eq 0 
    echo 'not exist' 
else 
    echo 'exists' 
end
symlink_not_exist $HOME/.tmux.conf
if test $status -eq 0 
    echo 'not exist' 
else 
    echo 'exists' 
end


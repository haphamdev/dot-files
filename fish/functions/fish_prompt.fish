# name: Zish

function fish_prompt
    printf ' \n'
    printf ' \n'
    set_color -b 414540
    set_color -o blue
    printf '%s' (whoami)
    set_color $fish_color_autosuggestion[1]
    printf ' in '
    set_color -o green
    printf '%s' (prompt_pwd -d 3 -D 3)

    set_color normal
    set_color yellow
    printf ' \n'
    set_color normal
end

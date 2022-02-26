function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo -en "\e[2 q"
      set_color -o brred
      echo "🅝 "
    case insert
      echo -en "\e[6 q"
      set_color -o brgreen
      echo "🅸 "
    case replace_one
      echo -en "\e[4 q"
      set_color -o bryellow
      echo "🅡 "
    case visual
      echo -en "\e[2 q"
      set_color -o brmagenta
      echo "🅥 "
    case '*'
      echo -en "\e[2 q"
      set_color -o brred
      echo "?"
  end
  set_color normal
end

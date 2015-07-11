function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch > /dev/null 2> /dev/null && echo '±' && return
    hg root > /dev/null 2> /dev/null && echo '☿' && return
    echo '>'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT='
${PR_GREEN}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} ${PR_BOLD_BLUE}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} ${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%} $(git_prompt_string)$(hg_prompt_string)
$(prompt_char) '

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

RPROMPT='${PR_GREEN}$(virtualenv_info)%{$reset_color%}'

#PROMPT="%n@%m:%B%~%b%# "
#RPROMPT="%*"

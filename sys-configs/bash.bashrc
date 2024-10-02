[[ "$-" != *i* ]] && return
PS1='- \$[$? \w]\n'
. /usr/share/bash-completion/bash_completion
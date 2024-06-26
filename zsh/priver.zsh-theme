typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1
setopt nopromptbang prompt{cr,percent,sp,subst}
autoload -Uz add-zsh-hook

# host/user
local host_user
if [[ -n ${SSH_TTY} ]]; then
  host_user='%(!.%F{red}%B.%F{242})%n%b%F{242}@%m:'
else
  host_user='%(!.%F{red}%B%n%b%F{242}:.)'
fi

# git
typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format '%{%G%} %b'
  zstyle ':zim:git-info:commit' format '%{%G%} %c'
  zstyle ':zim:git-info:action' format ' %F{yellow}%s'
  zstyle ':zim:git-info:indexed' format '%F{green}+%i'
  zstyle ':zim:git-info:unindexed' format '%F{yellow}*%I'
  zstyle ':zim:git-info:untracked' format '%F{blue}?%u'
  zstyle ':zim:git-info:ahead' format '%F{cyan}%{%G⇡%}'
  zstyle ':zim:git-info:behind' format '%F{cyan}%{%G⇣%}'
  zstyle ':zim:git-info:stashed' format ' %F{242}%{%G≡%}'
  zstyle ':zim:git-info:keys' format \
      'prompt' ' %F{242}%b%c%s' \
      'status' '%i%I%u' \
      'upstream' '%A%B' \
      'stash' '%S'

  add-zsh-hook precmd git-info
fi

# duration
if (( ${+functions[duration-info-preexec]} && ${+functions[duration-info-precmd]} )); then
  zstyle ':zim:duration-info' format ' %F{yellow}%d'

  add-zsh-hook preexec duration-info-preexec
  add-zsh-hook precmd duration-info-precmd
fi

# prompt
PS1='${host_user}%F{blue}%B%~%b${(e)git_info[prompt]}${(e)git_info[status]:+" ${(e)git_info[status]}"}${(e)git_info[upstream]:+" ${(e)git_info[upstream]}"}${(e)git_info[stash]}${PRIVER_PROMPT_EXTRA}${VIRTUAL_ENV:+" %F{242}%{%G%} ${VIRTUAL_ENV:t}"}${duration_info}%(1j. %F{red}%{%G✦%}.) %B%(?:%F{242}:%F{red})%{%G❯%}%f%b '
unset RPS1




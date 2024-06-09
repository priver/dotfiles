# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
# terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line

typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1
setopt nopromptbang prompt{cr,percent,sp,subst}
autoload -Uz add-zsh-hook

_prompt_priver_hyperlink() {
  echo -e "\e]8;;${1}\e\\\\${2}\e]8;;\e\\\\"
}

# pwd
zstyle ':zim:prompt-pwd' git-root yes
zstyle ':zim:prompt-pwd:fish-style' dir-length 1

_prompt_priver_pwd_link() {
  local current_dir
  prompt-pwd current_dir
  echo -e $(_prompt_priver_hyperlink 'file://%d' "${current_dir}")
}

# git
typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format ' %b'
  zstyle ':zim:git-info:commit' format ' %c'
  zstyle ':zim:git-info:indexed' format '%F{242}%{%G+%}'
  zstyle ':zim:git-info:unindexed' format '%F{218}%{%G!%}'
  zstyle ':zim:git-info:untracked' format '%F{218}%{%G?%}'
  zstyle ':zim:git-info:stashed' format '%F{242}%{%G≡%}'
  zstyle ':zim:git-info:ahead' format '%F{cyan}%{%G⇡%}'
  zstyle ':zim:git-info:behind' format '%F{cyan}%{%G⇣%}'
  zstyle ':zim:git-info:action' format ' %F{yellow}(%s)'
  zstyle ':zim:git-info:keys' format \
      'prompt' ' %F{242}%b%c%s%i%I%u%S%A%B'

  add-zsh-hook precmd git-info
fi

# duration
if (( ${+functions[duration-info-preexec]} && ${+functions[duration-info-precmd]} )); then
  zstyle ':zim:duration-info' format ' %B%F{yellow}%d'

  add-zsh-hook preexec duration-info-preexec
  add-zsh-hook precmd duration-info-precmd
fi

# prompt
PS1='%F{blue}$(_prompt_priver_pwd_link)${(e)git_info[prompt]}${duration_info} %B%(?:%F{magenta}:%F{red})%{%G❯%}%f%b '
unset RPS1

# PS1='
# %(2L.%B%F{yellow}(%L)%f%b .)%(!.%B%F{red}%n%f%b in .${SSH_TTY:+"%B%F{yellow}%n%f%b in "})${SSH_TTY:+"%B%F{green}%m%f%b in "}%B%F{cyan}%~%f%b${(e)git_info[prompt]}${VIRTUAL_ENV:+" via %B%F{yellow}${VIRTUAL_ENV:t}%f%b"}${duration_info}
# %B%(1j.%F{blue}*%f .)%(?.%F{green}.%F{red}%? )$(_prompt_asciiship_vimode)%f%b '




	# prompt_pure_colors_default=(
	# 	execution_time       yellow
	# 	git:arrow            cyan
	# 	git:stash            cyan
	# 	git:branch           242
	# 	git:branch:cached    red
	# 	git:action           yellow
	# 	git:dirty            218
	# 	host                 242
	# 	path                 blue
	# 	prompt:error         red
	# 	prompt:success       magenta
	# 	prompt:continuation  242
	# 	suspended_jobs       red
	# 	user                 242
	# 	user:root            default
	# 	virtualenv           242
	# )












# _prompt_eriner_main() {
#   # This runs in a subshell
#   RETVAL=${?}
#   BG_COLOR=

#   _prompt_eriner_status
#   _prompt_eriner_pwd
#   _prompt_eriner_git
#   _prompt_eriner_end
# }

# ### Segment drawing
# # Utility functions to make it easy and re-usable to draw segmented prompts.

# # Begin a segment. Takes two arguments, background color and contents of the
# # new segment.
# _prompt_eriner_segment() {
#   print -n "%K{${1}}"
#   if [[ -n ${BG_COLOR} ]] print -n "%F{${BG_COLOR}}"
#   print -n ${2}
#   BG_COLOR=${1}
# }

# _prompt_eriner_standout_segment() {
#   print -n "%S%F{${1}}"
#   if [[ -n ${BG_COLOR} ]] print -n "%K{${BG_COLOR}}%k"
#   print -n "${2}%s"
#   BG_COLOR=${1}
# }

# # End the prompt, closing last segment.
# _prompt_eriner_end() {
#   print -n "%k%F{${BG_COLOR}}%f "
# }

# ### Prompt components
# # Each component will draw itself, or hide itself if no information needs to
# # be shown.

# # Status: Was there an error? Am I root? Are there background jobs? Ranger
# # spawned shell? Python venv activated? Who and where am I (user@hostname)?
# _prompt_eriner_status() {
#   local segment=
#   if (( RETVAL )) segment+=' %F{red}✘'
#   if (( EUID == 0 )) segment+=' %F{yellow}⚡'
#   if (( $(jobs -l | wc -l) )) segment+=' %F{cyan}⚙'
#   if (( RANGER_LEVEL )) segment+=' %F{cyan}r'
#   if [[ -n ${VIRTUAL_ENV} ]] segment+=" %F{cyan}${VIRTUAL_ENV:t}"
#   if [[ -n ${SSH_TTY} ]] segment+=" %F{%(!.yellow.default)}%n@%m"
#   if [[ -n ${segment} ]]; then
#     _prompt_eriner_segment ${STATUS_COLOR} "${segment} "
#   fi
# }

# # Pwd: current working directory.
# _prompt_eriner_pwd() {
#   local current_dir
#   prompt-pwd current_dir
#   _prompt_eriner_standout_segment ${PWD_COLOR} " ${current_dir} "
# }



# PS1='$(_prompt_eriner_main)'

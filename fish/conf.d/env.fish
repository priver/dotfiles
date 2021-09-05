set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.utf-8
set -gx LC_ALL en_US.utf-8
set -gx EDITOR nano
set -gx GIT_EDITOR nano
set -gx LESS '-FRSX --tabs=2'
set -gx PROJECTS "$HOME/projects"
set -g fish_greeting

if status --is-interactive
  abbr -a -g .. 'cd ..'
  abbr -a -g ... 'cd ../..'
end

if command -qa bat
  set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

set -gx FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
set -g fzf_fd_opts --hidden --follow --exclude=.git

function h --description "Quick cd into $HOME"
  cd $HOME/(fd --max-depth=1 --type=directory --base-directory=$HOME | fzf --reverse --height 35% --nth 1)
end

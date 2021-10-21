function h --description "Quick cd into $HOME"
  set -l dir_path (fd --max-depth=1 --type=directory --base-directory=$HOME | fzf --reverse --height 35% --nth 1)
  if test -n "$dir_path"
    cd $HOME/$dir_path
  end
end

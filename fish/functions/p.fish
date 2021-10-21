function p --description "Quick cd into $PROJECTS"
  set -l dir_path (fd --max-depth=1 --type=directory --base-directory=$PROJECTS | fzf --reverse --height 35% --nth 1)
  if test -n "$dir_path"
    cd $PROJECTS/$dir_path
  end
end

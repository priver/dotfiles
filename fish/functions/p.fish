function p --description "Quick cd into $PROJECTS"
  cd $PROJECTS/(fd --max-depth=1 --type=directory --base-directory=$PROJECTS | fzf --reverse --height 35% --nth 1)
end

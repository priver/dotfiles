function headers --description 'Print HTTP headers'
  curl -sv $argv 2>&1 >/dev/null | rg "^(<|>)" | cut -c3-
end

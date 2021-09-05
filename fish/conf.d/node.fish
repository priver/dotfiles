set -g nvm_default_version v16.7.0

function _nvm_autoload_hook --on-variable dirprev --description 'Change Node version on directory change'
  if test (count $dirprev) -ne 0
    set -l repo_root (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$repo_root" -a -e "$repo_root/.nvmrc"
      if not string match -q "$repo_root*" "$dirprev[-1]"
        nvm use
      end
    else if test "$nvm_current_version" != "$nvm_default_version"
      nvm use $nvm_default_version
    end
  end
end

_nvm_autoload_hook


[[ $- == *i* ]] || return

source -- "$HOME/.local/share/blesh/ble.sh" --attach=none

if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
  then _ps1_symbol='\[\e[1m\]#\[\e[0m\]'
  else _ps1_symbol='\$'
fi

export PS1='\[\e[38;5;35m\]\u\[\e[38;5;41m\]@\[\e[38;5;121m\]\h\[\e[38;5;0m\]:\[\e[38;5;33m\]$MSYSTEM\[\e[38;5;0m\]:\[\e[38;5;184m\]\w\[\e[38;5;193m\]'"${_ps1_symbol}"'\[\e[0m\] '

[[ $BLE_VERSION ]] && ble-attach

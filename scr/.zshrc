# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/brass/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

ZSCRIPTDIR=(
  "$HOME/.config"
  "$HOME/.local"
  "/usr/share"
  "/usr/local/share"
)

function zloadconfigs {
	local zname="$1"
	if [[ -z $zname ]]; then
		return 1
	fi
	local zfile=""
	for dir in $ZSCRIPTDIR; do
		zfile="$(find "$dir" -maxdepth 3 -name "${zname:l}.zsh" 2>/dev/null)"
		if [[ -f $zfile ]]; then
			break
		fi
	done
	if [[ -z $zfile ]]; then
		echo "$zname not installed."
		return 1
	fi
	source "$zfile"
}

zloadconfigs "Zenhance"
zloadconfigs "Zsh-Autosuggestions"
zloadconfigs "Zsh-Syntax-Highlighting"

unset -f zloadconfigs

ZSH_AUTOSUGGEST_STRATEGY=(history)

ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=254'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=254'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=254'

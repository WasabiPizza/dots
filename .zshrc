PROMPT="%K{177}%F{white} > %f%k "
RPROMPT="%~"

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/nero/.zshrc'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

unsetopt beep
bindkey -v

alias \
        ls='ls -hN --color=auto --group-directories-first' \
	cp='cp -iv' \
	mv='mv -iv' \
	rm='rm -vI' \
	mkdir='mkdir -pv' 

alias \
	vpi='sudo xbps-install' \
	vpr='sudo xbps-remove -R' \
	vpu='sudo xbps-install -Su' \
	vpq='xbps-query -Rs' \
	vpc='sudo xbps-remove -Oo' \
	vpk='sudo vkpurge rm all'

alias gpg='gpg2'	
alias ssh='TERM=xterm-256color ssh'
alias n='nnn -x -e'
alias dc='docker-compose'

#function ssh () {/usr/bin/ssh -t $@ "tmux attach || tmux new";}

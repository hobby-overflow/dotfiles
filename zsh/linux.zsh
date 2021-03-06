autoload -Uz colors
colors

autoload -Uz compinit
compinit

setopt print_eight_bit
setopt auto_cd

setopt auto_param_keys

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expand

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

setopt correct

setopt auto_pushd
setopt pushd_ignore_dups

setopt extended_glob
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

alias zconf='nvim ~/.config/zsh/linux.zsh'
alias nvimconf='PREVDIR=$(pwd) && cd ~/.config/nvim && nvim init.vim; cd $PREVDIR'
alias cocconfig='nvim ~/.config/nvim/coc-settings.json'

alias vim='nvim'

alias t='tmux'
alias ta='tmux attach-session'
alias tat='tmux attach-session -t'

alias ls='ls --color'
alias ll='ls -oh --color'
alias g='git'
alias ga='git add'
alias gs='git status'
alias gb='git branch'
alias gl='git log'
alias gl1='git log --oneline'
alias gc='git checkout'
alias gcm='git commit -m'
alias grv='git remote -v'
alias gcd='cd `git rev-parse --show-toplevel`'

alias icat='kitty +kitten icat'

alias nr='npm run'
alias pr='pnpm run'

# alias ssh='/usr/bin/ssh -F ~/.ssh/config'

alias cdprog='~/Programmings'
alias cdpython='~/Programmings/Python'
alias cdhtml='~/Programmings/HTML'
alias cdgo='~/Programmings/go'

apt:update() {
	sudo apt update && apt list --upgradable
}

cmake:clean() {
	if [[ $(pwd) =~ .*build$ ]]; then
		rm -rf *
	fi
}

# alias node='nocorrect node'

bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# bindkey -s " " ' '

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-syntax-highlighting

zinit light iboyperson/pipenv-zsh
### End of Zinit's installer chunk

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/home/user/.fnm:$PATH
eval "`fnm env`"

export DENO_INSTALL="/home/user/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

if test $(echo $TERM) = "xterm-kitty" ; then
	alias ssh='kitty +kitten ssh'
fi

function peco_src () {
	local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco_src
bindkey '^]' peco_src

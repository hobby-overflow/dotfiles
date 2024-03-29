autoload -Uz colors
colors

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

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

PROMPT="%{${fg[yellow]}%} %~ %{${reset_color}%}
%# "

setopt extended_glob
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

alias zconf='nvim ~/.config/zsh/windows.zsh'
alias zshrc='nvim ~/.zshrc'
alias nvimconf='(){PREVDIR=$(pwd) && cd ~/AppData/Local/nvim && nvim init.vim; cd $PREVDIR}'
alias nvimconfigs='(){PREVDIR=$(pwd) && cd ~/AppData/Local/nvim && nvim .; cd $PREVDIR}'
alias CocConfig='nvim ~/AppData/Local/nvim/coc-settings.json'
alias lslarge="ls -oghSrA --time-style=+'' | cut -d' ' -f3-"

alias vim='nvim'

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

# Need on windows10
alias npm='npm.cmd'
alias nr='npm run'
alias npx='npx.cmd'
alias flutter='flutter.bat'
alias dart='dart.bat'

alias pr='pnpm run'

alias find='/bin/find.exe'
alias python3='python'
alias ssh='/usr/bin/ssh -F ~/.ssh/config'

# alias cdprog='~/Documents/Programmings'
alias cdpython='~/Documents/Programmings/Python'
alias cdhtml='~/Documents/Programmings/HTML'
alias cdgo='~/Documents/Programmings/go'

alias cdprog='(){cd ~/Documents/Programmings/$1}'

alias dev:am3d='~/Documents/Programmings/HTML/AirplaneMonitor3D'
alias dev:process='~/Documents/Programmings/Python/ProcessWatcher'
alias dev:notepad='/c/Users/user/Documents/Programmings/HTML/electron-notepad'

cmake:clean() {
    if [[ $(pwd) =~ .*build$ ]]; then
        rm -rf *
    fi
}

alias csc='/c/Windows/Microsoft.NET/Framework64/v4.0.30319'

alias node='nocorrect node'

alias poweroff='shutdown -s -f -t 0'
alias reboot='shutdown -r -f -t 0'

bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

bindkey -s " " ' '

# prezto like search history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Set fnm for Windows10
export PATH=$PATH:/home/user/.fnm/fnm
export FNM_MULTISHELL_PATH="~/.fnm/aliases/default"
export FNM_DIR="~/.fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_ARCH="x64"
rehash

export PATH=$HOME/AppData/Roaming/Python/Python310/Scripts:$PATH

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
# zinit light iboyperson/pipenv-zsh
### End of Zinit's installer chunk

# fnm
export PATH=/home/user/.fnm:$PATH

export JAVA_HOME="/c/Program Files/Java/jdk-18.0.1.1"
export ANDROID_HOME=/c/Users/user/AppData/Local/Android/Sdk

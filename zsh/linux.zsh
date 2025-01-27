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

# alias cdprog='~/Programmings'
alias cdpython='~/Programmings/Python'
alias cdhtml='~/Programmings/HTML'
alias cdgo='~/Programmings/go'

mkcd() {
    mkdir $1 && cd $1
}
cdprog() {
    # cd ~/Documents/Programmings/$1
    local selected_folder
    selected_folder=$(find $HOME/Documents/Programmings -maxdepth 2 -type d | sed "s|$HOME/Documents/Programmings/||" | fzf)
    # echo $selected_folder
    echo $HOME/Documents/Programmings/$selected_folder
    cd $HOME/Documents/Programmings/$selected_folder
}

apt:update() {
	sudo apt update && apt list --upgradable
}
aptupdate() {
    apt:update
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
    zsh-users/zsh-syntax-highlighting \

zinit light iboyperson/pipenv-zsh
### End of Zinit's installer chunk

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit ice lucid wait '0'
zinit light joshskidmore/zsh-fzf-history-search

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

function fzf_src () {
    local selected_dir=$(ghq list -p | fzf)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-scrittn
}

zle -N fzf_src
bindkey '^]' fzf_src

# go modules ghq and other.
export PATH=$HOME/go/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function my_tools_install() {
    # type -p curl >/dev/null || sudo apt-get install curl -y
    # type -p wget >/dev/null || sudo apt-get install wget -y
    sudo apt-get install -y git curl wget vim htop

    install_neovim
    install_jetpack
    install_deno
    install_fnm

    # type -p yarn >/dev/null || npm i -g yarn
    # type -p pnpm >/dev/null || npm i -g pnpm
    # npm i -g yarn pnpm
}
function install_neovim() {
    nvim_path="/usr/local/bin/nvim"
    sudo curl -fLo $nvim_path https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    sudo chmod 755 $nvim_path
	# wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
}
function install_jetpack() {
	curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
}

function install_deno() {
    curl -fsSL https://deno.land/x/install/install.sh | sh
}

function install_fnm() {
	curl -fsSL https://fnm.vercel.app/install | bash
}

function install_volta() {
    curl https://get.volta.sh | bash
}

function install_vim-plug() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

function install_gh() {
    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
}

function install_mise() {
    curl https://mise.run | sh
}
eval "$(~/.local/bin/mise activate zsh)"


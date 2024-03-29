if [[ `uname` == "Linux" ]]; then
    source $HOME/.config/zsh/linux.zsh

elif [[ `uname -m` == "armv6l\n" ]]; then
    source $HOME/.config/zsh/rpi.zsh

elif [[ `uname` == "MSYS_NT-10.0-19044" ]]; then
    source $HOME/.config/zsh/windows.zsh

elif [[ `uname` == "Darwin" ]]; then
    source $HOME/.config/zsh/mac.zsh
fi

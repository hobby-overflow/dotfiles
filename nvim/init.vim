set number
" set hls
set cursorline
set showcmd
set nobackup
set termguicolors
set nofoldenable

set ignorecase
" set incsearch
set wrapscan
set smartcase

set autoindent
set smartindent

set backspace=start,eol,indent

set scrolloff=10
set lazyredraw

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

if has('windows')
    set clipboard^=unnamed
    command! Term term zsh
endif

let g:dart_format_on_save = 1

let g:clever_f_across_no_line=1
let g:clever_f_ignore_case=0
let g:clever_f_smart_case=1
let g:clever_f_fix_key_direction=1

runtime! vim-plug.vim
runtime! configs/*.vim
runtime! keymap.vim
colorscheme gruvbox-material

command! Config :e $MYVIMRC
if has('windows')
    command! Configs :e ~/AppData/Local/nvim/configs
endif

if has('unix')
    command! Configs :e ~/.config/nvim
endif


autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

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

lua <<EOF
require('nvim-autopairs').setup({
    disable_filetype = { "json" }
})
EOF
command! Config :e $MYVIMRC
command! Configs :Defx ~/AppData/Local/nvim/configs

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"

set completeopt=menuone,noinsert

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

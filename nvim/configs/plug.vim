
if has('win32') || has('win64')
    call plug#begin('C:/Users/user/.vim/plugged')
endif

if has('unix')
    call plug#begin('/home/user/.vim/plugged')
endif

if has('nvim')
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
    Plug 'nvim-treesitter/nvim-treesitter'
endif
 
" Plug 'Shougo/ddu.vim'
" Plug 'Shougo/ddu-ui-ff'
" Plug 'Shougo/ddu-commands.vim'
" Plug 'Shougo/ddu-source-file_rec'
" Plug 'Shougo/ddu-kind-file'
" Plug 'Shougo/ddu-source-file'
" Plug 'Shougo/ddu-source-rg'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'yuki-yano/ddu-filter-fzf'
Plug 'shun/ddu-source-buffer'
" Plug 'tani/ddc-path'

" Plug 'Shougo/ddc.vim'
" Plug 'Shougo/ddc-around'
" Plug 'Shougo/ddc-matcher_head'
" Plug 'Shougo/ddc-sorter_rank'
" Plug 'Shougo/ddc-converter_remove_overlap'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thinca/vim-quickrun'
 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
 
Plug 'sainnhe/gruvbox-material'
Plug 'rhysd/clever-f.vim'
Plug 'vim-denops/denops.vim'

Plug 'machakann/vim-sandwich'
" Plug 'windwp/nvim-autopairs'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'baabelfish/nvim-nim', { 'for': 'nim'}

Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim', { 'for': 'html'}

call plug#end()

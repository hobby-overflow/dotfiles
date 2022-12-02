if has('win32') || has('win64')
    call plug#begin('C:/Users/user/.vim/plugged')
endif

if has('unix')
    call plug#begin('/home/user/.vim/plugged')
endif

if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'nvim-treesitter/nvim-treesitter'
endif
 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'yuki-yano/ddu-filter-fzf'
Plug 'shun/ddu-source-buffer'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thinca/vim-quickrun'
 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 
Plug 'sainnhe/gruvbox-material'
Plug 'rhysd/clever-f.vim'
Plug 'vim-denops/denops.vim'

Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'baabelfish/nvim-nim', { 'for': 'nim'}

Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim', { 'for': 'html'}

Plug 'airblade/vim-gitgutter'

call plug#end()

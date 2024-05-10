" plugin does't exisit, Download plugin
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
    " bootstrap
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', {'build': './install --all'}
    Plug 'junegunn/fzf.vim'
    " call jetpack#add('yuki-yano/fzf-preview.vim', {'branch': 'release/remote', 'do': 'UpdateRemotePlugins' })

    Plug 'vim-airline/vim-airline'
    Plug 'sainnhe/gruvbox-material'
    Plug 'rhysd/clever-f.vim'
    Plug 'thinca/vim-quickrun'

    Plug 'yuki-yano/ddu-filter-fzf'
    Plug 'shun/ddu-source-buffer'
    Plug 'vim-denops/denops.vim'

    Plug 'machakann/vim-sandwich'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'mattn/emmet-vim', { 'for': 'html'}
    Plug 'airblade/vim-gitgutter'
    Plug 'editorconfig/editorconfig-vim'

    Plug 'alaviss/nim.nvim'

    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim'

    Plug 'prettier/vim-prettier'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'tani/vim-jetpack'
call plug#end()

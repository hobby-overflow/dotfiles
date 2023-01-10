let s:jetpackfile = stdpath('data') .. '/site/autoload/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"

let has_jetpack = filereadable(s:jetpackfile)

if has_jetpack != 1
    echo "Jetpack not found, now download"
    call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

for name in jetpack#names()
    if !jetpack#tap(name)
        call jetpack#sync()
        break
    endif
endfor

call jetpack#begin()
    " bootstrap
    call jetpack#add('neoclide/coc.nvim', {'branch': 'release'})
    call jetpack#add('junegunn/fzf', {'build': './install --all'})
    call jetpack#add('junegunn/fzf.vim')

    call jetpack#add('yuki-yano/fzf-preview.vim', {'branch': 'release/remote', 'do': 'UpdateRemotePlugins' })
    if has('nvim')
        call jetpack#add('nvim-treesitter/nvim-treesitter')
    endif

    call jetpack#add('vim-airline/vim-airline')
    call jetpack#add('sainnhe/gruvbox-material')
    call jetpack#add('rhysd/clever-f')
    call jetpack#add('thinca/vim-quickrun')

    call jetpack#add('yuki-yano/ddu-filter-fzf')
    call jetpack#add('shun/ddu-source-buffer')
    call jetpack#add('vim-denops/denops.vim')
    
    call jetpack#add('machakann/vim-sandwich')
    call jetpack#add('jiangmiao/auto-pairs')
    call jetpack#add('tpope/vim-surround')
    call jetpack#add('tpope/vim-commentary')
    call jetpack#add('mattn/emmet-vim', { 'for': 'html'})
    call jetpack#add('airblade/vim-gitgutter')
    call jetpack#add('editorconfig/editorconfig-vim')
call jetpack#end()

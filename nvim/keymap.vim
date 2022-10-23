" map prefix
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev] <Nop>
xnoremap [dev] <Nop>
nmap m [dev]
xmap m [dev]
nnoremap [ff] <Nop>
xnoremap [ff] <Nop>
nmap s [ff]
xmap s [ff]

inoremap <silent> jj <ESC>
" inoremap <silent>  <ESC>o
inoremap <silent>  <C-o>:w<CR>
nnoremap <silent>  :w<CR>
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" noremap <S-h> ^
" noremap <S-l> $

vnoremap < <gv
vnoremap > >gv

tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal zsh <args>
autocmd TermOpen " startinsert

noremap <C-_> :Commentary<CR><ESC>

"" coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-git', 'coc-lists', 'coc-fzf-preview']

inoremap <silent> <expr> <C-l> coc#refresh()
nnoremap <silent> K    :<C-u>call <SID>show_documentation()<CR>
nmap <silent> [dev]rn <Plug>(coc-rename)
nmap <silent> [dev]a <Plug>(coc-codeaction-selected)iw

function! s:coc_typescript_settings() abort
	nnoremap <silent> <buffer> [dev]f :<C-u>CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>
endfunction

augroup coc_ts
	autocmd!
	autocmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
augroup END

augroup write_jp
    autocmd!
    autocmd FileType text nnoremap j gj
    autocmd FileType text nnoremap k gk
    autocmd FileType text nnoremap <Down> gj
    autocmd FileType text nnoremap <Up> kj
augroup END

function! s:show_documentation() abort
	if index(['vim','help'], &filetype) >= 0
		execute 'h '.expand('<cword>')
	elseif coc#rpc#ready()
		call CocActionAsync('doHover')
	endif
endfunction

"" fzf-preview
let $BAT_THEME = 'gruvbox-dark'
let $FZF_PREVIEW_BAT_THEME = 'gruvbox-dark'

nnoremap <silent> <C-p> :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
nnoremap <silent> [ff]s :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [ff]f :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>
" xnoremap [ff]f "sy:CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

nnoremap <silent> [ff]q :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>

"" cheatsheet
nnoremap <Leader>? <Cmd>Cheat<CR>

" nnoremap あ a
" nnoremap い i
" nnoremap お o
"
" if has ('win32')
"     nnoremap Ａ A
"     nnoremap Ｉ I
" endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(0) : "\<Down>"
inoremap <silent><expr> <Up> coc#pum#visible() ? coc#pum#prev(0) : "\<Up>"

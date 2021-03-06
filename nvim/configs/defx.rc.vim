" if !exists('g:loaded_defx') | finish | endif

nnoremap <silent> <Leader>e :<C-u>Defx -listed -resume
			\ -columns=indent:mark:icon:space:icons:space:filename:git:size
			\ -buffer-name=tab`tabpagenr()`
			\ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent> <Leader>E :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
		nnoremap <silent><buffer><expr> <CR>
					\ defx#do_action('open')
		nnoremap <silent><buffer><expr> l
					\ defx#do_action('open', 'vsplit')
		nnoremap <silent><buffer><expr> h
					\ defx#do_action('cd', ['..'])
		nnoremap <silent><buffer><expr> ~
					\ defx#do_action('cd')
		nnoremap <silent><buffer><expr> r
					\ defx#do_action('rename')
		nnoremap <silent><buffer><expr> N
					\ defx#do_action('new_file')
		nnoremap <silent><buffer><expr> .
					\ defx#do_action('toggle_ignored_files')
		nnoremap <silent><buffer><expr> q
					\ defx#do_action('quit')
	endfunction

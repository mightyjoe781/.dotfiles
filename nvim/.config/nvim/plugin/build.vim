" -----------------------------------------------------------------------
"  file     : build.vim
"  purpose  : custom build systems for vim
"  version  : 220625
"  author   : smk
"  bugs     : no known bugs
"  credits  : https://github.com/mizlan/vim-and-cp/blob/master/cp.vim
" -----------------------------------------------------------------------

" for detecting OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" important option that should already be set!
set hidden
" available options:
" ------------------------------
" * g:split_term_style= 'vertical'
" * g:split_term_resize_cmd= ' resize 40'
" ------------------------------

" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
" let g:split_term_resize_cmd = 'resize 40'
" (or let g:split_term_resize_cmd = 'vertical resize 40')
function! TermWrapper(command) abort
    write
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	exec buffercmd
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
	autocmd BufEnter <buffer> startinsert
endfunction

" command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++11 %s && ./a.out', expand('%')))
" command! -nargs=1 -complete=file CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <q-args>))

" --- Cpp Builder ---
if g:os == 'Darwin'
    " Note use g++-11 from homebrew to compile on M1 macbook
    " Require g++ from homebrew installed
    " command! -nargs=0 CppRun call TermWrapper(printf('g++-11 -std=c++11 -DLOCAL=1 %s && ./a.out', expand('%')))
    " command! -nargs=0 CppBuild  call TermWrapper(printf('g++-11 -std=c++11 -DLOCAL=1 %s', expand('%')))
    command! -nargs=0 CppRun call TermWrapper(printf('\g++-11 -std=c++11 -Wall -Wextra -pedantic -O3 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DLOCAL %s && ./a.out', expand('%')))
    command! -nargs=0 CppBuild  call TermWrapper(printf('\g++-11 -std=c++11 -Wall -Wextra -pedantic -O3 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DLOCAL %s', expand('%')))
else
    " command! -nargs=0 CppRun call TermWrapper(printf('g++ -std=c++11 -DLOCAL=1 %s && ./a.out', expand('%')))
    " command! -nargs=0 CppBuild  call TermWrapper(printf('g++ -std=c++11 -DLOCAL=1 %s', expand('%')))
    command! -nargs=0 CppRun call TermWrapper(printf('\g++ -std=c++11 -Wall -Wextra -pedantic -O3 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DLOCAL %s && ./a.out', expand('%')))
    command! -nargs=0 CppBuild  call TermWrapper(printf('\g++ -std=c++11 -Wall -Wextra -pedantic -O3 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DLOCAL %s', expand('%')))
endif
augroup CppToolkit
    " make a augroup
    " clear all previous autocmds from the group
	autocmd!
	autocmd FileType cpp nnoremap <leader>fr :CppRun<CR>
	autocmd FileType cpp nnoremap <leader>fb :CppBuild<CR>
augroup END

" --- CppCustom Builder ---
if g:os == 'Darwin'
    command! -nargs=0 CppCustomRun call TermWrapper(printf('\g++-11 -std=c++11 %s -o %s && ./%s', expand('%'),expand('%:r'),expand('%:r')))
    command! -nargs=0 CppCustomBuild call TermWrapper(printf('\g++-11 -std=c++11 %s -o %s', expand('%'),expand('%:r'),expand('%:r')))
else
    command! -nargs=0 CppCustomRun call TermWrapper(printf('\g++ -std=c++11 %s -o %s && ./%s', expand('%'),expand('%:r'),expand('%:r')))
    command! -nargs=0 CppCustomBuild call TermWrapper(printf('\g++ -std=c++11 %s -o %s', expand('%'),expand('%:r'),expand('%:r')))
endif
augroup CppCustomToolkit
	autocmd!
	autocmd FileType cpp nnoremap <leader>fcr :CppCustomRun<CR>
	autocmd FileType cpp nnoremap <leader>fcb :CppCustomBuild<CR>
augroup END


"  --- PyRun Builder ---
command! -nargs=0 PyRun call TermWrapper(printf('python3 %s', expand('%')))
augroup PyToolkit
	autocmd!
	autocmd FileType python nnoremap <leader>fr :PyRun<CR>
augroup END

" --- Java Builder ---

command! -nargs=0 JavaRun call TermWrapper(printf('javac %s && java %s', expand('%'), expand('%:r')))
augroup JavaToolkit
	autocmd!
	autocmd FileType java nnoremap <leader>fr :JavaRun<CR>
augroup END

" --- Golang Builder ---

command! -nargs=0 GoRun call TermWrapper(printf('go run %s', expand('%')))
augroup GoToolkit
	autocmd!
	autocmd FileType go nnoremap <leader>fr :GoRun<CR>
augroup END

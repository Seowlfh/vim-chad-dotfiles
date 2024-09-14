"=========
" Options
"=========

" Options
set number relativenumber " Hybrid numbering

" Tabs
set smartindent autoindent expandtab
set shiftwidth=4 tabstop=4

" Builtin-plugins
syntax on " Colors
filetype plugin on " Netrw & Colors

set path+=** " Path looks at subdirectories. Useful for "fuzzy finding" with :find
set colorcolumn=80

" Listchars stuff
set list listchars:eol:↵,tab:⇛•,lead:•,trail:•
hi NonText ctermfg=DarkGray
hi SpecialKey ctermfg=DarkGray

"==========
" Terminal
"==========

tmap q <C-\><C-n> " Go back to normal mode with q

"=======
" Netrw
"=======
" Cheatsheet
"
" Shortcuts:
" - 	d 	Create directory
" - 	D 	Remove file/directory
" - 	p 	Preview file
" - 	% 	Create new file
" - 	R 	Rename file/directory
" -  <Cr> 	Go into file/directory
" -  	- 	Go into the parent directory
"
" Commands:
" - :Explore	Open netrw

let g:netrw_banner=0 " Deactivate help banner
let g:netrw_preview=1 " Preview is done in a vertical split

"==========
" Mappings
"==========

map ma :make<CR> :cwin<CR> " Run make & open quickfix
map cr :so /home/teto/.vimrc<CR> " Reload config

"==========
" Autocmds
"==========

augroup once
au! once
    autocmd BufWritePre * :%s/\s\+$//e 	" Remove trailing whitespaces
    autocmd BufWritePre * "normal gg=G" 		" Indent whole file
    autocmd BufWritePre *.[ch] silent! ctags -R . 	" Generate ctags. "silent" is there to silence the program output
augroup END

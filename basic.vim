
" My Own Custom Conf

set nu
set relativenumber
set cursorline
set numberwidth=3
set background=dark
colorscheme desert

" Leader  Key
let mapleader = ","
let maploaclleader = "\\"

" My Own KeyBinding

" Unmap Defaults
nnoremap <c-j> <nop>

" Normal Mode
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ee :source $MYVIMRC<cr>

" Key Binding
nnoremap <c-j>	<c-w>j
nnoremap <c-k>	<c-w>k
nnoremap <c-h>	<c-w>h
nnoremap <c-l>	<c-w>l
nnoremap <a-k>	k<s-v>xpk
nnoremap <a-j>	<s-v>xp

" Operation pending mapping
onoremap in( :f(vi(<cr>

" paste copyed word to next of the word
nnoremap <leader>pp a<space><esc>

" Hide Buffer
nnoremap <leader>hb :hide<cr>

" Hide Select Highlight
nnoremap <leader><enter> :noh<cr>

" Insert Mode
" Esc KeyBind
inoremap jk <esc>
" esc key disable
inoremap <esc> <nop>
" enter key disable
" inoremap <cr> <nop>

" Auto-cmd
augroup filetype_html
autocmd BufNewFile *.txt :write
autocmd BufWritePre,BufRead *.html :normal gg=G
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>

" For filetype comment
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType python     :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
autocmd FileType python	:iabbrev <buffer> __main__ if __name__=="__main__":
			\<CR>main()
autocmd!
autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

" Status Line
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)

" Buffer Management
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" FINDING FILES

" Search down into subfolders
" Provides tab-completion for all file-related tasks

set path=**

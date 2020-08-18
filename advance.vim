
" Plugin

call plug#begin('~/.vim/plugged')
" FILE MANAGER,BUFFER AND TABS
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
Plug 'dense-analysis/ale'
" UI
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jnurmine/Zenburn'
" CODE
Plug 'lepture/vim-jinja'
Plug 'fadein/vim-FIGlet'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" PLUGIN'S CMD
let g:user_emmet_install_global = 0
let g:user_emmet_mode='i'
autocmd FileType html,css,vue,jsx EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = {'window':{'width':0.8,'height':0.8}, 'down': '~30%' }
noremap <C-x> :FZF<cr>
" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-d': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-a': 'vsplit' }
" Default fzf layout
" - down / up / left / right
" In Neovim, you can set up fzf window using a Vim command
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" List occurrences for search
let g:searchtasks_list=["TODO", "FIXME", "XXX","BUG"]

"vim-devicons
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" NERDTreeToggles
map <C-n> :NERDTreeToggle<CR>
"vim-nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" color
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"split navigations
nnoremap <leader>ss :split<CR>
nnoremap <leader>sv :vsplit<CR>
nnoremap <C-T> :BuffergatorTabsToggle<CR>

" GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
let g:ale_fixers = {
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'html': ['prettier'],
        \ 'javascript': ['eslint', 'prettier'],
        \ 'css' : ['stylelint', 'prettier'],
        \ 'python' : ['isort', 'autopep8']
        \ }

" ALE LSP

let g:ale_completion_autoimport = 1
inoremap <silent> <C-Space> :AleComplete<CR>
let g:ale_hover_to_preview=1
let g:ale_completion_enabled=1
let g:ale_fix_on_save=1
let g:ale_completion_symbols = {
        \ 'text': '',
        \ 'method': '',
        \ 'function': '',
        \ 'constructor': '',
        \ 'field': '',
        \ 'variable': '',
        \ 'class': '',
        \ 'interface': '',
        \ 'module': '',
        \ 'property': '',
        \ 'unit': 'unit',
        \ 'value': 'val',
        \ 'enum': '',
        \ 'keyword': 'keyword',
        \ 'snippet': '',
        \ 'color': 'color',
        \ 'file': '',
        \ 'reference': 'ref',
        \ 'folder': '',
        \ 'enum member': '',
        \ 'constant': '',
        \ 'struct': '',
        \ 'event': 'event',
        \ 'operator': '',
        \ 'type_parameter': 'type param',
        \ '<default>': 'v'
        \ }

" JINJA

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" PLUGIN'S END

" MY CUSTOM
" General
set t_Co=256
" Set number of line
set nu
" Set modifier on
set ma
" Set Relative Number On
set relativenumber
" Set Cursor Line On
set cursorline
" Sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" VIM user interface
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Turn on the Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
"Always show current position
set ruler
" Height of the command bar
set cmdheight=1
" A buffer becomes hidden when it is abandoned
set hid
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif
" Add a bit extra margin to the left
set foldcolumn=1
" Colors and Fonts
" Enable syantax highlighting
syntax enable
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Files, backups and undo
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Text, tab and indent related
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Moving around, tabs, windows and buffers
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
"Editing mappings
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Esc KeyBind
inoremap jk <esc>
" esc disable
inoremap <esc> <nop>
" Backspace disable
inoremap <bs> <nop>
" Spell Checking
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" Misc
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
noremap <leader>aa :hide<cr>

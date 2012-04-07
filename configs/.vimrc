" Editing - - - - {{{
set nocompatible    " no compatibility with vi
set history=200		" keep 200 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set showmatch       " show matching brackets when typing
set backspace=indent,eol,start "allow backspacing over everything in insert mode
filetype plugin indent on 
" - - - - }}}

" Searching - - - - {{{
set hlsearch        " highlight searches
set smartcase       " becomes case sensitive for uppercase 
set incsearch		" do incremental searching
set ignorecase      " case insensitive searching 
" - - - - }}}

" Tabs - - - - {{{
set expandtab       " turns a tab into spaces
set autoindent		" always set autoindenting on
set shiftwidth=4    " spaces for auto-indents
set tabstop=4       " number of spaces a tab counts for
set smarttab

" - - - - }}}

" Files - - - - {{{
set hidden          " hides buffers instead of removing them
set nobackup		" do not keep a backup file, use versions instead
set autoread        " Set to auto read when a file is changed from the outside
set autochdir       " automatically cd to file
set noswapfile      " sets no swap file
" reloads file on insert 
au InsertEnter * :checktime
set wildignore=*.o,*.obj,*.bak,*.exe,*.m3u,*.avi,*.mp3 " extensions to ignore
" - - - - }}}

" Appearance - - - - {{{ 
syntax on           " Syntax on
set t_Co=256        " sets 256 colors in the terminal

set cursorline      " Highlights the current line
set number          " Sets the line number

if has('mac')
    set guifont=Menlo:h14
    set shell=/bin/bash
elseif has('win32')
    set guifont=Consolas:h10
    " sets the color scheme based on time
    if strftime("%H") < 4
        set background=dark
        colorscheme darkspectrum
    elseif strftime("%H") < 12
        set background=light
        colorscheme solarized
    elseif strftime("%H") < 17
        set background=light
        colorscheme maroloccio
    elseif strftime("%H") < 21
        set background=dark
        colorscheme zenburn
    else
        set background=dark
        colorscheme wombat
    endif
elseif has('unix')
    "set gfn=Deja\ Vu\ Sans\ Mono\ 9
    set gfn=Terminus\ 10
    set shell=/bin/bash
    " sets the color scheme based on time
    if strftime("%H") < 4
        set background=dark
        colorscheme solarized
    elseif strftime("%H") < 12
        set background=dark
        colorscheme bclear
    elseif strftime("%H") < 17
        set background=light
        colorscheme earendel
    elseif strftime("%H") < 21
        set background=dark
        colorscheme molokai
    else
        set background=dark
        colorscheme jellybeans
    endif
endif
" - - - - }}}

" Toolbar - - - - {{{ 
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=m  "remove top bar
set guioptions-=L  "remove left-hand scroll bar
nnoremap <silent><C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
" - - - - }}}

" Mouse - - - - {{{
if has('mouse')
    set mouse=a
endif
" - - - - }}}


" Control Keys - - - - {{{
inoremap <C-BS> <C-W>
nnoremap <C-BS> bdw
" ctrl-backspace deleted the previous word
inoremap <C-\> <C-x><C-l>
" line completion with ctrl-\
vnoremap <C-a> ggVG
" map ctrl+a to select all in visual mode
nnoremap <C-a> ggVG
" map ctrl+a to select all in normal mode
vnoremap <C-c> "+y
" map ctrl+c to copy in visual mode
vnoremap <C-v> "+gP
" map ctrl+v to paste in visual mode
inoremap <C-v> <C-O>"+gP
" map ctrl+v to paste in insert mode
inoremap <C-U> <C-G>u<C-U>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
nnoremap <C-n> :bn<CR>
" Moves along buffers
"nnoremap <C-h> <C-W>W
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
"nnoremap <C-l> <C-W>w
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" Maps the control + movement keys to moving around window splits
nnoremap <C-f> :CommandT<CR>
" command-t mappings
" open files
" - - - - }}}

" Regular Keys - - - - {{{ 
nnoremap ; :
" maps ; to the ex commands
nnoremap <space> :CommandTBuffer<cr>
" browse buffers
cmap Q :q!<cr>
" easier way to quit
cmap w!! w !sudo dd of=%<cr>
" root authority writing
vnoremap <F2> zf
" Creates Folds
map <F2> za
" Opens or closes Folds 
map <F3> zR
" Opens all Folds
map <F4> zM
" Closes all Folds
nnoremap Y y$
" y$ yanks to the end of the line
nnoremap D d$
" d$ deletes to the end of the line
nnoremap C c$
" c$ changes to the end of the line
imap jk <Esc>
" esc returns to command mode
nnoremap Q gq
" Don't use Ex mode, use Q for formatting
map J 10j
" Moves 10 lines down
map K 10k
" Moves 10 lines up
map H ^
" Moves to the front of the line
map L $
" Moves to the end of the line
" - - - - }}}

" Leader - - - - {{{ 
let mapleader=","
" change the mapleader from \ to ,
map <leader>tt :TagbarToggle<CR>
" toggles the tagbar with tt
nnoremap <leader><space> :noh<cr>
" map ,space to clear search results
nnoremap <leader>q <C-w><C-v><C-w>l :e ~/scratch.vim<cr>
" opens a pad to do macro testing
nnoremap <leader>Q :so ~/scratch.vim<cr>
" source the macro file
nnoremap <leader>v <C-w><C-v><C-w>l:e $MYVIMRC<cr>
" open vimrc in another split
nnoremap <leader>V :so $MYVIMRC<cr>
" source vimrc
nnoremap <leader>hp :!pasty %<cr>
" cats the current file into hastebin
nnoremap <leader>dp :!cp % ~/Dropbox/Public/
" copies current file into dropbox
nnoremap <leader>wv :vsplit<cr>
nnoremap <leader>wh :split<cr>
" vertical/horizontal splits
nnoremap <leader>j :Java<cr>
nnoremap <leader>jv :Javac<cr>
" eclim mappings
" - - - - }}}

" Folding - - - - {{{ 
set foldenable      " Turn on folding
au FileType vim set foldmethod=marker

au FileType python set foldmethod=indent 
au FileType python set foldnestmax=1

au FileType cpp set foldmethod=syntax
au FileType cpp set foldnestmax=1

au FileType java set foldmethod=manual

" saves and loads folds from previous sessions
au BufWinLeave * silent! mkview 
au BufWinEnter * silent! loadview

"  - - - - }}}

" Language - - - - {{{ 

" general
nnoremap <leader>mc :make <bar> :cw<cr>
" compiles c++ with -g flag
nnoremap <leader>mk :make %< <bar> :cw<cr>
" maps ,m to compile and open a quickfix window if there are errors
"
" python 
"map <C-p> :!/usr/bin/env python2 %
nnoremap <leader>p2 :!/usr/bin/env python2 %
" runs python 2 files *ctrl-p*
nnoremap <leader>p3 :!/usr/bin/env python3 %<cr>

" c++ 
nnoremap <C-c> :!./%<<cr>
" runs c++ files *ctrl-c*
nnoremap <leader>cl :!clang++ % -o %<
" clang compiler for c++

" CSS, also have things in braces indented:
 autocmd FileType css set smartindent
 " HTML, generally format text, but if a long line has been created
 " leave it alone when editing:
 autocmd FileType html set formatoptions+=tl
 " CSS/HTML, use genuine tab characters for 
 " indentation, to make files a few bytes smaller:
 autocmd FileType html,css set noexpandtab tabstop=2


" windows
if has ("win32")
    set makeprg=mingw32-make
    set shell=C:\MinGW\msys\1.0\bin/bash.exe
    " executes python under windows
    map <C-p> :!C:\Python27/python %
endif


" - - - - }}} 

" Plugins - - - - {{{ 
" pathogen 
call pathogen#infect()
" powerline
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'compatible'

" autoclose
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" tagbar
let g:tagbar_left=1
let g:tagbar_width=25
let g:tagbar_compact=1
let g:tagbar_singleclick=1
let g:tagbar_sort=0

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

" clang complete
let g:clang_complete_auto = 0
let g:clang_auto_select= 2
let g:clang_user_options='|| exit 0'
let g:clang_use_library= 1
set completeopt=menu,menuone,longest

" - - - - }}}

" Completion - - - - {{{

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
nnoremap <leader>bt :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" }}}




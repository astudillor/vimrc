syntax on " Enable syntax highlighting
" Indentation settings for using 4 spaces instead of tabs.
set tabstop=4
set shiftwidth=4
set expandtab
" Attempt to determine the type of a file based on its name and possibly its
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'fugitive.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'commentary.vim'
Plugin 'molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'
Plugin 'chriskempson/base16-vim'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_authorName="Reinaldo Astudillo"
let g:DoxygenToolkit_licenseTag="My own license"

let g:pymode_python = 'python3'

"Rainbow brackets
let g:rainbow_active = 1

filetype indent plugin on
" let g:airline_theme='molokai'
" the separator used on the left side
" let g:airline_left_sep=''
" " the separator used on the right side
" let g:airline_right_sep=''

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set title           " show title in console title bar
set vb              " turn off error beep/flash
set ls=2            " always show status line
set showcmd         " show command in bottom bar
set cindent         " cindent
set smartindent     " smart indent
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set cursorline      " highlight current line
set ruler           " show the cursor position all the time
set sm              " show matching parenthesis
set lazyredraw      " redraw only when we need to.
set exrc            " local vimrc
"Line numbering
set relativenumber
set number
" Search down into sub-folders
set path+=** "Provides tab-completion for all file-related tasks
set wildmenu " Display all matching files when we tab complete
" color torte " color scheme
" set termguicolors
set term=screen-256color
color molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
hi Comment ctermfg=lightblue
" set background=dark
hi CursorLineNr cterm=bold
hi CursorLine cterm=bold

"spelling
set spell spelllang=en_us
hi clear SpellBad
hi clear SpellLocal
hi clear SpellCap
hi clear SpellRare
hi SpellBad cterm=underline,bold
hi SpellLocal cterm=underline,bold
hi SpellCap cterm=underline,bold
hi SpellRare cterm=underline,bold

" Set color column 80
highlight ColorColumn ctermbg=gray
set colorcolumn=80
" Text till 80th column
set tw=79 fo+=t
" Turn off the highlight of the last searches
nnoremap <silent> <leader>r :nohlsearch<cr>
" Text formatter commands
nnoremap <silent> <leader>l :.! fmt -w 79<cr>
nnoremap <silent> <leader>L :0,$! fmt -w 79 -s<cr>
" Persistent undo
if has('persistent_undo')
    set undofile
    " remember create this directory $ mkdir ~/.vim/undodir
    set undodir=~/.vim/undodir
endif
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
vnoremap < <gv
 " Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
  \ | exe "normal! g'\"" | endif
endif
" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" ctrl-s for saving the file (add to bashrc 'stty -ixon' without quotes)
nnoremap <silent> <c-s> :up<cr>
inoremap <silent> <c-s> <c-o>:up<cr>
vnoremap <silent> <c-s> <c-[>:up<cr>

" ctrl-z to save file, suspend vim, go the shell command
" insert and normal mode
" remeber ctrl-d to go back
inoremap <silent> <c-z> <c-o>:up<cr><c-o>:sh<cr>
nnoremap <silent> <c-z> :up<cr>:sh<cr>

noremap <leader>m :w <bar> exec 'mak'<cr>

" Execute current line or current selection as Vim EX commands.
" from https://stackoverflow.com/questions/14385998
nnoremap <F2> :exe getline(".")<CR>
vnoremap <F2> :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

" NERDTree
inoremap <silent> <F12> <c-o>:NERDTreeToggle<cr>
nnoremap <silent> <F12> :NERDTreeToggle<cr>
vnoremap <silent> <F12> <c-o>:NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let @i="^mmyy3ggp:left\<cr>Iimport \<esc>`md$"

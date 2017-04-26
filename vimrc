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
filetype indent plugin on

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set title           " show title in console title bar
set vb              " turn off error beep/flash
set ls=2            " allways show status line
set showcmd         " show command in bottom bar
set cindent         " cindent
set smartindent     " smart indent
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set cursorline      " highlight current line
set ruler           " show the cursor position all the time
set sm              " show matching parens
set lazyredraw      " redraw only when we need to.
"Line numbering
set relativenumber
set number
" Search down into subfolders
set path+=** "Provides tab-completion for all file-related tasks
set wildmenu " Display all matching files when we tab complete
color torte " color scheme
"spelling
hi clear SpellBad
hi SpellBad cterm=underline
set spell spelllang=en_us
" Set color column 80
highlight ColorColumn ctermbg=gray
set colorcolumn=80
" Text till 80th column
setl tw=79 fo+=t
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

" ctrl-s for saving the file (add to bashrc 'stty -ixon' without quotes)
nnoremap <silent> <c-s> :up<cr>
inoremap <silent> <c-s> <c-o>:up<cr>
vnoremap <silent> <c-s> <c-[>:up<cr>

" ctrl-z to suspend vim and go the shell command in insert mode
" remeber ctrl-d to go back
inoremap <silent> <c-z> <c-o>:sh<cr>

" Compile latex with ,bb and bibtex ,br 
noremap ,bb :w <bar> exec '!pdflatex %'<cr> 
noremap ,br :w <bar> exec '!bibtex %'<cr> 

" NERDTree 
inoremap <silent> <F12> <c-[>:NERDTreeToggle<cr>
nnoremap <silent> <F12> :NERDTreeToggle<cr>
vnoremap <silent> <F12> <c-[>:NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" vim-commentary
inoremap <silent> <c-i> <c-o>:normal gcc<cr>

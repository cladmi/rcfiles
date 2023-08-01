" Autoreload vimrc
autocmd! bufwritepost .vimrc source %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force terminal to 256 colors
set t_Co=256

" fileformats and encoding
se fileformats=unix,dos
se fileformat=unix

set encoding=utf-8
set fileencoding=utf-8

" Unset PAGER environment variable to prevent recursive
" fork when using Vim's 'Man' command.
" This works with the PAGER setting in .profile or .bashrc.
let $PAGER=''

" Set global spell languages.
" Spell still disabled by default
set spelllang=fr,en


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration "
"""""""""""""""""
" may be overriden by language specific configurations

set background=dark
set number

" Text width, used for automatic wrapping or line length coloring
set textwidth=80
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing

set mouse=a
" Copying in VIM uses X11 (not the middle click one)
""" set clipboard=unnamedplus

"autocompletion
set wildmenu
set wildmode=longest:full,list:full

set wildignore+=*.pyc
set wildignore+=*/build/*
set wildignore+=*/coverage/*
set wildignore+=*/bin/*,*.o,*.d,*.a
set wildignore+=*.swp
set wildignore+=*.pdf

" Two high command/status line to  2 lines
se cmdheight=2
se laststatus=2

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors "
""""""""""

" Enable syntax highlighting
" You need to reload this file for the change to apply
syntax enable
filetype off
filetype plugin indent on

" Showing line length limit in dark dark gray
" set colorcolumn=+1   " one line
let &colorcolumn=join(range(&textwidth+1,999),",")  " all section
highlight ColorColumn ctermbg=233


" color nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/

" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$\| \+\ze\t| [^\t]\zs\t\+/
"
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

set list
set lcs:tab:\ \ ,nbsp:·,trail:·
"set listchars=nbsp:¤,trail:¤,extends:>,precedes:< (à voir pour adapter)
"set lcs:nbsp:·,trail:·


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation "
"""""""""""""""

set autoindent
set tabstop=4
set shiftwidth=4
set shiftround    " when using > or < round tab to multiple of shiftwidth
set expandtab     " replace tabs by spaces

" Disable softtabstop
set softtabstop=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language specific configurations "
""""""""""""""""""""""""""""""""""""
autocmd FileType c      setlocal noexpandtab ts=8 sw=8
autocmd FileType cpp    setlocal noexpandtab ts=8 sw=8
autocmd FileType dts    setlocal noexpandtab ts=8 sw=8
autocmd FileType cmake  setlocal noexpandtab ts=8 sw=8
"autocmd FileType python setlocal smarttab
autocmd FileType tex    setlocal ts=2 sw=2
autocmd FileType gitcommit setlocal spell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search configuration "
""""""""""""""""""""""""

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
" Keep case sensitivity for * and #
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
" Toggle hlsearch
nnoremap <F9> :set hlsearch! hlsearch?<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modules "
"""""""""""

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim \
"     https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 8
" change move to c-t c-s (bepo) an remove old bindings
let g:ctrlp_working_path_mode = 'wra'
let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("t")': [],
            \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>'],
            \ 'PrtSelectMove("j")': ['<c-t>', '<down>'],
            \ 'PrtSelectMove("k")': ['<c-s>', '<up>'],
            \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping "
"""""""""""""""

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

se foldmethod=syntax
"hi Folded ctermbg=255 ctermfg=0
"hi Folded ctermbg=125 ctermfg=42

" Enable using modeline for current buffer
"   setting modeline globally can be a security issue
"   reprocess file after setting (using :e could remove history)
"   Print modeline status
map <F2> :setlocal modeline <Return>
            \:doautocmd BufRead <Return>
            \:setlocal modeline? <Return>

" Remove trailing whitespaces
map <F3> :%s/\s\+$//e <Return>
" Clear non breaking spaces
map <F4> :%s/\%xa0/ /ge <Return>
" Toggle spell and show value
map <F5> :setlocal spell! spell? <Return>

" Change paste mode to not do syntax update
set pastetoggle=<F8>

"
" Tabs
"
nnoremap ,t :tabnew<CR>
nnoremap ,c :tabp<CR>
nnoremap ,r :tabn<CR>


" disable visual mode
nnoremap Q q

" Remap w
command! W w
command! Wq wq
command! WQ wq
command! Q q

" working directory to current file, per buffer !
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" Try disabling for Ctrl+p
autocmd BufEnter * silent! lcd %:p:h

" Rebind <Leader> key
let mapleader = ","

" delete buffer without deleting split
map <Leader>d  :bn\|bd#<CR>

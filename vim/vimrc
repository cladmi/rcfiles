source ~/.vimrc.bepo

let $PAGER=''

if has("autocmd")
  autocmd! bufwritepost .vimrc source ~/.vimrc
endif

set background=dark

set nu

set encoding=utf-8
set fileencoding=utf-8

" recherche
set hlsearch
set incsearch
set smartcase
" avec *, pas de smartcase
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>


set ai
syn on
set syntax=on
filetype indent plugin on
set sw=8
set ts=8

  "indent auto lors du chargement pour le C
au BufNewFile, BufRead *.c, *.cc, *.cpp, *.h		se cindent

"syn region myFold start="\#if" end="\#endif" transparent fold
"syn sync fromstart


se foldmethod=syntax
"hi Folded ctermbg=255 ctermfg=0
hi Folded ctermbg=125 ctermfg=42

"se visualbell

set mouse=a

map <F2> :wa <Return> :mak <Return>
map <F3> :%s/\s\+$//e <Return>
map <F5> :setlocal spell spelllang=fr,en <Return>

set pastetoggle=<F8>



" colorise les nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
" match NbSp / /
match NbSp /\%xa0/

" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$\| \+\ze\t| [^\t]\zs\t\+/
" 
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()


set list
set lcs:tab:¡\ ,trail:·

"autocompletion
set wildmenu

"
se ch=2
se laststatus=2
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
" set virtualedit=all

set incsearch


" Add the unnamed register to the clipboard
set clipboard+=unnamed

" fileformats
se fileformats=unix,dos
se fileformat=unix


" tags
" set tags+=tags;$HOME/work/
set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,tags
set tags+=$HOME/.vim/tags/wsn_drivers
set tags+=$HOME/.vim/tags/msp430
set tags+=$HOME/.vim/tags/freertos

map <F4> :TlistToggle<cr>
map <F6> :!(cd %:p:h;ctags --sort=yes --language-force=C --c-kinds=+p --fields=+iaS --extra=+q *)&





command CD cd %:p:h


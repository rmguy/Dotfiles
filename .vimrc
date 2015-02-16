set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
set sessionoptions-=options
syntax on
filetype plugin indent on

if &diff
    colorscheme diffscheme
endif

let mapleader=","   " leader is comma
syntax enable       " enable syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files (~/.vim/indent/python.vim)
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set cursorline          " nice highlight for current line
hi CursorLine term=bold cterm=bold guibg=Grey40
set number

" turn off search highlight ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" move to beginning/end of line, TODO
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text, TODO
" nnoremap gV `[v`]
" jk is escape, TODO
inoremap jj <esc>

" open ag.vim TODO: Install ag.vim
nnoremap <leader>a :Ag
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif
noremap <leader>g :Ag <C-R><C-W>

" Ctrl n for nerdtree
map <C-n> :NERDTreeToggle<CR>
" Close if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" basic vim close/open mappings
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nmap <c-g> :wqa!<CR>
imap <c-g> <Esc>:wqa!<CR>
imap <c-g> <Esc><c-g>
nmap <leader>c :q!<CR>
imap <leader>c <Esc>:q!<CR>
autocmd BufWritePre * :%s/\s\+$//e

" golang
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader><ENTER> :exe "GoDef"<CR>
nmap <leader>m :Tabmerge<CR>
" au FileType go au BufWritePre <buffer> Fmt

" Ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/results/*.*/logs/*,*/bin/*

" vim-go
let g:go_auto_type_info = 1
let g:go_highlight_structs = 1

" Tagbar
nmap tt :TagbarToggle<CR>

" Gotags settings
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

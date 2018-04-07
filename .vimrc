set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
set sessionoptions-=options
syntax on

" Needs TERM exported to 256 colors
colorscheme heroku-terminal
filetype plugin indent on
filetype plugin on

if &diff
        colorscheme diffscheme
endif

" Scrolling
set mouse+=a

let mapleader=","       " leader is comma
syntax enable           " enable syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files (~/.vim/indent/python.vim)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight ,<space>
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set pastetoggle=<F2>    " toggle paste mode with F2

" highlight cursor line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set number

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
" map <C-n> :NERDTreeToggle<CR>
" Close if only nerdtree open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-h> <C-w>h
"map <C-l> <C-w>l

nmap <c-g> :wqa!<CR>
imap <c-g> <Esc>:wqa!<CR>
nmap <c-c> :q!<CR>
imap <c-c> <Esc>:q!<CR>
" nmap <leader>c :q!<CR>
" imap <leader>c <Esc>:q!<CR>
nmap <c-w> :w<CR>
imap <c-w> <Esc>:w<CR>
autocmd BufWritePre * :%s/\s\+$//e

" golang
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader><ENTER> :exe "GoDef"<CR>
nmap <leader>m :Tabmerge<C-R><CR>
" au FileType go au BufWritePre <buffer> Fmt

" nginx
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile *nginx.conf set ft=nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* setfiletype nginx

" Ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/results/*.*/logs/*,*/bin/*


" vim-go
let g:go_auto_type_info = 0
let g:go_highlight_structs = 0
" format with goimports instead of gofmt
" let g:go_fmt_command = "goimports"
" oracle setup
let g:go_oracle_scope='github.com/GoogleCloudPlatform/kubernetes/cmd/kubelet github.com/GoogleCloudPlatform/kubernetes/cmd/kube-apiserver github.com/GoogleCloudPlatform/kubernetes/cmd/kube-controller-manager github.com/GoogleCloudPlatform/kubernetes/cmd/kube-proxy github.com/GoogleCloudPlatform/kubernetes/cmd/kubectl github.com/GoogleCloudPlatform/kubernetes/cmd/kubernetes'
nmap <leader>i :GoImplements <CR>
nmap <leader>d :GoDescribe <CR>
nmap <leader>calls :GoCallers <CR>
nmap <leader>in :GoCallees <CR>
nmap <leader>where :GoCallstack <CR>
nmap <leader>peers :GoChannelPeers <CR>


" Tagbar
nmap tt :TagbarToggle<CR>

" Gotags settings
"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }

" Gitgutter settings
highlight clear SignColumn
hi GitGutterAddLine guibg=green
hi GitGutterChangeLine guibg=green
hi GitGutterDeleteLine guibg=green
hi GitGutterAdd guibg=red guifg=green
hi GitGutterChange guibg=red guifg=green
hi GitGutterDelete guibg=red guifg=green
let g:gitgutter_diff_args = 'master'

" Note: non eager diffing messes up hunk navigation
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" nmap <leader> <Plug>GitGutterNextHunk

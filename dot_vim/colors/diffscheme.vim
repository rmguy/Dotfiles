"ghtthese lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/morning.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "diffscheme"

" highlight DiffText ctermfg=blue ctermbg=black
highlight DiffAdd ctermfg=green ctermbg=black
highlight DiffDelete ctermbg=black ctermfg=green
highlight DiffText ctermbg=black ctermfg=green
highlight DiffChange ctermfg=blue ctermbg=black


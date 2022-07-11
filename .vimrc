":=================================:"
": 	          VIM PLUG   		   :"
":=================================:"

call plug#begin('.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-ruby/vim-ruby'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'

call plug#end()

":=================================:"
": 	        VIM SETTINGS	       :"
":=================================:"

set tabstop=4
set shiftwidth=4
set expandtab
set number
set scrolloff=5
set hlsearch
set ignorecase
set nowrap
set noshowmode
set laststatus=2
set t_Co=16
set background=dark
set history=1000
set cursorline 

syntax enable
filetype on
filetype indent on

let g:lightline = {
    \  'colorscheme': 'PaperColor'
    \ }

":=================================:"
": 	       VIM COLORSCHEME	       :"
":=================================:"

"  KEY             :foreground:   :background:   :font-style:
hi linenr           ctermfg=15                    cterm=bold  
hi cursorline                      ctermbg=8      cterm=NONE
hi cursorlinenr     ctermfg=6      ctermbg=8      cterm=bold
hi errormsg         ctermfg=8      ctermbg=9  
hi matchparen       ctermfg=6      ctermbg=NONE   cterm=bold

hi string           ctermfg=2
hi character        ctermfg=2
hi number           ctermfg=3
hi float            ctermfg=3
hi boolean          ctermfg=9                     cterm=italic
hi function         ctermfg=12                  
hi conditional      ctermfg=9
hi operator         ctermfg=9 
hi delimiter        ctermfg=9                     cterm=bold  
hi label            ctermfg=13                  
hi constant         ctermfg=6                     cterm=bold
hi comment          ctermfg=15                    cterm=italic
hi error            ctermfg=1       

hi statment         ctermfg=13                    cterm=italic
hi repeat           ctermfg=13                    cterm=italic
hi keyword          ctermfg=13                    cterm=italic
hi exception        ctermfg=13                    cterm=italic
hi include          ctermfg=13                    cterm=italic
hi preproc          ctermfg=12                    cterm=italic
hi define           ctermfg=13                    cterm=italic
hi marco            ctermfg=13                    cterm=italic 
hi percondit        ctermfg=13                    cterm=italic
hi class            ctermfg=13                    cterm=italic
hi type             ctermfg=13                    cterm=italic
hi structure        ctermfg=13                    cterm=italic
hi typedef          ctermfg=13                    cterm=italic






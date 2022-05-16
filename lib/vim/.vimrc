" Clipboard
set clipboard=unnamed

" Tabs and Indents
set tabstop=4 shiftwidth=4 expandtab
set autoindent 
set smartindent
set copyindent

" Relative line numbers
set nu rnu

" Search
set incsearch
set hlsearch

" no error bells
set belloff=all

" Show keystrokes
set showcmd

" autocomplete
set wildmode=longest,list,full
set wildmenu

" syntax
syntax on

" leader character
let mapleader = " "

" Keybindings
noremap <leader><return> o<esc>
noremap <leader>p o<esc>p
noremap <leader>b :buffers<cr>
noremap <leader>r :!!<cr>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <c-l> :nohl<cr> 

" Testing no visual mode -> antipattern
map v <Nop>
map V <Nop>

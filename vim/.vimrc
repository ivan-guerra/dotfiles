" General settings.
set secure
set mouse=c
set shortmess+=A
set noswapfile
set nocompatible

" Set the runtime path to include Vundle and init plugins.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Git plugins.
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/airblade/vim-gitgutter.git'

" Status bar.
Plugin 'https://github.com/vim-airline/vim-airline.git'
let g:airline_powerline_fonts =1
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='jellybeans'

" File/source tree.
Plugin 'https://github.com/preservim/nerdtree.git'
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp']
let g:NERDTreeDirArrowExpandable='|'
let g:NERDTreeDirArrowCollapsible='+'
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeQuitOnOpen=1
map <C-n> :NERDTreeToggle<CR>

" Syntax helpers.
Plugin 'https://github.com/vim-syntastic/syntastic.git'
let g:syntastic_check_on_open=1
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:syntastic_python_checkers=['flake8']

" WARNING, to use tagbar you have to install CTags on your machine!
Plugin 'https://github.com/majutsushi/tagbar.git'
let g:tagbar_autoclose=1
map <C-b> :TagbarToggle<CR>
set tags=./tags,tags;$HOME

" Completion.
Plugin 'https://github.com/ervandew/supertab.git'

" cscope mappings.
Plugin 'https://github.com/joe-skb7/cscope-maps.git'

" Fuzzy search.
Plugin 'https://github.com/kien/ctrlp.vim.git'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Code formatting.
Plugin 'https://github.com/rhysd/vim-clang-format.git'
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1

" Context sensitive bracket, paren, etc. autoclosing.
Plugin 'https://github.com/Raimondi/delimitMate.git'

call vundle#end()

" Set indentation rules.
set smarttab
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Look and feel and workflow settings.
syntax on
set ruler
set number
set hidden
set autowrite
set incsearch
set ignorecase
set nohlsearch
set formatoptions+=cro
set backspace=indent,eol,start
set laststatus=2
set fillchars+=vert:\|
set colorcolumn=80
set termguicolors
colorscheme jellybeans
highlight ColorColumn ctermbg=lightgrey

" Key mappings.
nmap kk <S-:>
imap jj <Esc>
nmap <C-Right> :tabnext<CR>
nmap <C-Left> :tabprevious<CR>
inoremap <C-Z> <C-O>u
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" Call StripTrailingWhitespaces() on file save.
autocmd BufWritePre * :call StripTrailingWhitespaces()

function StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l, c)
endfun

" Set relative line number
set number
set relativenumber

" Reload files when changed behind vim's back
set autoread

" Disable swap files and such nonsense
set nobackup
set nowb
set noswapfile

" Configure search
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan

" Enable mouse integration
set mouse=a

" Use spaces for indentation...
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" split goes to the bottom and vsplit to the right
set splitbelow
set splitright

" ...except for Makefiles
filetype plugin indent on
autocmd FileType make   setlocal noexpandtab

" Configure terminal mode
tnoremap <Esc> <C-\><C-n>

" Source init.vim whenever it's changed
autocmd! BufWritePost init.vim,.vimrc source %

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim
    	\ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim 
endif

" Load all plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git' 
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/gabesoft/vim-ags.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
call plug#end()

set clipboard+=unnamedplus

" Set solarized vim theme (if avoid error on first boot while plug downloads
" the theme)
syntax enable
set background=dark
silent! colorscheme solarized

" Set solarized airline
let g:airline_theme='solarized'
let g:aitline_solarized_bg='dark'

" Configure powerline characters
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Ctrl+p for fuzzy search ('r' means start at the .git)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Remap leader key
let mapleader = ","

" ',n' toggle NERDTree
map <leader>n :NERDTreeToggle<cr>

" ',t' create a terminal win
map <leader>t :split \| terminal<cr>

" ',g' grep
map <leader>f :Ags 

" Ctrl+s to save (habits...)
inoremap <c-s> <Esc>:Update<CR>
inoremap <c-s> <c-o>:Update<CR>
vmap <C-s> <esc>:w<CR>gv

" terminal starts in insert mode
autocmd TermOpen * startinsert

" autoclose buffer when terminal exits
autocmd TermClose * bd!

" Use ctrl+kj to just 5 lines at a time
nnoremap <C-k> 5k
nnoremap <C-j> 5j
nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>


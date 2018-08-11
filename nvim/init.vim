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

" Source init.vim whenever it's changed
autocmd! BufWritePost init.vim,.vimrc source %

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim
    	\ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Load all plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/ajmwagar/vim-deus.git'
Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" Plug 'https://github.com/Valloric/YouCompleteMe.git', { 'do': './install.py --clang-completer' }
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/gabesoft/vim-ags.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/ryanoasis/vim-devicons.git'
call plug#end()

" (try to) share clipboard with X.org
set clipboard+=unnamedplus


" Configure status bar
set noshowmode
set laststatus=2

" Configure colorscheme
syntax enable
set t_Co=256
silent! colorscheme seoul256
set background=dark

" Configure status bar
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '¶'
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

" ',b' toggle NERDTree
map <leader>b :NERDTreeToggle<cr>

" ',st' create a terminal win
map <leader>st :split \| terminal<cr>

" ',vt' to create a terminal windows on the right
map <leader>vt :vsplit \| terminal<cr>

" ',s' to create a split
map <leader>s :split<cr>

" ',v' to create a vsplit
map <leader>v :vsplit<cr>

" ',f' search workspace
map <leader>f :Ags

" ctrl+s to save (habits...)
inoremap <C-s> <Esc>:w<cr>a
nnoremap <C-s> :w<cr>
vmap <C-s> <esc>:w<CR>v

" turn on highlight of the current line
set cursorline

" terminal starts in insert mode
autocmd TermOpen,BufWinEnter,WinEnter term://* startinsert

" autoconfirm on exit
autocmd TermClose term://* bd!

" esc configure to switch to normal mode (for copy paste, etc...)
tnoremap <Esc> <C-\><C-n>

" auto escape to terminal mode when switching to another split
tnoremap <C-w><Up> <C-\><C-n><C-w><Up>
tnoremap <C-w><Down> <C-\><C-n><C-w><Down>
tnoremap <C-w><Left> <C-\><C-n><C-w><Left>
tnoremap <C-w><Right> <C-\><C-n><C-w><Right>

" Use ctrl+kj to just 5 lines at a time
nnoremap <C-k> 5k
nnoremap <C-j> 5j
nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>

" Use ctrl+kj to just 5 lines at a time
nnoremap <C-k> 5k
nnoremap <C-j> 5j
nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>


" Highlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


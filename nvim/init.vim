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
set nowrap

" Select using shift arrow
noremap     <S-Down>    v<Down>
noremap     <S-Up>      v<Up>
noremap     <S-Left>    v<Left>
noremap     <S-Right>   v<Right>
noremap     <S-End>     v$
noremap     <S-Home>    v^

vnoremap    <S-Up>      <Up>
vnoremap    <S-Down>    <Down>
vnoremap    <S-Left>    <Left>
vnoremap    <S-Right>   <Right>

vnoremap    <Up>        <Esc><Up>
vnoremap    <Down>      <Esc><Down>
vnoremap    <Left>      <Esc><Left>
vnoremap    <Right>     <Esc><Right>

inoremap    <S-Down>    <Esc>v<Down>
inoremap    <S-Up>      <Esc>v<Up>
inoremap    <S-Left>    <Esc>v<Left>
inoremap    <S-Right>   <Esc>v<Right>
inoremap    <S-End>     <Esc>v$
inoremap    <S-Home>    <Esc>v^

nnoremap <silent> <C-c> :BD<cr>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" When switching back to Normal mode from Insert mode
" prevent the cursor from moving to the left, grrr
inoremap <Esc> <Esc><Right>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-R to redo
noremap <C-R> <C-R>
inoremap <C-R> <C-O><C-R>

" CTRL+S to save
inoremap <C-s> <Esc>:w<cr>a
nnoremap <C-s> :w<cr>
vmap <C-s> <esc>:w<CR>v

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

" Source init.vim & reload Airline whenever it's changed
autocmd! BufWritePost init.vim source ~/.config/nvim/init.vim | AirlineRefresh

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim
    	\ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Load all plugins
call plug#begin('~/.config/nvim/plugged')

    " Make vim pretty
    Plug 'https://github.com/vim-airline/vim-airline.git'
    Plug 'https://github.com/vim-airline/vim-airline-themes.git'
    Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'

    " Dim inactive windows
    Plug 'https://github.com/blueyed/vim-diminactive.git'

    " Git support
    Plug 'https://github.com/tpope/vim-fugitive.git'

    " Side bar with pretty icons
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/ryanoasis/vim-devicons.git'

    " Move lines around
    Plug 'https://github.com/matze/vim-move.git'

    " Commenting stuff
    Plug 'https://github.com/tpope/vim-commentary'

    " Fuzzy file search
    Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

    " Kill windows without losing split
    Plug 'https://github.com/qpkorr/vim-bufkill.git'

     " Global search
    Plug 'https://github.com/mileszs/ack.vim.git'
    Plug 'https://github.com/Valloric/ListToggle.git'

    " Multiple cursors
    Plug 'https://github.com/terryma/vim-multiple-cursors'

    " Language Support
    Plug 'https://github.com/sheerun/vim-polyglot.git'
    Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'https://github.com/tweekmonster/deoplete-clang2.git'
    Plug 'https://github.com/vim-syntastic/syntastic.git'
    Plug 'https://github.com/zchee/deoplete-jedi.git'

call plug#end()


" Use the silver searcher for grep
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Activate Completion on startup
let g:deoplete#enable_at_startup = 1

" Everything that's yanked is put in the cliboard + mouse cliboard
set clipboard+=unnamed
set clipboard+=unnamedplus

" When selecting text in visual mode with the mouse => autoyank
vmap <LeftRelease> "*ygv
vnoremap <2-LeftMouse> <2-LeftMouse>"*ygv
vnoremap <3-LeftMouse> <3-LeftMouse>"*ygv


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
map <leader>ts :split \| terminal<cr>

" ',vt' to create a terminal windows on the right
map <leader>tv :vsplit \| terminal<cr>

" ',vt' to create a terminal windows on the right
map <leader>t :terminal<cr>

" ',s' to create a split
map <leader>s :split<cr>

" ',v' to create a vsplit
map <leader>v :vsplit<cr>

" ',f' search workspace
map <leader>f :Ags

" commenting out stuff
map <leader>c gcc

" turn on highlight of the current line
set cursorline

" terminal starts in insert mode
autocmd TermOpen,BufWinEnter,WinEnter term://* startinsert

" terminal closes automatically when exit
autocmd TermClose term://* :q 


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


" Key Bindings for git
map <Leader>gd :Gvdiff<cr>
map <Leader>gw :Gstatus<cr>
map <Leader>gb :Gblame<cr>


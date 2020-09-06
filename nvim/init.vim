"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" not in the 80's anymore
set nocompatible

" coc.vim says it's good
set hidden
set updatetime=300

" Set relative line number, gutter always visible
set number signcolumn=yes

" Reload files when changed behind vim's back
set autoread

" Highlight of the current line
set cursorline

" Disable swap files and such nonsense
set nobackup nowb noswapfile

" Configure search
set hlsearch ignorecase smartcase incsearch wrapscan nowrap

" Configure mouse interation
set mouse=a

" Everything that's yanked is put in the cliboard + mouse cliboard
set clipboard+=unnamed,unnamedplus

" When selecting text in visual mode, put it in primary clipboard (middle mouse button)
vmap <LeftRelease> "*ygv
nmap <2-LeftMouse> <2-LeftMouse>"*ygv
vmap <3-LeftMouse> <3-LeftMouse>"*ygv

" Use 4x spaces for tabs...
set expandtab smarttab shiftwidth=4 tabstop=4

" ...except for Makefiles
filetype plugin indent on
autocmd FileType make setlocal noexpandtab

" Split goes to the bottom and vsplit to the right
set splitbelow splitright

" Do not display current mode, will be done in status bar
set noshowmode laststatus=2

" Automatically reload vimrc, and refresh airline if installed
autocmd! BufWritePost init.vim,.vimrc source % | if exists(':AirlineRefresh') | execute 'AirlineRefresh' | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make VIM behave more like a normal text editor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When switching back to Normal mode from Insert mode
" prevent the cursor from moving to the left, grrr
inoremap <Esc> <Esc><Right>

" allow to go directly from visual mode to insert mode
xnoremap i <Esc>i

" indent/dedent with tab/s-tab
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" ctrl+c copy to system clipboard
vnoremap <c-c> y

" ctrl+v to paste from system clipboard
nnoremap <c-v> Pl
inoremap <c-v> <esc>lPa

" ctrl+x to cut to system clipboard
vnoremap <c-x> d

" ctrl+s to save
nmap <c-s> :w<CR>
vmap <c-s> <Esc>:w<cr>gv
imap <c-s> <Esc>:w<CR>i

" Select using shift+arrow/home/insert
nnoremap <S-Right> v<Right>
xnoremap <S-Right> <Right>
inoremap <S-Right> <c-o>v<Right>
nnoremap <S-Left> v<Left>
xnoremap <S-Left> <Left>
inoremap <S-Left> <c-o>v<Left>
nnoremap <S-Up> v<Up>
xnoremap <S-Up> <Up>
inoremap <S-Up> <c-o>v<Up>
nnoremap <S-Down> v<Down>
xnoremap <S-Down> <Down>
inoremap <S-Down> <c-o>v<Down>
nnoremap <S-Home> v<Home>
inoremap <S-Home> <c-o>v<Home>
xnoremap <S-Home> <Home>
nnoremap <S-End> v<End>h
inoremap <S-End> <c-o>v<End>h
xnoremap <S-End> <End>h

" Select words using ctrl+shift+arrow/home/insert
nnoremap <C-S-Right> ve
xnoremap <C-S-Right> e
inoremap <C-S-Right> <c-o>ve
nnoremap <C-S-Left> vb
xnoremap <C-S-Left> b
inoremap <C-S-Left> <c-o>vb

" Select line using ctrl+shift+arrow/home/insert
nnoremap <C-S-Home> v<Home>
inoremap <C-S-Home> <c-o>v<Home>
xnoremap <C-S-Home> <Home>
nnoremap <C-S-End> v<End>
inoremap <C-S-End> <c-o>v<End>
xnoremap <C-S-End> <End>

" Exit VISUAL when shift not held.
xnoremap <Right> <Esc><Right>
xnoremap <Left> <Esc><Left>
xnoremap <Up> <Esc><Up>
xnoremap <Down> <Esc><Down>
xnoremap <C-Right> <Esc>e
xnoremap <C-left> <Esc>b


" Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap <C-H> <Esc>dbi
nnoremap <C-H> db

" Tab keyboard shortcuts
map <silent><C-t> :tabnew<cr>
map <silent><C-w> :bd!<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Some local variables
let s:vimrc=has('nvim') ? '~/.config/nvim/init.vim' : '~/.vimrc'
let s:plugpath=has('nvim') ? '~/.config/nvim/autoload/plug.vim' : '~/.vim/autoload/plug.vim'
let s:plugurl='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Install vim-plug automatically on first start
if empty(glob(s:plugpath))
    execute 'silent !curl -fLo ' . s:plugpath . ' --create-dirs ' . s:plugurl
    autocmd VimEnter * PlugInstall --sync 
endif

function! s:Foo(info)
    call coc#add_extension("coc-json", "coc-python", "coc-cmake", "coc-marketplace", "coc-clangd", "coc-vimlsp")
endfunction

let FooRef = function('s:Foo')

" List of plugins
call plug#begin('~/.config/nvim/plugged')
	" File browser
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
	Plug 'vwxyutarooo/nerdtree-devicons-syntax', { 'on': 'NERDTreeToggle' }

	" Make vim look for .git to root the workspace
	Plug 'airblade/vim-rooter'

	" Theme
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

    " VSCode srtyle command pallette
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    " Multiple cursor
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " Dim inactive windows
    Plug 'https://github.com/blueyed/vim-diminactive.git'
    
    " Remember cursor position when editing a file
    Plug 'https://github.com/farmergreg/vim-lastplace'
    
    " Move lines around using alt+j/k
    Plug 'https://github.com/matze/vim-move.git'

    " Toggle Terminal
    Plug 'caenrique/nvim-toggle-terminal'

    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': FooRef }
call plug#end()



" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Focus on most used filetype for efficiency
let g:NERDTreeLimitedSyntax = 1

" Toggle file explorer using Ctrl+b
inoremap <C-b> <Esc>:NERDTreeToggle<cr>
vnoremap <C-b> <Esc>:NERDTreeToggle<cr>
nnoremap <C-b> :NERDTreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Editor color scheme
syntax on
set t_Co=256i
silent! colorscheme apprentice
set background=dark

" Status bar color scheme
let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Configure satus bar
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#ycm = 0
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'p'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" Configure tab bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command palette
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <C-P> <Esc>:FZF<cr>
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
 
  let height = float2nr(20)
  let width = float2nr(120)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
 
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
 
  call nvim_open_win(buf, v:true, opts)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrated Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl+j toggle terminal
nnoremap <silent> <C-j> :ToggleTerminal<cr>
inoremap <silent> <C-j> <Esc>:ToggleTerminal<cr>
tnoremap <silent> <C-j> <C-\><C-n>:ToggleTerminal<cr>
  
" esc to normal mode
" tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
set autowriteall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrl+space for code completion
inoremap <silent><expr> <c-space> coc#refresh()
map <F12> <Plug>(coc-definition)

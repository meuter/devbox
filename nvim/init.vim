"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" not in the 80's anymore
set nocompatible

" Set relative line number, gutter always visible
set number relativenumber signcolumn=yes

" Reload files when changed behind vim's back
set autoread

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

" When switching back to Normal mode from Insert mode
" prevent the cursor from moving to the left, grrr
inoremap <Esc> <Esc><Right>

" Split goes to the bottom and vsplit to the right
set splitbelow splitright

" Do not display current mode, will be done in status bar
set noshowmode laststatus=2

" Automatically reload vimrc, and refresh airline if installed
autocmd! BufWritePost init.vim,.vimrc source % | if exists(':AirlineRefresh') | execute 'AirlineRefresh' | endif

" Remap leader key
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text selection
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Select using shift + arrow, pageup/dn, home, insert
" nnoremap <s-right> v<right>
" xnoremap <s-right> <right>
" inoremap <s-right> <c-o>v<right>
" nnoremap <s-left> v<left>
" xnoremap <s-left> <left>
" inoremap <s-left> <c-o>v<left>
nnoremap <s-up> v<up>
" xnoremap <s-up> <up>
" inoremap <s-up> <c-o>v<up>
" nnoremap <s-down> v<down>
" xnoremap <s-down> <down>
" inoremap <s-down> <c-o>v<down>
" nnoremap <c-s-right> ve
" xnoremap <c-s-right> e
" inoremap <c-s-right> <c-o>ve
" nnoremap <c-s-left> vb
" xnoremap <c-s-left> b
" inoremap <c-s-left> <c-o>vb
" nnoremap <s-pageup> v10<up>
" xnoremap <s-pageup> 10<up>
" inoremap <s-pageup> <c-o>v10<up>
" nnoremap <s-pagedown> v10<down>
" xnoremap <s-pagedown> 10<down>
" inoremap <s-pagedown> <c-o>v10<down>
" nmap <s-home> v<home>
" nmap <s-end> v<end>
" nnoremap <c-s-home> vgg0
" nnoremap <c-s-end> vG<end>

" Exit VISUAL when shift not held.
" xnoremap <right> <esc><right>
" xnoremap <left> <esc><left>
" xnoremap <up> <esc><up>
" xnoremap <down> <esc><down>
" xnoremap <c-right> <esc>e
" xnoremap <c-left> <esc>b

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
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'

" setting the color scheme has to be delayed after plug#end()
function! SetColorScheme()
    syntax on
    set t_Co=256i
    silent! colorscheme seoul256
    set background=dark
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline - status/tab bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'https://github.com/vim-airline/vim-airline.git'

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
nmap <c-w>1 <Plug>AirlineSelectTab1
nmap <c-w>2 <Plug>AirlineSelectTab2
nmap <c-w>3 <Plug>AirlineSelectTab3
nmap <c-w>4 <Plug>AirlineSelectTab4
nmap <c-w>5 <Plug>AirlineSelectTab5
nmap <c-w>6 <Plug>AirlineSelectTab6
nmap <c-w>7 <Plug>AirlineSelectTab7
nmap <c-w>8 <Plug>AirlineSelectTab8
nmap <c-w>9 <Plug>AirlineSelectTab9
nmap <c-x> <Plug>AirlineSelectNextTab

" Select theme for airline
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
let g:airline_theme='bubblegum'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commenting out stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'https://github.com/tpope/vim-commentary.git'

" Toggle comment using ',c'
map <leader>c gcc

" Disable auto comment insertion on newline
autocmd FileType c setlocal commentstring=\/\/\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/ryanoasis/vim-devicons.git', { 'on': 'NERDTreeToggle' }

" Toggle file explorer using ',b'
map <leader>b :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Call git from vim
Plug 'https://github.com/tpope/vim-fugitive.git'
map <Leader>gd :Gvdiff<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gb :Gblame<cr>

" Have some + and ~ in the gutter to indicate changes in a file
Plug 'https://github.com/airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscelaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dim inactive windows
Plug 'https://github.com/blueyed/vim-diminactive.git'

" Remember cursor position when editing a file
Plug 'https://github.com/farmergreg/vim-lastplace'

" Move lines around using alt+j/k
Plug 'https://github.com/matze/vim-move.git'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unsorted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <C-c> :BD!<cr>
inoremap <silent> <C-c> <Esc>:BD!<cr>

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction







    " Fuzzy file search
    Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

    " Window managment
    Plug 'https://github.com/qpkorr/vim-bufkill.git'
    Plug 'https://github.com/troydm/zoomwintab.vim.git'

     " Global search
    Plug 'https://github.com/mileszs/ack.vim.git'
    Plug 'https://github.com/Valloric/ListToggle.git'
    Plug 'https://github.com/itchyny/vim-qfedit.git'

    " Multiple cursors
    Plug 'https://github.com/terryma/vim-multiple-cursors.git'

    " Language Support
    " Plug 'https://github.com/sheerun/vim-polyglot.git'
    " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    " Plug 'https://github.com/vim-syntastic/syntastic.git'
    " Plug 'https://github.com/Chiel92/vim-autoformat.git'
    " Plug 'https://github.com/ericcurtin/CurtineIncSw.vim'
    " Plug 'https://github.com/xolox/vim-misc'
    " Plug 'https://github.com/xolox/vim-easytags.git'
    " Plug 'https://github.com/majutsushi/tagbar.git'

call plug#end()

call SetColorScheme()

" Use the silver searcher for grep
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ctrl+p for fuzzy search ('r' means start at the .git)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" ',n' to navigate using tagbar
map <silent> <leader>n :TagbarOpenAutoClose<cr>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:easytags_async = 1

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

" ',f' to autformat code
map <leader>f :Autoformat<cr>

" ',tr' to trim whitespace
map <leader>tr g_ld$

" ',tra' to trim whitespace in all file
map <leader>tra :%norm! g_ld$<cr>

" ',o' switch between .h and .c/cpp
map <leader>o :call CurtineIncSw()<cr>

" turn on highlight of the current line
set cursorline

" terminal starts in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

if has('nvim')
    " terminal closes automatically when exit
    autocmd TermClose term://* :q!

    " disable line number in terminal mode
    autocmd TermOpen term://* startinsert | setlocal nonumber norelativenumber signcolumn=no
endif

" esc configure to switch to normal mode (for copy paste, etc...)
tnoremap <Esc> <C-\><C-n>

" auto escape to terminal mode when switching to another split
tnoremap <C-w><Up> <C-\><C-n><C-w><Up>
tnoremap <C-w><Down> <C-\><C-n><C-w><Down>
tnoremap <C-w><Left> <C-\><C-n><C-w><Left>
tnoremap <C-w><Right> <C-\><C-n><C-w><Right>

" Use ctrl+kj to just 5 lines at a time
nnoremap <C-k> 15k
nnoremap <C-j> 15j
vnoremap <C-k> 15k
vnoremap <C-j> 15j

" Highlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" configure YouCompleteMe
set completeopt=menuone,preview,noinsert
let g:ycm_global_ycm_extra_conf = '~/.devbox/nvim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1P
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_semantic_triggers = {
	\   'python': [ 're!\w{2}' ],
	\   'c': [ 're!\w{2}' ]
	\ }


" enter to confirm completion
function! ConfirmCompletion()
    if pumvisible()
        if !empty(v:completed_item)
            return "\<esc>a"
        else
            return "\<c-n>\<esc>a"
        endif
    else
        return "\<cr>"
    endif
endf
inoremap <expr> <cr> ConfirmCompletion()

" configure completion pop
set pumheight=10
highlight Pmenu ctermbg=white

" Goto definition with <leader>j
nnoremap <silent> <leader>j :YcmCompleter GoTo<CR>
inoremap <silent> <leader>j <Esc>:YcmCompleter GoTo<CR>
vnoremap <silent> <leader>j <Esc>:YcmCompleter Goto<CR>

" Configure Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" confirugre global search using Ack
function! GlobalSearch()
    let g:global_search_query = input('Search: ')
    exec ':Ack ' . '"' . g:global_search_query . '"'
endfunction

inoremap <C-S-F> :call GlobalSearch()<cr>
nnoremap <C-S-F> <Esc>:call GlobalSearch()<cr>

function! GlobalReplace()
    if !exists("g:global_search_query")
        call GlobalSearch()
    endif
    let g:global_replace_term = input('Replace by: ')
    exec ':cfdo %s/' . g:global_search_query . '/' . g:global_replace_term . '/gc | update'
    unlet g:global_search_query
    unlet g:global_replace_term
    exec ':QToggle'
endfunction

inoremap <C-S-H> :call GlobalReplace()<cr>
nnoremap <C-S-H> <Esc>:call GlobalReplace()<cr>

" disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


map <c-t> :tabnew<cr>






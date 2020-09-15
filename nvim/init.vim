"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some sensible defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab smarttab shiftwidth=4 tabstop=4         " tabs expand to 4 spaces
set number signcolumn=yes cursorline                  " line numbers and highlight currentline
set autoread nobackup nowb noswapfile                 " auto reload and avoid backups
set hlsearch ignorecase smartcase incsearch wrapscan  " improved inline search
set nowrap                                            " don't wrap lines
set hidden                                            " hide buffer when switching
set mouse=a                                           " mouse integration
set updatetime=300                                    " improve responsiveness
set pastetoggle=<F2>                                  " toggle paste mode using <F2>

" Esc-Esc to remove highlight
nnoremap <esc><esc> :silent! nohls<cr>

" Keeps tabls for Makefile
filetype plugin indent on
autocmd FileType make setlocal noexpandtab

" Ctrl+Q to close buffer
nnoremap <silent> <C-Q> :bd<CR> 
inoremap <silent> <C-Q> <C-\><C-N>:bd<CR>
vnoremap <silent> <C-Q> <C-\><C-N>:bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:list_of_plugs = []
let s:vimconfig = has('nvim') ? '~/.config/nvim/' : '~/.vim/'
let s:vimrc     = has('nvim') ? s:vimconfig . 'init.vim' : '~/.vimrc'
let s:plugged   = s:vimconfig . 'plugged'

function! s:BootstrapPlugs()
    let l:plugpath  = s:vimconfig . 'autoload/plug.vim'
    let l:plugurl   = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    " install vim-plug if necessary
    if empty(glob(l:plugpath))
        execute 'silent !curl -fLo ' . l:plugpath . ' --create-dirs ' . l:plugurl
    endif

    " load all of the listed plugin
    call plug#begin(s:plugged)
    for p in s:list_of_plugs
        if len(p) == 1
            Plug p[0]
        endif
        if len(p) == 2
            Plug p[0], p[1]
        endif
    endfor
    call plug#end()

    " auto install on startup if missing plugin
    if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
        autocmd VimEnter * PlugInstall --sync | q | exec 'source ' . s:vimrc
    endif
    
    " trigger the 'init' hook
    for p in s:list_of_plugs
        if len(p) == 2 && has_key(p[1], 'init')
            execute 'silent! ' . get(p[1], 'init')
        endif
    endfor
endfunction

function! s:AddPlug(...)
    let s:list_of_plugs = add(s:list_of_plugs, a:000)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:AddPlug('tomasiser/vim-code-dark', { 'init': 'colorscheme codedark'})
call s:AddPlug('vim-airline/vim-airline', { 'init' : ':AirlineRefresh' })

" Editor color scheme
syntax on
set t_Co=256i
set background=dark

" Do not display current mode, will be done in status bar
set noshowmode laststatus=2

" Status bar color scheme
let g:airline_theme='codedark'

" Initialize the global config
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Config for the status bar
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = '(paste)'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" Config for the tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:AddPlug('preservim/nerdtree')
call s:AddPlug('ryanoasis/vim-devicons')
call s:AddPlug('vwxyutarooo/nerdtree-devicons-syntax')

" Focus on most used filetype for efficiency
let g:NERDTreeLimitedSyntax = 1

" Automatically close NT when file is opened
let NERDTreeQuitOnOpen=1

" Toggle file explorer using Ctrl+b
inoremap <silent> <C-b> <C-\><C-n>:NERDTreeToggle<cr>
vnoremap <silent> <C-b> <C-\><C-n>:NERDTreeToggle<cr>
tnoremap <silent> <C-b> <C-\><C-n>:NERDTreeToggle<cr>
nnoremap <silent> <C-b> :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Embedded Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:AddPlug('kassio/neoterm')

let g:neoterm_default_mod="botright"
let g:neoterm_autoinsert=1

set autochdir

nnoremap <silent> <C-J> :Ttoggle<CR>cd -<CR>
inoremap <silent> <C-J> <C-\><C-N>:Ttoggle<CR>
vnoremap <silent> <C-J> <C-\><C-N>:Ttoggle<CR>
tnoremap <silent> <C-J> <C-\><C-N>:Ttoggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Embedded Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:AddPlug('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' })
call s:AddPlug('junegunn/fzf.vim')

" Use a floating pane at the top like in VSCode
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(20)
    let width = float2nr(120)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 1

    let opts = { 
        \ 'relative': 'editor', 'row': vertical,
        \ 'col': horizontal, 'width': width,
        \ 'height': height, 'style': 'minimal' }

    call nvim_open_win(buf, v:true, opts)
endfunction

" Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

command! -bang Commits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)

nnoremap <silent> <C-P> :Files<cr>
inoremap <silent> <C-P> <Esc>:Files<CR>
vnoremap <silent> <C-P> <Esc>:Files<CR>

nnoremap <silent> <C-A-P> :Commands<CR>
inoremap <silent> <C-A-P> <Esc>:Commands<CR>
vnoremap <silent> <C-A-P> <Esc>:Commands<CR>

nnoremap <silent> <C-Space> :Buffers<CR>
vnoremap <silent> <C-Space> <Esc>:Buffers<CR>
inoremap <silent> <C-Space> <Esc>:Buffers<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Completion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:AddPlug('neoclide/coc.nvim', {'branch': 'release', 'do': ':CocUpdateSync' })

" list extensions
let g:coc_global_extensions = [
    \ 'coc-json', 'coc-python', 
    \ 'coc-cmake', 'coc-clangd', 
    \ 'coc-vimlsp', 'coc-marketplace'
    \ ]

" ctrl+space for code completion
inoremap <silent><expr> <c-space> coc#refresh()

" F12 to go to definition
map <silent> <F12> <Plug>(coc-definition)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:AddPlug('tpope/vim-fugitive')
call s:AddPlug('mhinz/vim-signify')

" ctrl+n to toggle the git status window
nnoremap <silent><C-G> :botright Git<CR>
autocmd FileType fugitive nmap <silent><buffer> <C-G> :q<CR>

" 'cc' to commit in git view
autocmd FileType fugitive nmap <silent><buffer> cc :q<bar>:botright Git commit --quiet<CR>

" ctrp+p automatically quits git view
autocmd Filetype fugitive nmap <silent><buffer> <C-P> :q<bar><CR><C-P>

" ctrp+p automatically escapes commit view
autocmd Filetype fugitive nmap <silent><buffer> <C-A-P> :q<bar><CR><C-A-P>

" use = to toggle fold in git commit view
autocmd Filetype git nmap <silent><buffer> = za

" gutter symbol when character changes
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscelaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl+shift+/ to toggle comments
call s:AddPlug('tpope/vim-commentary')
vmap <C-_> gcc<Esc><Esc>
nmap <C-_> gcc<Esc><Esc>
imap <C-_> <C-\><C-N>gcc<Esc><Esc>i

" multiple cursor with ctrl+n/x/p
call s:AddPlug('terryma/vim-multiple-cursors')

" move lines with alt+j/k
call s:AddPlug('matze/vim-move')

" automatically cd into the .git folder
call s:AddPlug('airblade/vim-rooter')

" Remember cursor position when editing a file
call s:AddPlug('https://github.com/farmergreg/vim-lastplace')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bootstrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call s:BootstrapPlugs()

"Settings set termguicolors
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set splitbelow          " Horizontal split below current.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
inoremap ii <Esc>       " Quickly escape insert mode.
filetype on
" Python compiler
" autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>

" Move lines with alt J and K
let mapleader = "\<Space>"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Tab navigation
nnoremap <silent> <leader>j :tabp<CR>
nnoremap <silent> <leader>k :tabn<CR>
nnoremap <silent> <leader>t :tabnew<CR>

" Split navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" NERDTree binds
map <leader>n :NERDTreeToggle<CR>

" Easymotion binds
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Plugins Start Here
call plug#begin('~/.config/nvim/bundle')

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax & autocomplete stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'zchee/deoplete-jedi'
Plug 'mileszs/ack.vim'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
" The cs one
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/NERDTree'
" Plug 'spf13/vim-autoclose'
" Better tab completion
Plug 'ervandew/supertab'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Instant markdown preview
Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'
" Purely for looks
Plug 'junegunn/goyo.vim'
call plug#end()

"syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:javascript_plugin_jsdoc = 1
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']
"deoplete
let g:deoplete#enable_at_startup = 1

"Ack
cnoreabbrev Ack Ack!

let g:loaded_python_provider = 1
colorscheme CandyPaper

" Supposed to make leaving insert mode faster
set ttimeoutlen=50

" Show by default
set laststatus=2


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Use powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'

" Show tabline
let g:airline#extensions#tabline#enabled = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Syntastic integration airline
let g:airline#extensions#syntastic#enabled = 1

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

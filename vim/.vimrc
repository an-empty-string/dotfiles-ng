set nocompatible
set wildmenu
set nowrap
set autoindent
set copyindent
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set smarttab
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set number
set relativenumber
set ruler
set hidden
set expandtab
set exrc
set secure
set splitbelow

syntax on
filetype plugin indent on

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>w :set wrap!<CR>
nmap <silent> <leader>h :noh<CR>

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>
set mouse=a

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    set number!
    set relativenumber!

    if &mouse == ""
        let &mouse = s:old_mouse
    else
        let s:old_mouse = &mouse
        let &mouse = ""
    endif
endfunction

au FocusLost * :set relativenumber!
au FocusGained * :set relativenumber!
autocmd InsertEnter * :set relativenumber!
autocmd InsertLeave * :set relativenumber

nmap <silent> <F12> :call <SID>ToggleMouse()<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap Q <nop>

let g:localvimrc_whitelist = ".*"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:ctrlp_map = "<c-p>"
set laststatus=2

set background=dark
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set t_Co=256
let g:airline_powerline_fonts = 1
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Syntastic'
Plugin 'Mustang2'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tpope/vim-speeddating'
Plugin 'mattn/calendar-vim'
Plugin 'vim-scripts/utl.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'jreybert/vimagit'
Plugin 'jamessan/vim-gnupg'

call vundle#end()
filetype plugin indent on

colorscheme Mustang

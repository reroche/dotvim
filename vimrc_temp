" ================
" rer's vim config
" ================

" ---------------- ArchLabs default

runtime! archlinux.vim

" enable mouse.. sgr is better but not every term supports it
set mouse=a
if has('mouse_sgr')
    set ttymouse=sgr
endif

" syntax highlighting with true colors in the terminal
syntax enable
if has('termguicolors') && $DISPLAY !=? ''
    set termguicolors
endif

" paste while in insert mode
inoremap <silent><C-v> <Esc>:set paste<CR>a<C-r>+<Esc>:set nopaste<CR>a

" alt defaults
nnoremap 0 ^
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> ==j

" j=gj k=gk but preserve numbered jumps ie. 12j or 30k
nnoremap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nnoremap <buffer><silent><expr>k v:count ? 'k' : 'gk'

" Reload changes if file changed outside of vim (requires autoread)
augroup load_changed_file
    autocmd!
    autocmd FocusGained,BufEnter * if mode() !=? 'c' | checktime | endif
    autocmd FileChangedShellPost * echo "Changes loaded from file"
augroup END

" when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" ---------------- Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" ---------------- General Settings

" set modeline
set clipboard^=unnamedplus  " system clipboard (requires +clipboard)
set number                  " enable line numbers
set relativenumber          " enables relative line numbers
set confirm                 " ask confirmation for some things, like save before quit, etc.
set wildmenu                " Tab completion menu when using command mode
set expandtab               " Tab key inserts spaces not tabs
set shortmess+=aAcIws       " Hide or shorten certain messages
set background=dark
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set showmatch
set ruler
set scrolloff=7
set cursorline

" ---------------- Cursor Settings
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

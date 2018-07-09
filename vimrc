"                 _             _
"   _ __ ___ _ __( )___  __   _(_)_ __ ___  _ __ ___
"  | '__/ _ | '__|// __| \ \ / | | '_ ` _ \| '__/ __|
"  | | |  __| |    \__ \  \ V /| | | | | | | | | (__
"  |_|  \___|_|    |___/   \_/ |_|_| |_| |_|_|  \___|

" ===================================================
" Pathogen
" ===================================================

execute pathogen#infect()
syntax on
filetype plugin indent on

" ===================================================
" General Settings
" ===================================================

" runtime! archlinux.vim

" enable mouse.. sgr is better but not every term supports it
set mouse=a
if has('mouse_sgr')
    set ttymouse=sgr
endif

" color options
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" paste while in insert mode
inoremap <silent><C-v> <Esc>:set paste<CR>a<C-r>+<Esc>:set nopaste<CR>a

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

set encoding=UTF-8
set modeline
set clipboard^=unnamedplus  " system clipboard (requires +clipboard)
set number                  " enable line numbers
set relativenumber          " enables relative line numbers
set confirm                 " ask confirmation for some things, eg. save before quit
set wildmenu                " Tab completion menu when using command mode
set expandtab               " Tab key inserts spaces not tabs
set shortmess+=aAcIws       " Hide or shorten certain messages
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set showmatch
set ruler
set scrolloff=6
set cursorline
set timeoutlen=500 ttimeoutlen=10
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately

" strip whitespace
autocmd BufWritePre * :%s/\s\+$//e

" colorscheme
colorscheme onedark

" Cursor Line
hi CursorLine guibg=#33373f guifg=NONE
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine guibg=#2E4051 guifg=NONE
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine guibg=#33373f guifg=NONE

" Cursor Settings
" Block for Normal, Line for Insert, Underline for Replace
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ===================================================
" Key Mappings
" ===================================================

let mapleader=','

" For long lines:
nnoremap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nnoremap <buffer><silent><expr>k v:count ? 'k' : 'gk'

vnoremap jk <esc>
inoremap jk <esc>
nnoremap <leader>q :q<CR>
nnoremap U <C-r>
nnoremap <leader>/ :noh<CR>
" nnoremap <Space> i*<Esc>r

" ===================================================
" Airline
" ===================================================

" Always show statusbar
set laststatus=2
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'NORMAL',
      \ 'i'  : 'INSERT',
      \ 'R'  : 'REPLACE',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ ''   : 'S'}

" tmuxline
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'c'    : '%Y-%m-%d | %a | %R',
"       \'win'  : ['#I','#W'],
"       \'cwin' : ['#I','#W'],
"       \'w'    : '#(echo "Hi")',
"       \'y'    : '#(~/.vim/battery_indicator.sh)',
"       \'x'    : '#(~/.vim/spotify.sh)',
"       \'z'    : '#h'}

" ===================================================
" FZF
" ===================================================

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ===================================================
" Emmet
" ===================================================

" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ===================================================
" Asynchronous Lint Engine (ALE)
" ===================================================

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" ===================================================
" Goyo + Limelight
" ===================================================

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ===================================================
" JavaScript
" ===================================================

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


" ===================================================
" NERDTree
" ===================================================

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent><leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ===================================================
" bullets.vim
" ===================================================

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" ===================================================
" vimwiki
" ===================================================



" ================
" rer's vim config
" ================

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
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
set modeline
set clipboard^=unnamedplus  " system clipboard (requires +clipboard)
set number                  " enable line numbers
set relativenumber          " enables relative line numbers
" set confirm                 " ask confirmation for some things, eg. save before quit
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

" ---------------- Cursor Settings
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ---------------- Airline
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
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ ''   : 'S'}

" ---------------- Tmuxline
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'c'    : '%Y-%m-%d | %a | %R',
"       \'win'  : ['#I','#W'],
"       \'cwin' : ['#I','#W'],
"       \'w'    : '#(echo "Hi")',
"       \'y'    : '#(~/.vim/battery_indicator.sh)',
"       \'x'    : '#(~/.vim/spotify.sh)',
"       \'z'    : '#h'}

" ---------------- Emmet
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ---------------- ALE
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" ---------------- JavaScript
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

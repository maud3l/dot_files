" .vimrc

"""General
set encoding=utf-8 " The encoding displayed
set fileencoding=utf-8 " The encoding written to file
syntax on " Enable syntax highlight
let mapleader=","
"set ttyfat " Faster redrawing
set lazyredraw " Only redraw when necessary
set cursorline " Find the current line quickly
set ruler
set nocompatible
set ignorecase
set showmatch
set splitright
set guicursor=
set laststatus=2
set updatetime=100
set backup
set backupdir=$HOME/.vim/backupfiles
set undodir=$HOME/.vim/undofiles
set undofile
set hlsearch
set fileformat=unix
au CursorHold * checktime

" Automatically delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"Treat end of lines like normal IDE
"-------------------------------------
set virtualedit=all
set sel=exclusive

" fix strange character when exiting vim
" https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""
let &t_TE = ""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

"""Keymappings

"don't use arrowkeys
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>

"save with WW
nnoremap WW :w<cr>

"force quit with QQ
nnoremap QQ :q!<cr>

"save and force quit with WQ
nnoremap WQ :wq!<cr>

" use jj as esc
inoremap jj <Esc>
inoremap jk <Esc>

" use ENTER to insert new mode in normal mode
nnoremap <CR> o<ESC>

" use SPACE to insert space in normal mode
nnoremap <space> i<space><esc>

"autoclose tags
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>


" copy and paste to/from vim and the clipboard
nnoremap <C-y> "+yy
vnoremap <C-y> "+yy
nnoremap <C-p> "+p
vnoremap <C-p> "+p


" the following key binding lets you move lines up and down with Shift+arrow
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>
inoremap <C-Up> <Esc>:CR>

nnoremap tl   :tabnext<CR>
nnoremap th   :tabprev<CR>
nnoremap tk   :tablast<CR>
nnoremap tt   :tabedit <cfile><CR>
nnoremap tn   :tabnext<Space>
nnoremap tm   :tabm<Space>
nnoremap td   :tabclose<CR>
nnoremap tN   :tabnew<CR>

" git fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>

" vimgrep
nmap <leader>fg :vimgrep
nmap <leader>fn :cnext<cr>
nmap <leader>fp :cprevious<cr>

" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


" Markdown preview
nmap <leader>mk :LivedownToggle<CR>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" Remove highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Visual related configs
" 256 colors
set t_Co=256

set number
"set relativenumber

" show the status line all the time
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Indentation

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent, copy the intendation from the previous line when starting a new
" line
set ai
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Utils

":W sudo saves the file (handle the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins management

call plug#begin()
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
endif


Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'unblevable/quick-scope'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/space-vim-dark'
Plug 'shime/vim-livedown'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'vim-airline/vim-airline-themes'
Plug 'mtth/scratch.vim'

call plug#end()

set background=dark
"colorscheme hybrid_reverse
colorscheme space-vim-dark
color space-vim-dark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_pop'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=docs --exclude=.venv'
let g:syntastic_c_compiler_options = "-std=gnu11 -g -Wall -Wextra -fPIC -I /usr/include -Isrc/ -Isrc/include/"
let g:gitgutter_terminal_reports_focus=0

" Coc
"-------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-pyright',
  \ 'coc-go',
  \ ]
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport') " use `:OR` for organize import of current buffer
"autocmd BufWritePre *.go :OR

"Ale

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

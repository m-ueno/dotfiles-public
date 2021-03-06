set nocompatible

call plug#begin('~/.vim/plugged')
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
"Plug 'Gist.vim'
"Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/ShowMarks7'
Plug 'vim-scripts/The-NERD-Commenter'
Plug 'vim-scripts/buftabs'
Plug 'vim-scripts/emacscommandline'
"Plug 'fugitive.vim'
"Plug 'git-cheat'
Plug 'kannokanno/previm'
let g:previm_open_cmd = 'w3m'

Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/matchit.zip'
"Plug 'neocomplcache'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/nginx.vim'
Plug 'ngmy/vim-rubocop'
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1  "enable automatic running of :RustFmt when you save a buffer

"Plug 'scrooloose/syntastic'
"Plug 'surround.vim'
"Plug 'quickrun.vim'
"Plug 'Shougo/unite.vim'
"Plug 'unite-colorscheme'
"Plug 'Shougo/vimfiler'
"Plug 'Shougo/vimproc.vim'

Plug 'haya14busa/incsearch.vim'
Plug 'glidenote/memolist.vim'
Plug 'tell-k/vim-autopep8'
Plug 'vim-scripts/vim-flake8'

Plug 'junegunn/vim-easy-align'

" https://github.com/vim-tw/vim-tips
Plug 'elzr/vim-json'
Plug 'chrisbra/csv.vim'

Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never' " linters only when I save files
let g:ale_lint_on_enter = 0              " don't want linters to run on opening a file

let g:loaded_matchparen = 1
Plug 'itchyny/vim-parenmatch'
Plug 'itchyny/vim-cursorword'

let g:showmarks_include="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

Plug 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:auto_save_no_updatetime = 200  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0

Plug 'ctrlpvim/ctrlp.vim'
nnoremap s <Nop>
nnoremap sa :<C-u>CtrlP<Space>
nnoremap sb :<C-u>CtrlPBuffer<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap sf :<C-u>CtrlP<CR>
nnoremap sl :<C-u>CtrlPLine<CR>
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
nnoremap sq :<C-u>CtrlPQuickfix<CR>
nnoremap ss :<C-u>CtrlPMixed<CR>
nnoremap st :<C-u>CtrlPTag<CR>
let g:ctrlp_map = '<Nop>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_migemo = 0
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

if executable('go')
  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'fatih/vim-go'
  Plug 'nsf/gocode', {'rtp': 'nvim/'}
endif

if executable('elixir')
  Plug 'elixir-editors/vim-elixir'
endif

Plug 'scrooloose/nerdtree'
map <F6> :NERDTreeToggle<CR>
Plug 'majutsushi/tagbar'
map <F7> :TagbarToggle<CR>

" Colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
let g:molokai_original = 1

call plug#end()


filetype plugin indent on

" set autochdir
set autoindent    " always set autoindenting on
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set completeopt=menu   " default: preview,menuone
set copyindent    " copy the previous indentation on autoindenting
set expandtab
set hidden
set hlsearch      " highlight search terms
set ignorecase    " ignore case when searching
set incsearch     " show search matches as you type
set list listchars=tab:>-,trail:_
set nowrap        " don't wrap lines
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2  " number of spaces to use for autoindenting
set showmatch     " set show matching parenthesis
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
"set smartindent  " smart indent was replaced by cindent. just use filetype indent on
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2     " a tab is two spaces
set undofile
set undodir=/home/masaru/.vimundo/
set wrap

" itchyny
set laststatus=2
set t_Co=256

set history=1000         " remember more commands and search history
set noerrorbells         " don't beep
set pastetoggle=<F2>
set title                " change the terminal's title
set undolevels=1000      " use many muchos levels of undo
set visualbell           " don't beep
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmode=longest,list,full

" Use git!
set nobackup
set noswapfile

" Look and Feel
syntax on
set background=dark

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

" highlight CursorLine guibg=lightblue ctermbg=DarkGray

" F5: command history
" F6: search history
" nnoremap <F5> <Esc>q:
" nnoremap <F6> <Esc>q/
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>
nnoremap qq <Nop>

" nnoremap q <NUL>

"移動は表示行で
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" http://vinarian.blogspot.com (Shougo)
noremap <C-p> :bprevious<CR>
noremap <C-n> :bnext<CR>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
nnoremap <C-w><C-]> <C-w>g<C-]>

" Plugin
noremap <silent> <F3> :call BufferList()<CR>
"" Unite.vim

let g:unite_enable_start_insert=1
"noremap <C-S-P> :Unite buffer<CR>
" ファイル一覧
"noremap <C-S-N> :Unite -buffer-name=file file<CR>
" recent file
noremap <C-S-Z> :Unite file_mru<CR>
noremap <silent> <F4> :Unite buffer<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

if !exists(":W")
    command W w !sudo tee % >/dev/null
endif

" Execute python script C-P
"function! s:ExecPy()
"    exe "!" . &ft . " %"
":endfunction
"command! Exec call <SID>ExecPy()
"autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

inoremap <F10> <code></code> <Esc>2F>a
inoremap <F4> import code; code.interact(local=dict(globals(), **locals()))<Esc>

""" http://nvie.com/posts/how-i-boosted-my-vim
" change the mapleader from \ to ,
let mapleader=","
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" 文字コードの自動認識
" from ずんWiki http://www.kawaz.jp/pukiwiki/?vim#content_1_7
set encoding=utf-8
set fileencoding=utf-8
if &encoding !=# 'utf-8' " utf-8をデフォルトに
    set encoding=japan
    set fileencoding=japan
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac

"" 2.ファイル操作を改善する
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" 4.作業効率を改善する
nnoremap <ESC><ESC> :nohlsearch<CR>

" itchyny/lightline
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

" itchyny/calendar
let g:calendar_google_calendar = 1

au BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
autocmd BufNewFile *.html 0r $HOME/.vim/template/template.html

" Statusline
"" Syntastic recommended settings

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": ["ruby"],
            \ "passive_filetypes": [] }

"" Syntastic customs
let g:syntastic_enable_signs=1
"let g:syntastic_python_python_exec = 'python3'

let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']

let g:syntastic_ruby_checkers = ['rubocop']

"" python
let g:flake8_show_in_gutter = 1
let g:flake8_show_in_file = 1
let g:flake8_ignore="E501,W293"

" `K` to view help
augroup set_kp_help
    autocmd FileType vim setlocal keywordprg=:help
augroup END

" incsearch.vim: incrementally highlights ALL pattern matches
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
nmap n  <Plug>(incsearch-nohl-n)
nmap N  <Plug>(incsearch-nohl-N)
nmap *  <Plug>(incsearch-nohl-*)

" NERDCommenter : コメント挿入削除トグル
"" トグル : <Leader>c<Space>
"" 末尾に挿入: <Leader>cA

"" /**/ ではなく /*  */ にする
let NERDSpaceDelims = 1
"" 警告の抑制
let NERDShutUp = 1

nmap #  <Plug>(incsearch-nohl-#)
nmap g* <Plug>(incsearch-nohl-g*)
nmap g# <Plug>(incsearch-nohl-g#)

" memoist: 日付＋タイトルのメモファイルを作成
let g:memolist_path = "~/Dropbox/Documents/memo"
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

" colorscheme

if has("mac")
    colorscheme elflord
elseif has("unix")
    " unix (linux?)
    " colorscheme elflord
    " colorscheme jellybeans
    colorscheme hybrid
    highlight Normal ctermbg=none  " transparent background
    highlight LineNr ctermfg=DarkGray ctermbg=none
elseif has("win64")
    " 64bit_windows
elseif has("win32unix")
    " Cygwin
elseif has("win32")
    " 32bit_windows
endif

if filereadable(expand($HOME.'/.local/.vimrc'))
  source $HOME/.local/.vimrc
endif


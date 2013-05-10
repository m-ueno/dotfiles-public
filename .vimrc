set nocompatible
>
if version >= 700 " version 7.00 or upper
    """ vundle
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " My Bundles here:
    Bundle 'gmarik/vundle'

    Bundle 'Gist.vim'
"    Bundle 'Indent-Guides'
    Bundle 'ShowMarks7'
    Bundle 'The-NERD-Commenter'
    Bundle 'buftabs'
    Bundle 'emacscommandline'
    Bundle 'fugitive.vim'
    Bundle 'git-cheat'
    Bundle 'matchit.zip'
    Bundle 'neocomplcache'
    Bundle 'surround.vim'
    Bundle 'unite-colorscheme'
    Bundle 'unite.vim'
    Bundle 'quickrun.vim'

    Bundle 'Shougo/vimfiler'

    " load settings of plugins which is hundled by vundle
    for f in split(glob('~/.vimfiles/*.vim'), '\n')
        exe 'source' f
    endfor

    let g:showmarks_include="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_color_change_percent = 30
    let g:indent_guides_start_level = 2

endif

filetype plugin indent on     " required!

set autochdir
set autoindent    " always set autoindenting on
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on autoindenting
set cursorline
set expandtab
set hidden
set hlsearch      " highlight search terms
set ignorecase    " ignore case when searching
set incsearch     " show search matches as you type
set list listchars=tab:>-,trail:_
set nowrap        " don't wrap lines
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4  " number of spaces to use for autoindenting
set showmatch     " set show matching parenthesis
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
"set smartindent  " smart indent was replaced by cindent. just use filetype indent on
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=4     " a tab is four spaces
set wrap

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
colorscheme elflord
highlight CursorLine guibg=lightblue ctermbg=DarkGray

" F5: command history
" F6: search history
nnoremap <F5> <Esc>q:
nnoremap <F6> <Esc>q/
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

nnoremap q <NUL>

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

if !exists("W") " doesn't work
    command W w !sudo tee % >/dev/null
endif

" Execute python script C-P 
"function! s:ExecPy()
"    exe "!" . &ft . " %"
":endfunction
"command! Exec call <SID>ExecPy()
"autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

inoremap <F10> <code></code> <Esc>2F>a

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
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("¥x87¥x64¥x87¥x6a", 'cp932', 'eucjp-ms') ==# "¥xad¥xc5¥xad¥xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
        " iconvがJISX0213に対応しているかをチェック
    elseif iconv("¥x87¥x64¥x87¥x6a", 'cp932', 'euc-jisx0213') ==# "¥xad¥xc5¥xad¥xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^¥(euc-jp¥|euc-jisx0213¥|eucjp-ms¥)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    let &fileencodings = 'utf-8' . ',' . &fileencodings " XXX: adhocな対応
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^¥x01-¥x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif

"" 2.ファイル操作を改善する
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" 4.作業効率を改善する
nnoremap <ESC><ESC> :nohlsearch<CR>

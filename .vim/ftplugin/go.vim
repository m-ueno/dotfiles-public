setlocal nolist

" vim-go
"" syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"
"" By default vim-go shows errors for the fmt command, to disable it:
let g:go_fmt_fail_silently = 1
"" Disable auto fmt on save:
let g:go_fmt_autosave = 1
"" Disable opening browser after posting your snippet to play.golang.org:
let g:go_play_open_browser = 0

nnoremap <silent> <leader>gb :GoBuild<CR>
nnoremap <silent> <leader>gd :GoDef<CR>
nnoremap <silent> <leader>gf :GoFmt<CR>
nnoremap <silent> <leader>gi :GoImport<CR>
nnoremap <silent> <leader>gl :GoLint<CR>
nnoremap <silent> <leader>gr :GoRun<CR>
nnoremap <silent> <leader>gt :GoTest<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

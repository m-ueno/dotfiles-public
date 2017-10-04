setlocal nolist

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

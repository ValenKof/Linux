"Valentin Kofman (kvmisis@gmail.com)"
set tabstop=2
set shiftwidth=2
set expandtab
set ai

"enable line number"
set number

"enable syntax highlight"
syntax on

"backspace works correctly"
set backspace=indent,eol,start

"don't indent namespaces"
set cino=N-s
set cinoptions+=L0
set cinoptions+=g0
set cin

"highlight searched words"
set hlsearch

"enable mouse navigation"
set mouse=a

"completion"
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>C-n>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>C-n>" : ""<CR>'

"insert real tab"
inoremap <S-Tab> <C-V><Tab>

highlight OverLength ctermbg=red ctermfg=white guibg=#59292
match OverLength /\%101v.*/

highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=#59292
2match ExtraWhitespace /\s\+$/

hi Comment ctermfg=cyan
hi LineNr ctermfg=brown
hi Constant ctermfg=red
hi PreProc ctermfg=magenta
hi Type ctermfg=green
hi Statement ctermfg=brown

"build and run"
autocmd filetype cpp nnoremap <S-b> :!~/scripts/build.sh <CR>
autocmd filetype cpp nnoremap <S-r> :!~/scripts/run.sh <CR>

"comment selected lines"
vmap //
\ :set hlsearch! hlsearch?<CR>
\ :s:^://<CR>
\ :set hlsearch! hlsearch?<CR>

"comment/uncomment selected word"
nnoremap //
\ :set hlsearch! hlsearch?<CR>
\ :s:\<<C-r><C-w>\>:/*&*/<CR>
\ :silent! s:/\*/\*:<CR>
\ :silent! s:\*/\*/:<CR>
\ :set hlsearch! hlsearch?<CR>

"swap between .h and .cpp"
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

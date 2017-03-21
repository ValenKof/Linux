"Valentin Kofman (kvmisis@gmail.com)"

"Modern C++ syntax highlight: https://github.com/vim-jp/vim-cpp"

"Vundle git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
set ai

"show line & column numbers"
set ruler

"enable line number"
set number

"enable syntax highlight"
syntax on

"backspace works correctly"
set backspace=indent,eol,start

"c++ indent"
set cin
set cino=N-s,g0,+2s,l-s,m1

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

"long lines coloring"
highlight OverLength ctermbg=red ctermfg=white
1match OverLength /\%101v.*/

"trailing whitespaces coloring"
highlight ExtraWhitespace ctermbg=red ctermfg=white
2match ExtraWhitespace /\s\+$/

"completion coloring"
highlight Pmenu ctermfg=white ctermbg=magenta

"selected completion coloring"
highlight PmenuSel ctermfg=magenta ctermbg=black

hi Comment ctermfg=cyan
hi LineNr ctermfg=brown
hi Constant ctermfg=red
hi PreProc ctermfg=magenta
hi Type ctermfg=green
hi Statement ctermfg=brown

"(cpp) build"
autocmd filetype cpp nnoremap <S-b>
\ :!~/scripts/build.sh<CR>

"(cpp) run"
autocmd filetype cpp nnoremap <S-r>
\ :!~/scripts/run.sh <CR>

"(cpp) comment selected lines"
autocmd filetype cpp vmap //
\ :s:^://<CR>
\ :nohlsearch<CR>

"(cpp) comment/uncomment word under cursor"
autocmd filetype cpp nnoremap //
\ :set hlsearch! hlsearch?<CR>
\ :s:\<<C-r><C-w>\>:/*&*/<CR>
\ :silent! s:/\*/\*:<CR>
\ :silent! s:\*/\*/:<CR>
\ :set hlsearch! hlsearch?<CR>

"(cpp) swap between .h and .cpp"
autocmd filetype cpp map <F4>
\ :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"(python) comment selected lines"
autocmd filetype python vmap //
\ :s:^:#<CR>
\ :nohlsearch<CR>

"(python) comment/uncomment word under cursor"
autocmd filetype python nnoremap //
\ :set hlsearch! hlsearch?<CR>
\ :s:\<<C-r><C-w>\>:'''&'''<CR>
\ :silent! s:'''''':<CR>
\ :silent! s:'''''':<CR>
\ :set hlsearch! hlsearch?<CR>

"(sh) comment selected lines"
autocmd filetype sh vmap //
\ :s:^:#<CR>
\ :nohlsearch<CR>

"clear highlight"
nnoremap <S-l>
\ :hi clear<CR>

"hex mode"
function ToggleHex()
  if !exists("b:editHex") || !b:editHex
    let b:editHex=1
    %!xxd
  else
    let b:editHex=0
    %!xxd -r
  endif
endfunction
nnoremap <S-H>
\ :call ToggleHex()<CR>

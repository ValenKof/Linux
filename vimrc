"Valentin Kofman (kvmisis@gmail.com)

"Modern C++ syntax highlight: https://github.com/vim-jp/vim-cpp

"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'             "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'Valloric/YouCompleteMe'           "cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
Plugin 'altercation/vim-colors-solarized' "mkdir ~/.vim/colors && cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
call vundle#end()
filetype plugin indent on

"default compilation flags for ycm
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"c++ code style
set tabstop=2
set shiftwidth=2
set expandtab
set ai

"c++ indent
set cin
set cino=N-s,g0,+2s,l-s,m1

"show line & column numbers
set ruler

"enable line number
set number

"backspace works correctly
set backspace=indent,eol,start

"highlight searched words
set hlsearch

"enable mouse navigation
set mouse=a

"completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>C-n>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>C-n>" : ""<CR>'

"insert real tab
inoremap <S-Tab> <C-V><Tab>

"solarized theme
syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=16

"left panel coloring
hi SignColumn cterm=NONE ctermbg=8

"long lines coloring
hi OverLength cterm=NONE ctermbg=red ctermfg=white
1match OverLength /\%101v.*/

"trailing whitespaces coloring
hi ExtraWhitespace cterm=NONE ctermbg=red ctermfg=white
2match ExtraWhitespace /\s\+$/

"(cpp) build
autocmd filetype cpp nnoremap <S-b>
\ :!~/scripts/build.sh<CR>

"(cpp) run
autocmd filetype cpp nnoremap <S-r>
\ :!~/scripts/run.sh <CR>

"(cpp) comment selected lines
autocmd filetype cpp vmap //
\ :s:^://<CR>
\ :nohlsearch<CR>

"(cpp) comment/uncomment word under cursor
autocmd filetype cpp nnoremap //
\ :set hlsearch! hlsearch?<CR>
\ :s:\<<C-r><C-w>\>:/*&*/<CR>
\ :silent! s:/\*/\*:<CR>
\ :silent! s:\*/\*/:<CR>
\ :set hlsearch! hlsearch?<CR>

"(cpp) swap between .h and .cpp
autocmd filetype cpp map <F4>
\ :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"(python) comment selected lines
autocmd filetype python vmap //
\ :s:^:#<CR>
\ :nohlsearch<CR>

"(python) comment/uncomment word under cursor
autocmd filetype python nnoremap //
\ :set hlsearch! hlsearch?<CR>
\ :s:\<<C-r><C-w>\>:'''&'''<CR>
\ :silent! s:'''''':<CR>
\ :silent! s:'''''':<CR>
\ :set hlsearch! hlsearch?<CR>

"(sh) comment selected lines
autocmd filetype sh vmap //
\ :s:^:#<CR>
\ :nohlsearch<CR>

"clear highlight
nnoremap <S-l>
\ :hi clear<CR>

"(F6) hex mode
function ToggleHex()
  if !exists("b:editHex") || !b:editHex
    let b:editHex=1
    %!xxd
  else
    let b:editHex=0
    %!xxd -r
  endif
endfunction
nnoremap <F6>
\ :call ToggleHex()<CR>

"(F2) swap between paste and nopaste
set pastetoggle=<F2>

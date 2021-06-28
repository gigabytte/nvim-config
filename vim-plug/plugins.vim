" ato-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    set number
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

call plug#end()

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Auto refresh NERDTree without manually pressing r or R on the current dir
autocmd BufEnter NERD_tree_* | execute 'normal R'

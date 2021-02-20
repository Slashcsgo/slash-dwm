" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" Plugins area
    " NERDTree file explorer
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'
    " Code completion
    Plug 'neoclide/coc.nvim'
    " Typescript support
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    " vim-airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " vim themes
    Plug 'tomasr/molokai'
    " markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

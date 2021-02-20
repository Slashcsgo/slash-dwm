source $HOME/.config/nvim/vim-plug/plugins.vim

"================+
" NERDTree setup |
"================+
"
" Run NERDTree on start
autocmd VimEnter * NERDTree
" Same NERDTree on every tab
autocmd BufWinEnter * silent NERDTreeMirror
" Close nvim if NERDTree last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Enable syntax
syntax on

set nocompatible

" Fix tab width
set tabstop=4
set shiftwidth=4
set expandtab

set relativenumber

" Fix completion submenu
set cmdheight=2
" Set line numbers
set nu

" Bind auto-close brackets and quotes
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1


"===========+
" CoC setup |
"===========+
"
" Add plugins and autoselect first completion
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python', 'coc-go']
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"===================+
" Vim-airline setup |
"===================+
"
" Enable tabline
let g:airline#extensions#tabline#enabled = 1
" Set theme
let g:airline_theme='dark'
"let g:airline_left_sep = "\uE0BB"
"let g:airline_right_sep = "\uE0BD"

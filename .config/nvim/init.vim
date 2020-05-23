" download vim-plug if missing
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif


" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'dracula/vim', { 'as': 'dracula' } " Dracula Theme

" Initialize plugin system
call plug#end()

" CoC.nvim Extensions
let g:coc_global_extensions = [
      \ 'coc-git',
      \ 'coc-terminal',
      \ 'coc-ultisnips',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-tsserver',
      \ 'coc-flutter',
      \ 'coc-java',
      \ 'coc-python',
      \ 'coc-rls'
\ ]

" Use <Tab> or custom key for trigger completion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

set number relativenumber
set mouse=a

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

let g:dracula_colorterm = 0
let g:dracula_italic = 0

colorscheme dracula


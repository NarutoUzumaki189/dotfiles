set relativenumber
set number
inoremap <TAB> <Esc>
syntax on
"set rtp+=/Users/siya/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim
"let g:airline_powerline_fonts = 1
set clipboard=unnamed
if isdirectory(expand("$HOME/.vim/bundle/Vundle.vim") )
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    "Plugin 'sickill/vim-monokai'
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'machakann/vim-highlightedyank'
    Plugin 'wincent/command-t.git'
    Plugin 'itchyny/lightline.vim'
    "Plugin 'vim-airline/vim-airline'
    Plugin 'arcticicestudio/nord-vim'    
    Plugin 'tpope/vim-fugitive'
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
endif
filetype plugin indent on    " required
colorscheme nord
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
       \   'gitbranch': 'LightlineFugitive'
      \ },     
		\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }      
		\ }
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? "\ue0a0 ".branch : ''
	endif
	return ''
endfunction


if exists('+colorcolumn')
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * if &buflisted | let &l:colorcolumn='+' . join(range(0, 254), ',+')| endif
      autocmd FocusLost,WinLeave * let &l:colorcolumn=join(range(1, 255), ',') 
endif

autocmd InsertLeave,VimEnter,WinEnter * setlocal cursorline 
autocmd InsertEnter,WinLeave setlocal nocursorline 

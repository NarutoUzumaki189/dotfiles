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
    Plugin 'arcticicestudio/nord-vim'    
    Plugin 'psf/black'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/syntastic'
    "Plugin 'vim-syntastic/syntastic'
    Plugin 'preservim/nerdtree'
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
endif

filetype plugin indent on    " required
colorscheme nord
set laststatus=2


let g:black_linelength=80
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = { 'mode': 'active',
      \                      'active_filetypes': ['py'] }

let g:lightline = {
      \ 'colorscheme' : 'nord',
      \ 'active': {
      \   'right': [ [ 'lineinfo', 'syntastic' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'gitbranch': 'LightlineFugitive'
      \ }
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

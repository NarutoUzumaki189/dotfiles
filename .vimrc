"colo peachpuff 
set relativenumber
inoremap <TAB> <Esc>
set laststatus=2
set t_CO=256
"set background=dark
"set ruler
syntax on
"filetype indent plugin on"
set clipboard=unnamed
"set rtp+=/Users/siya/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'sickill/vim-monokai'
Plugin 'VundleVim/Vundle.vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'wincent/command'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax enable

colorscheme monokai

if exists('+colorcolumn')
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * if &buflisted | let &l:colorcolumn='+' . join(range(0, 254), ',+')| endif
      autocmd FocusLost,WinLeave * let &l:colorcolumn=join(range(1, 255), ',') 
endif

autocmd InsertLeave,VimEnter,WinEnter * setlocal cursorline 
autocmd InsertEnter,WinLeave setlocal nocursorline 

hi statusline guibg=White ctermfg=137 guifg=Black ctermbg=234

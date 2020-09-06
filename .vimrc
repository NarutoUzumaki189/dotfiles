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


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitSymbol()
  return system("echo '\ue0a0' 2>/dev/null | tr -d '\n'")
endfunction


function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.'':''
endfunction


" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
"set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\   " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                        " File path, modified, readonly, helpfile, preview
"set statusline+=%2*│                                     " Separator
set statusline+=%2*\ %Y\                                  " FileType
"set statusline+=%2*│                                     " Separator
let g:z=StatuslineGit() 
:if strlen(z)
    let g:y = GitSymbol()
    set statusline+=%2*%{toupper(y)}      " Encoding
    set statusline+=%2*%{toupper(z)}      " Encoding
:else
    set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}      " Encoding
:endif
set statusline+=%=                                        " Right Side
"set statusline+=%2*│                                     " Separator
"set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\               " Line number / total lines, percentage of document
set statusline+=%5*\ %{toupper(strftime(\"%a\"))}\                       " Date in Day month year
set statusline+=%6*\ %{toupper(strftime(\"%d\/%m\"))}\                       " Date in Day month year

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=137 ctermbg=234 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
hi User5 ctermfg=233 ctermbg=241 guibg=#4e4e4e guifg=#4e4e4e cterm=bold
hi User6 ctermfg=233 ctermbg=245 guibg=#4e4e4e guifg=#4e4e4e cterm=bold
"usergroup 1 guibg=White ctermfg=137 guifg=Black ctermbg=234

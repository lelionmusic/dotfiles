 " "  If you don't understand a setting in here, just type ':h setting'.

 " " Use Vim settings, rather than Vi settings (much better!).
 " " This must be first, because it changes other options as a side effect.
set nocompatible
 "
 filetype off                  " required

 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 "
 " " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 Bundle 'takac/vim-hardtime'
 Plugin 'scrooloose/nerdtree'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 " " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " " To ignore plugin indent changes, instead use:
 " "filetype plugin on
 " "
 " " Brief help
 " " :PluginList       - lists configured plugins
 " " :PluginInstall    - installs plugins; append `!` to update or just
 " :PluginUpdate
 " " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " " :PluginClean      - confirms removal of unused plugins; append `!` to
 " auto-approve removal
 " "
 " " see :h vundle for more details or wiki for FAQ
 " " Put your non-Plugin stuff after this line
 " " Make backspace behave in a sane manner.
set backspace=indent,eol,start
"
" Hardtime config
let g:hardtime_default_on = 0
let g:hardtime_maxcount = 4
" onedark theme stuff
"if (empty($TMUX))
"	if (has("nvim"))
"		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"	endif
"	if (has("termguicolors"))
"		set termguicolors
"	endif
"endif

"let g:onedark_termcolors=16
"let g:onedark_terminal_italics=1

 " " Switch syntax highlighting on
syntax on
 "
"set background=dark
"colorscheme onedark
let g:airline_theme='luna' 
let g:airline_powerline_fonts=1
 " " Show line numbers
set number
 "
 " " Allow hidden buffers, don't limit to 1 file per window/split
set hidden

 " amount of saved commands
set history=100

 " bind esc to jk for exiting insert mode
imap jk <Esc>

 " highlighted search terms
set hlsearch

 " case insensitive seach
set ic

set tabstop=4
set shiftwidth=4


"--------------------------------------------------------------------------------
"             NERDTree
"--------------------------------------------------------------------------------
" Automaticly open nerdtree on blank
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
 " Automaticly close nerdtree when you open a file
let NERDTreeQuitOnOpen=1

 " Automaticly close a tab if the only remaining window is NerdTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NerdTreeType == "primary") | q | endif

let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

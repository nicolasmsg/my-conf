set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
" set background=dark
" colorscheme solarized


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'mxw/vim-jsx'
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'eslint/eslint'
Plugin 'YouCompleteMe'
Plugin 'tomasiser/vim-code-dark'
Plugin 'sickill/vim-monokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Activate mouse
:set mouse=a

" Always show statusline

set number
set cursorline

set noswapfile
set nowb
set nobackup

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set autoread

set hlsearch
set smartcase
set showmatch
set mat=2
set laststatus=2

set autoindent " automatically set indent of new line
set smartindent

" execute pathogen#infect()

" Nerdtree Settings

" make backspace behave in a sane manner
set backspace=indent,eol,start

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
" show hidden files in NERDTree
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree | wincmd p
map <C-n> :NERDTreeToggle<CR>
" map <F2> :NERDTreeToggle<CR>

" :syntax on

" Configuration plug-ins

" VIM-JSX
let g:jsx_ext_required = 0

" Syntastic config
:set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Configure files icons
"

set t_Co=256
syntax on
set background=dark
" colorscheme codedark
colorscheme monokai

let g:user_emmet_leader_key='<C-I>'

" vim-airline configuration
let g:airline#extensions#tabline#enabled = 1

" Close vim if nerdTree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jsx', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('js', 'yellow', 'none', '#yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')

call NERDTreeHighlightFile('ini', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('config', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('conf', 'red', 'none', 'red', '#151515')

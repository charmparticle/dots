":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Vundle Setup                                                                ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"filetype off                  " required!
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"" let Vundle manage Vundle
"" required! 
"Bundle 'gmarik/vundle'

call plug#begin('~/.vim/plugged')

" plugins
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'othree/html5.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/csapprox'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/FuzzyFinder'
"asynchronis linter. Highlights syntax errors as you type
Plug 'w0rp/ale'
Plug 'gg/python.vim'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/utl.vim'
Plug 'vim-scripts/gnupg.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/txt.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/fluxbox.vim'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/ScrollColors'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/L9'

"colorschemes
Plug 'shannonmoeller/vim-monokai256'
Plug 'ciaranm/inkpot'
Plug 'vim-scripts/badwolf'
Plug 'vim-scripts/pyte'
Plug 'vim-scripts/midnight.vim'
Plug 'tpope/vim-vividchalk'
Plug 'vim-scripts/Railscasts-Theme-GUIand256color'

call plug#end()

"filetype plugin indent on
"^^plug.vim does this automatically

" Brief help
" :PlugStatus - check status of plugins
" :PlugInstall - installs all plugins
" :PlugClean - remove unused plugins
" :PlugUpgrade - upgrades plug.vim

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Syntax highlighting and proper indenting, for happy coding!                 ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
syntax on
set autoindent smartindent " Indent-related options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Enable Omnicompletion                                                       ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set omnifunc=syntaxcomplete#Complete

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Don't write backup file if vim is being called by  crontab -e or chpass"    ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
au BufWrite /tmp/crontab.* set nowritebackup
au BufWrite /etc/pw.* set nowritebackup

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" GUI Options                                                                 ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
if has('gui_running')
    set showtabline=1
    set guioptions+=baimtl "adds h & v scrollbars, an icon, a tearoff menu, and makes selections go to the selection clipboard
    set anti guifont=DejaVu\ Sans\ Mono\ 12 
    colorscheme molokai
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Non-GUI options
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
else
    colorscheme badwolf
endif 
set mouse=a mousemodel=popup "enable the mouse
 set confirm " Ask me what to do when an operation fails
set cursorline cursorcolumn " Show cursor position visually, like BBEdit
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"Menus
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
menu 20.451 &Edit.Choose\ Color\ Theme :SCROLL<CR>
"menu Plugin.Zoom\ Window :ZoomWin<CR> 
"menu Plugin.Browse\ Undo\ Branches :UB<CR> 
"menu Plugin.Create\ Color\ Scheme :ColorSchemeEditor<CR>
"menu Plugin.Color\ Picker.Hex\ Color\ Picker :PickHEX<CR>
"menu Plugin.Color\ Picker.HSL\ Color\ Picker :PickHSL<CR>
"menu Plugin.Color\ Picker.RGB\ Color\ Picker :PickRGB<CR>
"menu Plugin.Color\ Picker.Raw\ Color\ Picker :PickRAW<CR>
"menu Plugin.Toggle\ Easy\ Accents :EZA<CR> 
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" I prefer dark colorschemes
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Keep folds and suchforth, so that when I come back to edit later, the file  ::
" looks the same                                                              ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
autocmd BufWinLeave .* if &modifiable | mkview | endif 
autocmd BufWinEnter .* if &modifiable  | silent loadview | endif 

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Options                                                                     ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set number "number all lines.
"set relativenumber "but show the number of lines relative to current for other lines
set nowrap "make lines trail offscreen - makes indenting tidier, for me.
set nobackup "don't litter everything with backup files.
set visualbell "don't you dare beep at me!
set backspace=2 "backspace should work over line breaks, indents, etc
set showmatch matchpairs+=<:> "Show matching parens & brackets. 
set printoptions=paper:letter,portrait:y
set autoread "automatically refresh a file if it's been changed
set enc=utf-8 "Needed for gtk
set foldcolumn=1 "how many spaces does the fold column take up?
set nohlsearch ignorecase incsearch smartcase " Search-related options
set showcmd showmode " display incomplete commands
set lazyredraw "faster macros
set scrolloff=3 "more context
set laststatus=2 statusline=%<%04n\ %t%(\ %m%r%y[%{&ff}][%{&fenc}]\ \ %{mode()}%)\ %a%=\ col\ %v\ \ line\ %l/%L\ %p%%
set shortmess=a "use abbreviations in the statusline as much as possible
set tabpagemax=1000000 "up to a million tabs!
set title "in mrxvt or xterm, let the terminal have the title be the same as it would be in gvim.
set viminfo='25,<10000,n~/.config/nvim/.viminfo "viminfo holds registers and suchforth - nice to keep those!
set directory=~/.vim/swp "don't pollute everything with .swp files
set ul=1000000000 "undo up to a billion changes!
set virtualedit=all "allow the cursor to go out into space :-)
set wcm=<Tab> wildmenu wildmode=list:full "autocomplete vim commands with tab, and show a menu. Super nice!
set inccommand=nosplit "neovim only - emulates multi cursor for ex commands
set undofile undodir=~/.vim/undo// "needed for persistant undo

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Variables                                                                   ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"au VimEnter * RainbowParenthesesToggle
let html_use_css=1 "better highlighting for real-world html
let mapleader = ','
"Some settings for plugins I like to use.
let g:GPGPreferArmor=1 "base64-encodes encrypted files
"let MRU_File="~/.vim/.mru"
"let MRU_Max_Entries=20
"let NERDShutUp=1
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Keymaps                                                                     ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Make undo branch navigation commands easier on the wrists
nnoremap <F5> :UndotreeToggle<cr>
noremap <F9> g-
noremap <F10> g+
" Use arrow keys for scrolling
noremap <down> <C-d>
noremap <up> <C-u>
noremap <right> zl
noremap <left> zh
" A little correction ;)
map q: :q
map Q @@
iabbr teh the
" type "dts" in insert mode to insert the date
iabbr <expr> dts strftime("%m/%d/%y")

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Macros - to be added and deleted when useful                                ::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

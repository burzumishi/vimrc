" General "{{{
set nocompatible  " disable vi compatibility.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set autoread
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags

" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Buffers
set hidden " The current buffer can be put to the background without writing to disk

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase	        " be sensitive when there's a capital letter
set incsearch   "
" "}}}

" Formatting "{{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0	" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.
set backspace=indent,eol,start	" more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on               " enable syntax
" "}}}

" Visual "{{{
set number  " Line numbers off
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set nolist " Display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set mouse-=a   " Disable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

" "}}}


" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

"Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
" " }}}

" Key mappings " {{{
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vim/vimrc<CR>
nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

" Tabs
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>

" Duplication
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP

" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>

" Split line(opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

nnoremap # :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * #

map <S-CR> A<CR><ESC>

" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR>
" " }}}

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins " {{{
" call vundle#rc()

" trying this
Plugin 'YankRing.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-poslist'
Plugin 'mattn/gist-vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" NERDTree
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xuyuanp/nerdtree-git-plugin'

" Programming
Plugin 'jQuery'
Plugin 'rails.vim'

" Snippets
"Plugin 'gmarik/snipmate.vim'
Plugin 'honza/vim-snippets'

" Syntax highlight
Plugin 'cucumber.zip'
Plugin 'Markdown'

" Git integration
Plugin 'git.zip'
Plugin 'fugitive.vim'

" (HT|X)ml tool
Plugin 'ragtag.vim'

" Utility
Plugin 'repeat.vim'
Plugin 'surround.vim'
Plugin 'SuperTab'
Plugin 'file-line'
Plugin 'Align'

" FuzzyFinder
Plugin 'L9'
Plugin 'FuzzyFinder'

let g:fuf_modesDisable = [] " {{{
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR>
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR>
" " }}}

" Zoomwin
Plugin 'ZoomWin'
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>
noremap <C-W>+o :ZoomWin<CR>

" Ack
Plugin 'ack.vim'
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" tComment
Plugin 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Navigation
Plugin 'gmarik/vim-visual-star-search'

" FANCY Status Line

" PowerLine
Plugin 'powerline/powerline'
let g:powerline_symbols = 'fancy'
let g:powerline_pycmd="py"

" AirLine
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline#extensions#tabline#enabled = 1

" Syntastic
Plugin 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Theme plugins
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'xoria256.vim'
"Plugin 'dracula/dracula-theme'
Plugin 'kyoz/purify'

" BASH plugins
Plugin 'bash-support.vim'

" Indent Plugin
Plugin 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use: filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" " }}}

autocmd vimenter * NERDTree
" Jump to the main window.
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

colorscheme onedark

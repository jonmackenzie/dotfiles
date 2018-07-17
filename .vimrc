" Following few lines adapted from the amix rc

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Always show the status line
set laststatus=2

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
" let s:palette.inactive.middle = s:palette.normal.middle
" let s:palette.tabline.middle = s:palette.normal.middle

" Python syntax
let g:syntastic_python_checkers=['pyflakes']

" Javascript syntax
let g:syntastic_javascript_checkers = ['jshint']

set noshowmode


" look up "relative line numbering" it makes using vim so much easier
set relativenumber
set number

"set termguicolors

" I prefer my lines not to wrap
set nowrap
" I can't remember what this does but I think it has something to do with the line wrap thing
set textwidth=0

set clipboard=unnamed

" I you split panes from within vim you'll probably want
" them to open below/ to the right instead of the other way around
set splitbelow
set splitright

set report=0
set shortmess=

let g:limelight_conceal_ctermfg = 23

imap `{ {<cr>}<up><cr>
imap `f function()<cr>{}<left><cr><up><right><cr>
imap `r <right>,<space>function(req, res)<cr>{}<left><left><backspace><right><cr><up><right><cr>
imap `post app.post("/");<left><left><left>
imap `get app.get("/");<left><left><left>

" Disable automatic comment continuation on enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open NERDTree on start
"autocmd vimenter * NERDTree

" ctrl-sroll for left and right
map <C-ScrollWheelDown> <Left>
map <C-ScrollWheelUp> <Right>

map <f2>  :w<cr>
map <f3>  :wq<cr>
map <f11> :setlocal spell!<cr>
map <f12> :Limelight!!<cr>

imap <f2>  <c-o><f2>
imap <f3>  <c-o><f3>
imap <f11> <c-o><f10>
imap <f12> <c-o><f12>

" load pathogen plugins
execute pathogen#infect()
call pathogen#helptags()

nmap Y y$

" yank highlight disappears after 10 seconds
let g:highlightedyank_highlight_duration = 10000

" spacebar set as leader, so <space>G toggles git gutter, <space>F toggles tree, etc.
let mapleader = " "

" if you're in a git repo this will show you which lines have been modified and how
:au VimEnter * :GitGutterEnable
nnoremap <Leader>g :GitGutterToggle<cr>

" --- I never use this nerdtree stuff anymore now that I have command-t but sometimes it is more useful
" toggles the file tree
nnoremap <Leader>f :NERDTreeToggle<cr>
" selects the file tree; when you select a file it'll open in the pane you were just in
nnoremap <silent> <Leader>n :NERDTreeFind<CR>
" same as above, but start a search (think of it as like an "open file" command)
nnoremap <silent> <Leader>o :NERDTreeFind<CR>/

" close tree if last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" <space> + and - for vertical resizing (used = instead of + so I don't have to press shift)
nnoremap <Leader>- :vertical resize -5<cr>
nnoremap <Leader>= :vertical resize +5<cr>
" and the keys below them for horizontal
nnoremap <Leader>[ :res -5<cr>
nnoremap <Leader>] :res +5<cr>

nnoremap <Leader>v :vsp<cr>
nnoremap <Leader>h :sp<cr>

nnoremap <Leader>l :Limelight!!<cr>

command! WQ wq
command! Wq wq
command! W w
command! Q q

nnoremap \t :terminal ++curwin <cr>
tnoremap <C-Esc> <C-\><C-n>

" <control>hjlk to move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-D> <C-W><C-C>

" make sure 0 goes ALL the way to the beginning of the line, have hyphen be the soft BOL, also add hard BOL to M
"nnoremap 0 $lk
nnoremap - ^
nnoremap M M0

" clear highlighting
nnoremap \\ :noh<cr>
" search-and-replace
nnoremap <Leader>r :%Subvert/
" save all
nnoremap <C-S> :wa<cr>

nnoremap <C-U> :GundoToggle<cr>

colo gruvbox

call plug#begin('~/.vim/plugged')
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-startify'
call plug#end()

" makes a bunch of stuff transparent (gets rid of bg colour) useful if you have a bg image or a (semi) transparent terminal
hi normal ctermbg=none
hi nontext ctermbg=none
hi signcolumn ctermbg=none
hi diffadd ctermbg=none
hi diffchange ctermbg=none
hi diffdelete ctermbg=none
hi difftext ctermbg=none
hi folded ctermbg=none
hi foldcolumn ctermbg=none
hi linenr ctermbg=none
hi cursorlinenr ctermbg=none
hi gitgutteradd ctermbg=none
hi gitgutterchange ctermbg=none
hi gitgutterdelete ctermbg=none
hi gitgutterchangedelete ctermbg=none
hi gitgutteradddefault ctermbg=none
hi gitgutterchangedefault ctermbg=none
hi gitgutterdeletedefault ctermbg=none
hi gitgutteraddinvisible ctermbg=none
hi gitgutterchangeinvisible ctermbg=none
hi gitgutterdeleteinvisible ctermbg=none

" turn rainbow paran on
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" heathen, I know
set mouse=a

" show commands while typing
set showcmd

" I'd rather not type zR every time I open a file
set nofoldenable

" I do a lot of development with handlebars and syntastic thinks it's supposed
" to be plain html and gives me warnings everywhere so I just don't check html
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" file tree on the left, and minimal UI
" (doesn't change much, mostly just gets rid of the "press ? for help" thing)
let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1

let delimitMate_matchpairs = "(:),[:],{:}"

" copied and lightly modified from startify help

let g:startify_session_dir = "~/.vim/session"

function! s:list_commits()
    let git = 'git -C ~/flooma'
    let commits = systemlist(git .' log --oneline | head -n10')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0

"let g:startify_custom_header =  map(split(system('archey'), '\n'), '"   ". v:val') + startify#fortune#cowsay()

let g:startify_files_number = 32

let g:startify_lists = [
      \ { 'type': 'files',     'header': [   '   Files']            },
      \ ]

" removed from list:
"      \ { 'type': 'commands',  'header': [   '   Commands']       },
"      \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
"      \ { 'type': 'sessions',  'header': [   '   Sessions']       },
"      \ { 'type': 'dir',       'header': [   '   Files '. getcwd()] },
"      \ { 'type': 'bookmarks', 'header': [   '   Bookmarks']      },




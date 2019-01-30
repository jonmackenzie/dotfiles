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
vnoremap <silent> * :<c-u>call VisualSelection('', '')<cr>/<c-r>=@/<cr><cr>
vnoremap <silent> # :<c-u>call VisualSelection('', '')<cr>?<c-r>=@/<cr><cr>

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
    autocmd bufwritepre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<c-v><cr>//ge<cr>'tzt'm

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
vnoremap <silent> gv :call VisualSelection('gv', '')<cr>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>

" Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set confirm

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

let g:syntastic_ignore_files = ['.*\.txt']

set noshowmode

" look up "relative line numbering" it makes using vim so much easier
set relativenumber
set number

" I prefer my lines not to wrap
set nowrap
" I can't remember what this does but I think it has something to do with the line wrap thing
set textwidth=0

set clipboard^=unnamed

" I you split panes from within vim you'll probably want
" them to open below/ to the right instead of the other way around
set splitbelow
set splitright

set report=0
set shortmess=aIT

let g:limelight_conceal_ctermfg = 23

imap `{ {<cr>}<up><cr>
imap `f function()<cr>{}<left><cr><up><right><cr>
imap `r <right>,<space>function(req, res)<cr>{}<left><left><backspace><right><cr><up><right><cr>
imap `post app.post("/");<left><left><left>
imap `get app.get("/");<left><left><left>
imap `/ </<c-x><c-o><esc>F<i
imap `> >`/

" Disable automatic comment continuation on enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ctrl-sroll for left and right
map <c-ScrollWheelDown> <left>
map <c-ScrollWheelUp> <right>

set <f13>=[30;1W " alt+f3 on my iTerm
set <f14>=[30;1C " alt+f4
set <f15>=[1;2S  " shift+f4
set <f16>=[30;WS " alt+shift+W

map <f1>  :w<cr>
map <f2>  :wa<cr>
map <f3>  :wq<cr>
map <f13> :wqa<cr>
map <f4>  :q<cr>
map <f14> :qa<cr>
map <f15> :tabclose<cr>
map <f9>  :w<bar>silent make<bar>unsilent redraw!<bar>cwindow<cr>
map <f10> :Gdiff<cr>
map <f11> :NERDTreeToggle<cr>
map <f12> :Limelight!!<cr>
map <f16> :w<bar>so ~/.vimrc<cr>:noh<cr>

imap <f1>  <c-o><f1>
imap <f2>  <c-o><f2>
imap <f3>  <esc><f3>
imap <f4>  <c-o><f4>
imap <f9>  <c-o><f9>
imap <f10> <c-o><f10>
imap <f11> <c-o><f11>
imap <f12> <c-o><f12>

" shift+arrows (u/d/r/l)
set <f20>=[1;2A <f21>=[1;2B <f22>=[1;2C <f23>=[1;2D
set <f24>=[30;TL <f25>=[30;TR

" map shift+arrows to tab stuff
map <f20> :tabnew<cr>:Startify<cr>
map <f21> :tabclose<cr>
map <f22> :tabnext<cr>
map <f23> :tabprevious<cr>
map <f24> :tabm -1<cr>
map <f25> :tabm +1<cr>

" load pathogen plugins
execute pathogen#infect()
call pathogen#helptags()

nmap Y y$

" yank highlight disappears after 10 seconds
let g:highlightedyank_highlight_duration = 10000

" spacebar set as leader, so <space>G toggles git gutter, <space>F toggles tree, etc.
let mapleader = " "

" if you're in a git repo this will show you which lines have been modified and how
:au vimenter * :GitGutterEnable
nnoremap <leader>g :GitGutterToggle<cr>

" close tree if last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" <space> + and - for vertical resizing (used = instead of + so I don't have to press shift)
nnoremap <leader>- :vertical resize -5<cr>
nnoremap <leader>= :vertical resize +5<cr>
" and the keys below them for horizontal
nnoremap <leader>[ :res -5<cr>
nnoremap <leader>] :res +5<cr>

nnoremap <leader>v :vsp<cr>
nnoremap <leader>h :sp<cr>

nnoremap <leader>l :Limelight!!<cr>

nnoremap <leader>nt :tabnew<cr>

map <Leader>, <Plug>(easymotion-prefix)

command! WQ wq
command! Wq wq
command! W w
command! Q q

nnoremap \t :terminal ++curwin <cr>
tnoremap <c-\><c-\> <c-\><c-n>

" "goto buffer" borrowed from romainl
" (cmd-t has a similar command but this way shows the buffer numbers)
nnoremap gb :ls<cr>:

" <control>hjlk to move between panes
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

nnoremap <c-d> <c-w><c-c>

" add hard BOL to M
nnoremap - ^
nnoremap M M0

nnoremap H ^
nnoremap L $

" clear highlighting
nnoremap \\ :noh<cr>
" search-and-replace
nnoremap <leader>r :%Subvert/
" save all
nnoremap <c-s> :wa<cr>

nnoremap <c-u> :GundoToggle<cr>

colo gruvbox

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
hi gitgutteradd ctermbg=none ctermfg=22
hi gitgutterchange ctermbg=none ctermfg=3
hi gitgutterdelete ctermbg=none ctermfg=160
hi gitgutterchangedelete ctermbg=none ctermfg=6
hi gitgutteradddefault ctermbg=none
hi gitgutterchangedefault ctermbg=none
hi gitgutterdeletedefault ctermbg=none
hi gitgutteraddinvisible ctermbg=none
hi gitgutterchangeinvisible ctermbg=none
hi gitgutterdeleteinvisible ctermbg=none
hi signaturemarktext ctermbg=none ctermfg=8

" update git gutter on save
autocmd BufWritePost * GitGutter

" turn rainbow paren on
au vimenter * RainbowParenthesesToggle
au syntax   * RainbowParenthesesLoadRound
au syntax   * RainbowParenthesesLoadSquare
au syntax   * RainbowParenthesesLoadBraces

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

augroup notes
    au!
    autocmd BufNewFile,BufRead notes* set syntax=journal
    autocmd BufNewFile,BufRead *.notes set syntax=journal
augroup END

" I do a lot of development with handlebars and syntastic thinks it's supposed
" to be plain html and gives me warnings everywhere so I just don't check html
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" file tree on the left, and minimal UI
" (doesn't change much, mostly just gets rid of the "press ? for help" thing)
let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1

let g:cheat40_use_default = 0

let delimitMate_matchpairs = "(:),[:],{:}"

" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" https://github.com/mhinz/vim-startify/issues/139
au! winnew * Startify " this works fine for new windows but not for new tabs, hence the following bullshit

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

let g:startify_files_number = 20

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   '   Sessions']       },
      \ { 'type': 'dir',       'header': [   '   Files '. getcwd()] },
      \ { 'type': 'files',     'header': [   '   Files']            },
      \ ]

" removed from list:
"      \ { 'type': 'commands',  'header': [   '   Commands']       },
"      \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
"      \ { 'type': 'bookmarks', 'header': [   '   Bookmarks']      },




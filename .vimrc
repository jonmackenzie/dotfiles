" build off the amix vimrc (hopefully will be removed soon in favour of hand-made stuff)
set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

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

" load pathogen plugins
execute pathogen#infect()
call pathogen#helptags()

nmap Y y$

let g:highlightedyank_highlight_duration = -1

" spacebar set as leader, so <space>G toggles git gutter, <space>F toggles tree, etc.
let mapleader = " "

" if you're in a git repo this will show you which lines have been modified and how
:au VimEnter * :GitGutterEnable
nnoremap <Leader>g :GitGutterToggle<cr>
" toggles the file tree (I usually just leave it open all the time)
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
nnoremap 0 $lk
nnoremap - ^
nnoremap M M0

" clear highlighting
nnoremap \\ :noh<cr>
" search-and-replace
nnoremap <Leader>r :%Subvert/
" save all
nnoremap <C-S> :wa<cr>

nnoremap <C-U> :GundoToggle<cr>

colo apprentice

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

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

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

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   '   Sessions']       },
      \ { 'type': 'files',     'header': [   '   Files']            },
      \ { 'type': 'dir',       'header': [   '   Files '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': [   '   Bookmarks']      },
      \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
      \ { 'type': 'commands',  'header': [   '   Commands']       },
      \ ]


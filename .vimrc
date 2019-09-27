"------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------
" __  __     ______                                                   __            _     
"/\ \/\ \   /\__  _\     /'\_/`\                                    /'__`\        /' \    
"\ \ \ \ \  \/_/\ \/    /\      \                                  /\ \/\ \      /\_, \   
" \ \ \ \ \    \ \ \    \ \ \__\ \              _______            \ \ \ \ \     \/_/\ \  
"  \ \ \_/ \    \_\ \__  \ \ \_/\ \            /\______\            \ \ \_\ \ __    \ \ \ 
"   \ `\___/    /\_____\  \ \_\\ \_\           \/______/             \ \____//\_\    \ \_\
"    `\/__/     \/_____/   \/_/ \/_/                                  \/___/ \/_/     \/_/
"
"-------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------
"
" Name: ~./vimrc
"   Sections                                                                                      
"   ----------------------*
"   1.0 General
"   2.0 Vim user interface
"   3.0 Mappings
"   4.0 Text, tabs, indent related
"   6.0 Plug in manager
"
"" ~/.config/nvim/init.vim for neoVim

set nocompatible              " required
filetype off                  " required
filetype plugin on
syntax on
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set number              " Show number
set relativenumber      " Set Relative number
set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undodir
set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=manual "Defines the type of folding.
let javascript_fold=1
let typescript_fold=1

""GENERAL MAPPING!!!
"Emmet remaping
let g:user_emmet_leader_key='<C-n>'

""Tabs with Alt + p or + l caveat for mac I need to map directly <ALT+pj> ==> œÄ
map  <Leader>e :tabn<CR>
map  <Leader>r :tabp<CR>

"" Mapping for better terminal usage
if has('nvim')  
    tnoremap \<Esc> <C-\><C-n>  
endif
"" Mapping to have clear last search :noh with Leader
nnoremap <space>, :nohlsearch<CR>

"" Resizing Mapping
nmap <Leader>z <C-e>

" toggle commenting of lines with command + / Mapping 
" <Alt + /> ===> √∑
nmap √∑ :Commentary<CR>
vmap √∑ :Commentary<CR>

" Leader key is like a command prefix. 
let mapleader="\<Space>"
""Using mapleader
nnoremap <Leader>; :w<CR>
"Using Leader for buffers
 vmap <Leader>y "+y
 vmap <Leader>d "+d
 nmap <Leader>p "+p
 nmap <Leader>P "+P
 vmap <Leader>p "+p
 vmap <Leader>P "+P
 
 ""Toggle between windows
 nnoremap <Leader>q <C-w>h
 nnoremap <Leader>w <C-w>l
 nnoremap <Leader>k <C-w>k
 nnoremap <Leader>j <C-w>j
"" Show Next Matched String at the center of the Screen
nnoremap n nzz
nnoremap N Nzz

""Mapping to move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"" Mapping to move through buffers
 map <Leader>u :bprev<CR>   
 map <Leader>i :bnext<CR>   


""""fzf confgs
nnoremap <C-p> :<C-u>FZF<CR>

"Number and relative Number
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

 

" NERDTree configurations 
" Relative numbering NerdTree
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"Auto open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1
""https://github.com/neovim/neovim/issues/3702 Copy and paste issue
set mouse=a



call plug#begin('~/.config/nvim/plugged')
"" Vim Auto pair plugin
Plug 'tmsvg/pear-tree'
""Vim Commentary
Plug 'tpope/vim-commentary'
"Vim surround 
Plug 'tpope/vim-surround'
"Git Wrapper
Plug 'tpope/vim-fugitive'
" Completion 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""fzf vim for searching files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Emmet
Plug 'mattn/emmet-vim'
"NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
""TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"AIRLINE
Plug 'bling/vim-airline'
"" Solarized
Plug 'altercation/vim-colors-solarized'
""WinResize
Plug 'simeji/winresizer'
"" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()


"""Solarized Theme configurations
" Make sure for iTerm2 the Solarized theme is active too. 
" info for configuration https://www.youtube.com/watch?v=zNcEkbVYqbc
colorscheme solarized
set background=dark



""TEST
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [v <Plug>(coc-diagnostic-prev)
nmap <silent> ]v <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gu <Plug>(coc-type-definition)
nmap <silent> gj <Plug>(coc-implementation)
nmap <silent> gm <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>e  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>r  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>
" Prettier every time all the time
nmap <Leader>f <Plug>(Prettier)
""let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
""autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"Goyo ZEN mode
let g:goyo_width = 100


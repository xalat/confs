set number                    
filetype plugin indent on     
set nocp                      
set ruler                     
set wildmenu                  
set mouse-=a                  
set autoread
set cursorline

"Code folding                 
set foldmethod=manual         

"Tabs and spacing             
set autoindent                
set smartindent
set tabstop=4                 
set expandtab                 
set shiftwidth=4              
set smarttab                  

"Search                       
set hlsearch                  
set incsearch                 
set ignorecase                
set smartcase                 
set diffopt +=iwhite          

call plug#begin("~/.vim/plugged")
  
  " Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Git integration
  Plug 'tpope/vim-fugitive'

  " Theme
  Plug 'dracula/vim' 
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'kaicataldo/material.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'mhartington/oceanic-next'
  
  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'

  " File Search
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'

  " Navigate symbols and tags using LSPs/ctags
  Plug 'liuchengxu/vista.vim'
"  Plug 'ludovicchabant/vim-gutentags'
  
  " Project manager
  Plug 'amiorin/vim-project'

  " Pair completion
"  Plug 'jiangmiao/auto-pairs'

  " Code linter
  " Plug 'neomake/neomake'
  " PHP support
  Plug 'StanAngeloff/php.vim'

  " twig support 
  Plug 'nelsyeung/twig.vim'
  
  " Comment  
  Plug 'preservim/nerdcommenter'

call plug#end()

let g:mapleader = ','     
" Enable theming support
if (has("termguicolors"))
set termguicolors
endif

" ------ Theme
syntax on
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" ------ Code assist
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-tslint', 'coc-tslint-plugin', 'coc-python', 'coc-phpls', 'coc-pairs']
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <C-k> :call<SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
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

" ------ File explorer
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" ------ Fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FZF<CR>
nnoremap <C-h> :FzfHistory<CR>
nnoremap <C-e> :FzfBuffers<CR>
nnoremap <C-a> :FzfAg<CR>

let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\}
set splitright
set splitbelow
" ------ Vista (tag navigation)
" use coc as backend
let g:vista_default_executive = 'coc'
" enable fzf preview
let g:vista_fzf_preview = ['right:50%']
" how long before scrolling / floating the definition
let g:vista_cursor_delay = 200
" nnoremap <leader>vv :Vista!<CR>
nnoremap <C-m> :Vista finder<CR>

" ------ turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" ------ use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

noremap   <Up>     <NOP>  
noremap   <Down>   <NOP>  
noremap   <Left>   <NOP>  
noremap   <Right>  <NOP>  
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
"function! OpenTerminal()
"  split term://bash
"  resize 10
"endfunction
" nnoremapnnoremap <c-n> :call OpenTerminal()<CR>


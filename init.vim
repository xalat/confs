set number
"syntax enable
"filetype plugin indent on    

let g:mapleader = ','
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


set autoindent                                    " indentation automatique avancée
set smartindent                                   " indentation plus intelligente
"set laststatus=2                                  " ajoute une barre de status
"set backspace=indent,eol,start                    " autorisation du retour arrière
"set history=50                                    " historique de 50 commandes
"set ruler                                         " affiche la position courante au sein du fichier
"set showcmd                                       " affiche la commande en cours
set shiftwidth=4                                  "
set tabstop=4
set showmatch                                     " vérification présence ([ ou { à la frappe de )] ou  } ])"
"set incsearch									  " recherche incrémentale	
"set ignorecase
"set smartcase

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim'
Plug 'evidens/vim-twig'
Plug 'msanders/snipmate.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'shawncplus/phpcomplete.vim'
"Plug 'ervandew/supertab'
"Plug 'phpvim/phpcd.vim', { 'for': 'php' }
"Plug 'vim-scripts/progressbar-widget' 
Plug 'Valloric/YouCompleteMe'
Plug 'MattesGroeger/vim-bookmarks'

call plug#end()

" COLOR SCHEME
set background=dark
colorscheme solarized

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <leader>n :NERDTreeFind<CR>

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let s:php_executable = "/usr/bin/php"
if !(executable(s:php_executable))
	let makeprg = php_executable . " -l %"
endif
let g:syntastic_php_checkers=['php']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

" php-cs-fixer
let g:php_cs_fixer_path = "~/.composer/vendor/bin"

" tagbar
nnoremap <silent> <F12> :TagbarOpen<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
let Tagbar_Use_Right_Window   = 1
"let Tlist_Show_One_File = 1
"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Exit_OnlyWindow = 1
"let tlist_php_setting = 'php;f:function'

" CTRLP
set wildignore+=*/vendor/*,*/app/cache/*,*/app/logs/*
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>M :CtrlPMixed<CR>
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>

" YCM
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" vim-bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" phpcomplete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone

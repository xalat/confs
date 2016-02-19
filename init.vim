set number
syntax enable
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
"set guifont=hack\ 10
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
let g:mapleader = ','

set autoindent                                    " indentation automatique avancée
set smartindent                                   " indentation plus intelligente
set laststatus=2                                  " ajoute une barre de status
set backspace=indent,eol,start                    " autorisation du retour arrière
set history=50                                    " historique de 50 commandes
set ruler                                         " affiche la position courante au sein du fichier
set showcmd                                       " affiche la commande en cours
set shiftwidth=4                                  "
set tabstop=4
set showmatch                                     " vérification présence ([ ou { à la frappe de )] ou  } ])"
set incsearch									  " recherche incrémentale	
set ignorecase
set smartcase

call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'evidens/vim-twig'
Plugin 'msanders/snipmate.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'frankier/neovim-colors-solarized-truecolor-only'

call vundle#end()            
filetype plugin indent on    

" COLOR SCHEME
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme solarized

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

" php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"

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

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" File              : init.vim
" Author            : Hao Zhang <hzhangphys@gmail.com>
" Date              : 01.11.2020
" Last Modified Date: 06.09.2021
" Last Modified By  : Hao Zhang <hzhangphys@gmail.com>
" basic settings
set number
set relativenumber
set hlsearch
set encoding=utf-8

" vim-plug calls, install everything between calls


call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

" auto-completion deoplete
" let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" julia language support in nvim
Plug 'julialang/julia-vim'

" deoplete-jedi
Plug 'zchee/deoplete-jedi'
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

"the status bar

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" auto pair quote and bracket
Plug 'jiangmiao/auto-pairs'
" comment: \ cc uncomment: \ cu
Plug 'scrooloose/nerdcommenter'

" auto format, in command mode, input  Neoformat
Plug 'sbdchd/neoformat'

" NERDTree
Plug 'scrooloose/nerdtree'

" auto header, auto map F4
Plug 'alpertuna/vim-header'
let g:header_field_author = 'Hao Zhang'
let g:header_field_author_email = 'hzhangphys@gmail.com'
let g:header_field_timestamp_format = '%m.%d.%Y'
map <F4> :AddHeader<CR>

" code checker ... flake8, auto map F8
Plug 'nvie/vim-flake8'
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" pydocstring, auto map ctrl + l
Plug 'heavenshell/vim-pydocstring'

" Themes
 Plug 'morhetz/gruvbox'
 set background=dark " use dark mode
" set background=light " uncomment to use light mode

" famous LaTeX plugin vimtex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
set conceallevel=2
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'

" create snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger = '<S-tab>'

" tex conceal
Plug 'pietropate/vim-tex-conceal', {'for': 'tex'}

call plug#end()

" for some reasons, this must be after plug#end
 colorscheme gruvbox

""" Deoplete and vimtex config
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex' : g:vimtex#re#deoplete,
"    \ 'r': '[^. *\t]\.\w*',
"\})

" skeleton for tex
autocmd! BufNewFile *.tex execute "0r ~/.config/nvim/skel/".input("tex template type: aps or note ").".tex"

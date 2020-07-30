" Plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', {'for': 'go'}
", {'do': ':GoUpdateBinaries'}
Plug 'pangloss/vim-javascript'
Plug 'lilydjwg/fcitx.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'itchyny/lightline.vim' 
call plug#end()

" Settings
set number
set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set autoindent
"set laststatus=2
set noshowmode
set nowrap
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
set ttimeoutlen=100 " fcitx.vim, removing escape delay
"highlight Colorcolumn ctermbg=7 guibg=#6c6c6c guifg=white
colorscheme dracula
hi Normal ctermbg=NONE

"============================== Plugins specific settings ==============
"------------------------------------------------------ Lightline
" --- Show Window Number
function! WindowNumber()
	let str=tabpagewinnr(tabpagenr())
	return str
endfunction

" --- Show current time 
function! GetTime()
	let str=strftime('%Y-%m-%d %H:%M')
	return str
endfunction

let g:lightline = {	
	\ 'active': {	
	\ 	'left': [ ['windownumber','mode'], ['paste'],
	\			  ['gitbranch', 'readonly', 'filename','buffers', 'modified'],
	\			],
	\ 	'right': [ [ 'lineinfo' ],
	\            [ 'percent' ],
	\			 ['gettime'],
	\            [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\	},
	\ 'inactive':{
	\	'left':[ ['windownumber'],['filename'],]
	\ },
	\ 'separator': {'left':'▌', 'right':'▐'},
	\ 'component_function': {
	\ 	'windownumber': 'WindowNumber',
	\ 	'gettime': 'GetTime',
	\	},
	\}
" 'separator': {'left':'', 'right':''},
"-------------------------------------------------------------- YCM
let venv = getftype('./venv/bin/activate')
"if (&ft == 'python' && len(venv) > 0)
if len(venv) > 0
	let g:ycm_python_binary_path="./venv/bin/python"
endif

"------------------------------------------------------------- Jump through
"window instantly

let i = 1
while i <= 9
	execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
	let i = i + 1
endwhile

"--------------------------------- Folding

set nofoldenable
set foldnestmax=10
set foldlevelstart=2
nnoremap <Space> za
vnoremap <Space> za

"------------------------------- Goyo + Limelight
" autocmd! BufNewFile,BufRead *.md Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <C-g> :Goyo<CR>

" --------------------------------- Vim wiki
set nocompatible 
filetype plugin on
let g:vimwiki_ext2syntax = {'.md':'markdown', '.markdown':'markdown', '.mdown':'markdown'}
let g:vimwiki_list=[{
			\'path':'~/run/media/gumendol/rex/notes/school',
			\'template_path': '~/vimwiki/templates/',
			\'template_default':'default',
			\'syntax':'markdown',
			\'ext':'.md',
			\'path_html':'~/vimwiki/site_html/',
			\'custom_wiki2html':'vimwiki_markdown',
			\'template_ext':'.tpl'
			\}]

" --------------------------------- NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


set laststatus=2

" ======================= Key mapping
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :TagbarToggle<CR>
nnoremap <C-p>f :Files<CR>
nnoremap <C-p>l :BLines<CR>
nnoremap <C-h>  <C-w>h
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-l>  <C-w>l
nnoremap <F12> :set hlsearch!<CR>
nnoremap <F2> :set iskeyword-=_<CR>
nnoremap <F3> :set iskeyword&<CR>

tnoremap <F9> <C-\><C-n>:tabprev<CR>
tnoremap <F10> <C-\><C-n>:tabnext<CR>
nnoremap <F9> :tabprev<CR>
nnoremap <F10> :tabnext<CR>

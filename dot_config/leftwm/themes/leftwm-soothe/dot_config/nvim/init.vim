let mapleader =","
let maplocalleader = "\\"

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'bagrat/vim-buffet'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ap/vim-css-color'

Plug 'tpope/vim-surround'
Plug 'rbgrouleff/bclose.vim'
Plug 'jreybert/vimagit'
Plug 'LukeSmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
call plug#end()

set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus


" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	set bg=dark
	colorscheme dracula
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Ensure files are read as what I want:
	" let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy to clipboard:
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy

" Paste from clipboard:
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Vim Buffet:
	nmap <leader>1 <Plug>BuffetSwitch(1)
	nmap <leader>2 <Plug>BuffetSwitch(2)
	nmap <leader>3 <Plug>BuffetSwitch(3)
	nmap <leader>4 <Plug>BuffetSwitch(4)
	nmap <leader>5 <Plug>BuffetSwitch(5)
	nmap <leader>6 <Plug>BuffetSwitch(6)
	nmap <leader>7 <Plug>BuffetSwitch(7)
	nmap <leader>8 <Plug>BuffetSwitch(8)
	nmap <leader>9 <Plug>BuffetSwitch(9)
	nmap <leader>0 <Plug>BuffetSwitch(10)

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Coc autocompletion on Tab
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Enable folding
	set foldmethod=indent

" Rust autofmt on save
	let g:rustfmt_autosave = 1

" Word warp
set wrap linebreak nolist

" Markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set conceallevel=2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['csharp=cs', 'rust=rs']
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

let g:NERDTreeDirArrowExpandable = '???'
let g:NERDTreeDirArrowCollapsible = '???'



" let g:airline_powerline_fonts = 1
let g:lightline = {
  \ 'colorscheme': 'dracula'
\}

set termguicolors
let g:dracula_bold      = 1
let g:dracula_italic    = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse   = 1
let g:dracula_colorterm = 1

set noshowmode
let g:buffet_powerline_separators = 1
nmap <leader>t :TagbarToggle<CR>


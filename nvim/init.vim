"
"  __  __        __     ___                    
" |  \/  |_   _  \ \   / (_)_ __ ___  _ __ ___ 
" | |\/| | | | |  \ \ / /| | '_ ` _ \| '__/ __|
" | |  | | |_| |   \ V / | | | | | | | | | (__ 
" |_|  |_|\__, |    \_/  |_|_| |_| |_|_|  \___| 
"         |___/                                
"
let mapleader=" "
syntax on
filetype plugin on
set number 
set wrap
set showcmd
set wildmenu
set mouse=a
set clipboard=unnamedplus

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase 

set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set scrolloff=5
noremap <LEADER><CR> :nohlsearch<CR>

" better backspace
set backspace=indent,eol,start

" set showmatch
" set smartindent
set expandtab

set list lcs=tab:\ \ 

" 折叠
set foldmethod=indent
set foldlevelstart=99

map ; :
map n nzz
map N Nzz

" copy paste
map Y "+y
map P "+p

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map H 0
map L $

" Split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

"set splitright
"set splitbelow
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <UP> :resize+5<CR>
map <down> :resize-5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
" dress up vim
Plug 'connorholyday/vim-snazzy'
" Plug 'rakr/vim-one'
" Plug 'joshdick/onedark.vim'
" Plug 'sickill/vim-monokai'
Plug 'ayu-theme/ayu-vim'
Plug 'raphamorim/lucario'
Plug 'cormacrelf/vim-colors-github'

Plug 'francoiscabrol/ranger.vim' 
Plug 'vimwiki/vimwiki'
" Plug 'SirVer/ultisnips'
Plug 'mg979/vim-visual-multi'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lilydjwg/fcitx.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 
" Plug 'Yggdroot/indentLine'

call plug#end()

"
" indentLine
"
let g:indent_guides_guide_size  = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0


" Color
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Ranger
let g:ranger_map_keys = 0
map <leader>f :Ranger<CR>


" set Vim-specific sequences for RGB colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<ESc>[48;2;%lu;%lu;%lum"
" hi Normal guibg=NONE ctermbg=NONE

set encoding=utf-8

" === coc.config ===
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-css',
      \ 'coc-html']

set hidden
set updatetime=100
set shortmess+=c

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-l> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc translator
nmap <leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)

" ===
"=== markdown preview
"===
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_open_ip = ''
" let g:mkdp_browser = 'chromium'
" let g:mkdp_echo_preview_url = 0
" let g:mkdp_browserfunc = ''
" let g:mkdp_preview_options = {
" 			\ 'mkit': {},
" 			\ 'katex': {},
" 			\ 'uml': {},
" 			\ 'maid': {},
" 			\ 'disable_sync_scroll': 0,
" 			\ 'sync_scroll_type': 'middle',
" 			\ 'hide_yaml_meta': 1
" 			\ }
" let g:mkdp_markdown_css = ''
" let g:mkdp_highlight_css = ''
" let g:mkdp_port = ''
" let g:mkdp_page_title = '「${name}」'

"===
"=== vimwiki
"===
let g:vimwiki_list = [{'path': '~/vimwiki',
  \ 'path_html': '~/vimwiki/wiki',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'custom_wiki2html': '~/.config/nvim/script/convert.py'}]

map <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
  elseif &filetype == 'cpp'
    set splitright
    exec "!g++ -std=c++2a % -Wall -o %<"
    :vsp
    :term ./%<
  elseif &filetype == 'java'
    below vertical term ++shell javac % && java %<
  elseif &filetype == 'sh'
    exec "!time bash %"
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'md'
    exec "MarkdownPreview"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

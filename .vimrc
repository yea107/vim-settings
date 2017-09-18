" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
filetype plugin on
" 編輯喜好設定
syntax on        " 語法上色顯示
set background=dark
"colorscheme solarized
set nocompatible " VIM 不使用和 VI 相容的模式
" set ai         " 自動縮排
set autochdir    " auto cd curent dir.
set shiftwidth=2 " 設定縮排寬度 = 2
set tabstop=2    " tab 的字元數
set softtabstop=2
set expandtab   " 用 space 代替 tab
set autoread
let mapleader=","
let maplocalleader = "\\"
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set nu           " Line number
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set breakindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
set nofoldenable " disable folding
au! BufWritePost .vimrc so % " auto load $MYVIMRC
" Use ':Se pattern filetype' to search
"command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
nmap <leader>s :e$MYVIMRC<CR>

vnoremap // y/<C-R>"<CR>
imap jj <Esc>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
nmap <Up> <C-W>-
nmap <Down> <C-W>+
nmap <Right>  <C-w><
nmap <Left>  <C-w>>
:nnoremap <C-l> :bnext<CR>
:nnoremap <C-h> :bprevious<CR>
"nmap <S-Enter> O<Esc>
"nmap <CR> o<Esc>
inoremap <leader><CR> <CR><C-o>==<C-o>O

" Pathogen on
execute pathogen#infect()
syntax on
filetype plugin indent on

" Taglist setting
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
map <F9> :TlistToggle<CR>

" Air-line setting
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h18
set laststatus=2 " Always show the statusline
let g:airline_powerline_fonts = 1 " enable powerline-fonts
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_format='%s: '
let g:airline_theme='luna'

" Cscope plugin setting
if has("cscope")
  source $VIMRUNTIME/macros/matchit.vim
  filetype indent on

  set cscopetag
  " add any cscope database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add the database pointed to by environment variable
  "elseif $CSCOPE_DB != ""
    "cs add $CSCOPE_DB
  endif
  set cscopeverbose
  nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
  nnoremap <leader>l :call ToggleLocationList()<CR>
  " s: Find this C symbol
  nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
  " g: Find this definition
  nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
  " d: Find functions called by this function
  nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
  " c: Find functions calling this function
  nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
  " t: Find this text string
  nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
  " e: Find this egrep pattern
  nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
  " f: Find this file
  nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
  " i: Find files #including this file
  nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
endif

" ctags setting
set tags=./tags;

" toggle NERDTree with F2
map <F2> :NERDTreeToggle<CR>
map <Leader><Leader> <plug>NERDCommenterToggle
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" For ctrlp setting
let g:ctrlp_working_path_mode = 'c' " let ctrlp current folder
let g:ctrlp_show_hidden = 1 " show hidden file in ctrlp
"unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$|Library$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" For easymotion setting
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Space> <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Space> <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" BBye
nnoremap <Leader>q :Bdelete<CR>

" For vim-better-whitespace setting
autocmd BufWritePre * StripWhitespace " strip whitespace when save

" Emmet
let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall


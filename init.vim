let g:python3_host_prog = '/home/zhubiyun.zby/.local/bin/python3'

" -- ------
" -- ------ Install all the plugins when opening it for the first time
" -- ------

if empty(glob('~/.config/nvim/plugged/'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -- ------
" -- ------ Plugins  https://vimawesome.com/
" -- ------
call plug#begin('~/.config/nvim/plugged')

" -- 配色
Plug 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox

" -- 显示缩进
" Plug 'yggdroot/indentline'
" let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
" let g:indent_guides_start_level           = 2  " 从第一层开始可视化显示缩进

" -- nerdtree 文件树
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let NERDTreeWinPos = "left"
let NERDTreeWinSize = 30
" 去除第一行的帮助提示
let NERDTreeMinimalUI=1
" 不显示行号
let NERDTreeShowLineNumbers=0
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
let NERDTreeWinSize=45
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.o$', '\~$', 'compile_commands.json']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2
" 快捷键映射
nnoremap <F2> :NERDTreeToggle<CR>

" 可以使 nerdtree Tab 标签的名称更友好些
Plug 'jistr/vim-nerdtree-tabs'
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" -- 语法树&tag跳转
Plug 'majutsushi/tagbar'
" majutsushi/tagbar 插件打开关闭快捷键
nmap <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
" 位置设定
let g:tagbar_left=1
" let g:tagbar_vertical = 25
let g:tagbar_sort = 0 "close the sort
" 去除第一行的帮助信息
let g:tagbar_compact = 1
" 当编辑代码时，在Tagbar自动追踪变量
let g:tagbar_autoshowtag = 1
let g:tagbar_show_visibility = 1
set ut=10 "updatetime in ms
let g:tagbar_scrolloff = 10
let g:tagbar_highlight_follow_insert = 1
let g:tagbar_highlight_method = 'nearest'
" 自动打开tagbar
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" -- 在导航目录看到git版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" -- 括号配对
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" -- 状态栏
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0

" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" -- 括号补全
Plug 'jiangmiao/auto-pairs'

" -- 根据内容自动获取文件类型
Plug 'Shougo/context_filetype.vim'
" -- 自动进行注释
Plug 'tyru/caw.vim'
" ctrl+/
nmap <C-_> gcc
vmap <C-_> gcc

" -- 全局搜索文件
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_root_markers = ['.project']
" let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v\.(o|gcno|gcda|a|so)$'

" -- 显示 git 信息
" Plug 'airblade/vim-gitgutter'

" -- coc.nvim，自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc下载插件
let g:coc_global_extensions = [
\  'coc-marketplace',
\  'coc-json',
\  'coc-clangd',
\  'coc-pyright'
\   ]
" 允许未保存文件时跳转文件
set hidden
" Give more space for displaying messages.
set cmdheight=2
" 增加响应
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" tab做扩展键
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 用enter键补全选择时不自动切换到下一行
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 使用gd来跳转到函数定义处、gy获取类型定义，
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
nnoremap <silent> <Leader>gf :<C-u>CocList grep<CR>

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" -- 支持coc-settings.json格式
Plug 'kevinoid/vim-jsonc'
" autocmd FileType json syntax match Comment +\/\/.\+$+

" 悬浮终端
" Plug 'voldikss/vim-floaterm'

" 显示git blame信息
Plug 'apzelos/blamer.nvim'
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_relative_time = 1

" -- 多关键字高亮
Plug 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" nmap <Space>j <Plug>(quickhl-cword-toggle)
" nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

call plug#end()

" -- ------
" -- ------ 键位设置
" -- ------
" 搜索居中
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

inoremap jj <Esc>:w<CR>

" 向上跳转<C-o>
" 向下跳转<C-i>
" 垂直分割窗口 <C-w>v

" -- ------
" -- ------ 基础配置
" -- ------
set nu
set showcmd
" set autochdir
set tabstop=4
set expandtab    " tab扩展成空格
set incsearch
set hlsearch
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释
set colorcolumn=80
set showmatch " 显示括号匹配
set cursorline " 突出显示当前行
set belloff=all
set noswapfile " 不产生交换文件
set termguicolors

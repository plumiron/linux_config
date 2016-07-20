set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'klen/python-mode'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'fisadev/vim-isort'
Plugin 'scrooloose/syntastic'

Plugin 'matchit.zip'
Plugin 'phillipberndt/python-imports.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===== Plugins settings =====
" ----- Tagbar -----
nmap <F4> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 25
let g:tagbar_zoomwidth = 0
let g:tagbar_compact=1

" ----- Nerdtree -----
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" ----- Syntastic -----
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 0

" ----- Python-mode -----
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'

"----- NeoComplCache -----
" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

"----- Autoclose -----
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

"----- Airline -----
let g:airline_powerline_fonts = 0
" let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" 显示相关  
syntax on
set cul "高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
color ron     " 设置背景主题  
set guifont=Courier_New:h10:cANSI   " 设置字体  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
"set foldenable    " 允许折叠
"set foldmethod=manual   " 手动折叠
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
set autoindent        " 自动缩进
set cindent
set tabstop=4         " Tab键的宽度
set softtabstop=4     " 统一缩进为4
set shiftwidth=4
set expandtab         " 用空格代替制表符
set smarttab          " 在行和段开始处使用制表符
set number            " 显示行号
set history=1000      " 历史记录数
set hlsearch          " 搜索逐字符高亮
set incsearch
set langmenu=zh_CN.UTF-8 " 语言设置
set helplang=cn
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set cmdheight=1       " 总是显示状态行
filetype on           " 侦测文件类型
:filetype plugin on    " 载入文件类型插件
:filetype indent on    " 为特定文件类型载入相关缩进文件
set viminfo+=!        " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割


" 新建文件时自动填入文件头
" 新建.py, .pl
autocmd BufNewFile *.py,*.pl exec ":call SetTitle()"
"" 定义函数SetTitle，自动插入文件头  
func SetTitle() 
    if (&filetype == "python")
        call setline(1, "# -*- coding: utf-8 -*-")
        call setline(2, "#")
        call setline(3, "# Author: Plumiron")
        call setline(4, "#")
        call setline(5, "# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call setline(6, "# Description:")
        call setline(7, "#")
    endif
    if (&filetype == "perl")
        call setline(1, "#")
        call setline(2, "# Author: Plumiron")
        call setline(3, "#")
        call setline(4, "# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call setline(5, "# Description:")
        call setline(6, "#")
        call setline(7, "")
        call setline(8, "use strict;")
        call setline(9, "use warnings;")
    endif
    autocmd BufNewFile * normal G
endfunc

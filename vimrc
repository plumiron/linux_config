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
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
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

" tagbar
let g:tagbar_left = 1
let g:tagbar_width = 25
let g:tagbar_zoomwidth = 0
let g:tagbar_compact=1
nmap <F8> :TagbarToggle<CR>

" nerdtree
nmap <F7> :NERDTreeToggle<CR>

" indentLine
let g:indentLine_char = '┊'

" python-imports
let g:PythonAutoAddImports = 1

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
set cmdheight=1       " 总是显示状态行
filetype on           " 侦测文件类型
filetype plugin on    " 载入文件类型插件
filetype indent on    " 为特定文件类型载入相关缩进文件
set viminfo+=!        " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割

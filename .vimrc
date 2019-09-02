" 加载.vimrc.bundles文件  vundle的配置文件
if filereadable(expand("~/.vimrc.bundles"))
   source ~/.vimrc.bundles
endif

"===========================================================================

colorscheme 	space-vim-dark   " 主题

"===========================================================================

" 将<leader>键映射为,
let mapleader=","

" 使用 ,w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap  <leader>w :w<cr>

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" sudo to save
cmap w!! w !sudo tee >/dev/null %

" use ,t generate tags
nmap <leader>t :!ctags-exuberant -R --fields=+lS *

" use ctrl+p/n switch file buffer
nmap <C-p> :bp<cr>
nmap <C-n> :bn<cr>

"===========================================================================
filetype on             " 检测文件类型
filetype indent on      " 根据不同语言类型进行不同的缩进
set t_Co=256            " 设置256色
set nu                  " 显示行号
set showcmd             " 显示输入命令
set cursorline          " 显示当前行
set cursorcolumn        " 显示当前列
set encoding=utf-8      " 使用utf-8编码
set autoindent          " 设置自动缩进
set smartindent         " 设置智能缩进
set ts=4                " 设置tab长度为4
set shiftwidth=4
set softtabstop=4
set expandtab           " 使用空格替换tab
set foldmethod=manual   " 设置手动折叠

set timeoutlen=100      " 解决O向上插入延迟问题
set viminfo='100,<500   " 解决只能复制50行问题
set completeopt=longest " 解决c++类中public，private格式问题

set laststatus=2        " 显示状态栏
set hls                 " 设置高亮查找
set wildmode=list:longest  " 命令行补全
set nocompatible        " 关闭与vi的兼容
set nobackup            " 不创建备份文件
set noswapfile          " 不生成临时文件
set foldmethod=manual   " 设置手动折叠

set clipboard=unnamed   " 使用系统剪切板

" 保留上次折叠  设置后可能出现自动缩进8个空格的问题
"au BufWinLeave * silent mkview
"au BufWinEnter * silent loadview

" ARM汇编 .S 文件高亮显示
au BufNewFile,BufRead *.S set filetype=masm

" 记住上次编辑和浏览位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" cscope
""""""""""""""""""""""""""""""""""""""""""""
" 安装: sudo apt install cscope
" 建立数据库: cscope -Rbq
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

" F5: 查找C语言符号  F6: 查找字符串 F7: 查找函数被调用
nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""

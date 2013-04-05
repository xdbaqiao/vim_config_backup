execute pathogen#infect()
"新建文件时自动插入头文件
"
autocmd BufNewFile *.py  exec ":call SetPy()"
func SetPy()
	call setline(1, "#!/usr/bin/env python2")
	call append(line("."), "# coding: utf-8")
	call append(line(".")+1, "") 
	call append(line(".")+2, "import re") 
	call append(line(".")+3, "from webscraping import download, xpath, common, adt")
	call append(line(".")+4, "") 
	call append(line(".")+5, "if __name__ == '__main__':") 
endfunc

autocmd BufNewFile *.c,*.cpp  exec ":call SetTitle()"
func SetTitle()
    call setline(1, "/*************************************************************************")
	call append(line("."), "* File Name: ".expand("%"))
	call append(line(".")+1, "* Author: yexinjing")
	call append(line(".")+2, "* Mail: yexj061761@gmail.com")
	call append(line(".")+3, "* Created Time: ".strftime("%c")) 
	call append(line(".")+4, "*************************************************************************/") 
	call append(line(".")+5, "")
    if expand("%:e") == "cpp"
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <iostream>")
		call append(line(".")+8, "#include <vector>")
		call append(line(".")+9, "#include <algorithm>")
		call append(line(".")+10, "#include <string>")
		call append(line(".")+11, "#include <cmath>")
		call append(line(".")+12, "#include <sstream>")
		call append(line(".")+13, "#include <cstdlib>")
        call append(line(".")+14, "#include <cstring>")
        call append(line(".")+15, "#include <deque>")
        call append(line(".")+16, "#include <list>")
		call append(line(".")+17, "")
		call append(line(".")+18, "using namespace std;")
		call append(line(".")+19, "int main(int argc, char *argv[])")
		call append(line(".")+20, "{")
		call append(line(".")+21, "")
		call append(line(".")+22, "    return 0;")
		call append(line(".")+23, "}")
	endif
    if expand("%:e") == "c"
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
		call append(line(".")+8, "int main(int argc, char *argv[])")
		call append(line(".")+9, "{")
		call append(line(".")+10, "")
		call append(line(".")+11, "    return 0;")
		call append(line(".")+12, "}")
	endif
    autocmd BufNewFile *.cpp normal G
endfunc


"允许vim为不同类型的文件定义不同的缩进格式
"设置python的缩进
filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4

set history=1000     "历史记录数
set nocompatible     "兼容问题
syntax on            "文本高亮
set hlsearch         "搜索反白
set autoindent       "自动缩进
set number           "显示行号
set ts=4             "设置Tab为4格
set sw=4             "设置行交错时为4格
set ruler            "右下角总是显示标尺
set showcmd          "输入的命令总是显示
set incsearch		 "增进式搜索
set pastetoggle=<F9> "粘贴时按F9,代码不会自动缩进
set backspace=indent,eol,start        "回车设置
set so=7 "光标在窗口上下边界时距离边界7行即开始滚屏
"set lines=45 columns=162   "  设定窗口大小  

"字体编码设置 
set langmenu=zh_CN.utf8
set fileencodings=utf-8,cp936,big5,latin1
set ambiwidth=double
set enc=utf-8

"修改文件不进行备份
if has("vms")
  set nobackup		
endif


if has("autocmd")
  filetype plugin indent on " 开启文件类型探测, 使用默认的文件类型设置
  augroup vimrcEx " 自动命令分组
  au!
  autocmd FileType text setlocal textwidth=78 " 设置78断行
  " 打开文件时记住上一次的位置
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
endif

"设置鼠标
if has('mouse')
  set mouse=
endif

"taglist 设置
let Tlist_Use_Right_Window=1 "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open=1   "默认打开Tlist
let Tlist_Show_One_File=1 "设置退出形式
let Tlist_Exit_OnlyWindow=1
set tags=/home/bingo/2011安全竞赛/home/newpro/tags

" 自动补齐括号书名号引号等设置
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

"空格代替Tab
set expandtab
au Filetype make set noexpandtab

map <F3> :tabnew .<CR> "F3列出当前目录文件 

"powerline 配置相关
let g:Powerline_symbols = 'fancy'
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
set gfn=Monospace\ 12
let g:Powerline_cache_enabled = 1

"vim 颜色配置
colorscheme delek

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

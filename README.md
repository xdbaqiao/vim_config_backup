My vim configuration backup.    
====
**It's my simple vim configuration.**

Main plugins:    
[vim-powerline](https://github.com/Lokaltog/vim-powerline)     
[vim-makedown](https://github.com/plasticboy/vim-markdown)   
[vim-octopress](https://github.com/tangledhelix/vim-octopress)   
[CoVim](https://github.com/FredKSchott/CoVim)      
[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
    
直接使用会报错：    
    E117: Unknown function: pathogen#infect
解决方法：    
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

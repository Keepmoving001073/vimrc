if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
"set cursorcolumn
set ts=4
set t_Co=256
set background=dark
set expandtab
colorscheme PaperColor
"colorscheme gruvbox
set nocompatible    " Use Vim defaults (much better!)
set shiftwidth=4
set cindent
set autoindent
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set nu
set so=7
set smartindent
set tabstop=4
set shiftwidth=4
set laststatus=2
set nocompatible                " be iMproved
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
set cc=80

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
     "add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <c-d> :cs find d <C-R>=expand("<cword>")<CR><CR>

map <F5> :!sh ./flush.sh<CR><CR>

filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Plugin 'morhetz/gruvbox'
Bundle 'gmarik/vundle'
"Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
Bundle 'DoxygenToolkit.vim'

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
nmap <F4> :YcmDiags<CR>
nmap <leader>gc :YcmCompleter GoToDeclaration<CR>
nmap <leader>gf :YcmCompleter GoToDefinition<CR>
nmap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:syntastic_error_symbol='✗'
"设置警告符号
let g:syntastic_warning_symbol='⚠'
"是否在打开文件时检查
let g:syntastic_check_on_open=0
"是否在保存文件后检查
let g:syntastic_check_on_wq=1
let g:ycm_collect_identifiers_from_tags_files=0
"缩进指示线"
let g:indentLine_enabled = 1

nmap <F9> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 60
let g:tagbar_autoclose = 1
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }
filetype plugin indent on

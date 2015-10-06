set nocompatible
execute pathogen#infect()
filetype plugin indent on


""" COLORS
syntax enable
set t_Co=16
set background=dark


""" FILETYPES
au BufNewFile,BufRead *.html set filetype=htmldjango


""" TABS AND SPACES
set tabstop=4     " number of visual spaces per tab
set shiftwidth=4  " Indents will have a width of 4
set softtabstop=4 " number of spaces in tabs when editing
set expandtab     " tabs are spaces, spaces are tabs (wait no...)


""" C Options
set autoindent " Use indentation from previous line
set cindent " Use intelligent indentation for C
set showmatch " show matching braces


""" UI CONFIG
set number         " show line numbers
set showcmd        " show command in bottom bar

set cursorline
highlight CursorLine ctermbg=0 cterm=NONE

set colorcolumn=81 " highlight column 81
highlight ColorColumn ctermbg=0 


""" STYLE
" Uncomment following two lines to highlight ExtraWhiteSpace
" :highlight ExtraWhitespace ctermbg=red guibg=red
" :autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/


""" OTHER
set hidden      " leave hidden buffers open
set history=100 " by default vim saves your last 8 commands, we can handle more


""" CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

""" MAPPINGS
map <leader>rr :source ~/.vimrc<CR>

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" Set Python indentation options
au FileType python setl tabstop=4 shiftwidth=4 expandtab softtabstop=4

" Set pyflakes to run after saving a buffer.
au BufWritePost *.py !pyflakes %

" Autoindent all files.
set autoindent
" Appearance
syntax on
set background=dark
colorscheme ir_black
set t_Co=256

" Misc
set number " Line numbers.



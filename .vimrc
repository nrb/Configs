call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" Set Python indentation options
au FileType python setl tabstop=4 shiftwidth=4 expandtab softtabstop=4

" Autoindent all files.
set autoindent
" Appearance
syntax enable
set cursorline " Hightlight the current line.


" Make whitespace characters show up.
set list listchars=tab:▷\ ,eol:¬

" Misc
set number " Line numbers.

if has("gui_running")
" Remove the GUI toolbar in MacVim.
    set guioptions=egmrt
    colorscheme Tomorrow-Night
    set background=dark
else
    " Use ir_black on the terminal.
    colorscheme ir_black
    set background=dark
    " Set 256 colors.
    set t_Co=256
endif

" Ugly hack to keep whitespace-only lines indented.
inoremap <CR> x<BS><CR>


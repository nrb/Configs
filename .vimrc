call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" Enable spellchecking
set spell spelllang=en_us

" Set leader key.
let mapleader = ","

" Set Python indentation options
au FileType python setl tabstop=4 shiftwidth=4 expandtab softtabstop=4
au FileType html setl tabstop=4 shiftwidth=4 expandtab softtabstop=4
au FileType rst setl tabstop=4 shiftwidth=4 expandtab softtabstop=4
au FileType djangohtml setl tabstop=4 shiftwidth=4 expandtab softtabstop=4

" Ruby indentation options
au FileType ruby setl tabstop=2 shiftwidth=2 expandtab softtabstop=2

" Make vagrant and guard files be recognized as ruby.
au BufRead,BufNewFile Vagrantfile set ft=ruby
au BufRead,BufNewFile Guardfile set ft=ruby

" Javascript indentation
au FileType javascript setl tabstop=2 shiftwidth=2 expandtab softtabstop=2

" Global tab settings for:
set ts=4 sts=4 sw=4 expandtab


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
    set guifont=Ubuntu\ Mono:h14
else
    " Use ir_black on the terminal.
    colorscheme solarized
    set background=dark
    " Set 256 colors.
    " set t_Co=256
endif
" Status line fancies.
set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %Pe

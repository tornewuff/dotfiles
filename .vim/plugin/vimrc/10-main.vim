" Stuff from debian's /etc/vim/vimrc
syntax on
set background=dark
if has("autocmd")
  filetype plugin indent on
endif
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch

" Other stuff
set modeline
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

let python_hilight_numbers = 1
let python_hilight_space_errors = 1
autocmd FileType python set sw=4 sta sts=4 et tw=79
autocmd FileType html set sw=2 sta sts=2 et
autocmd FileType javascript set sw=4 sta sts=4 et

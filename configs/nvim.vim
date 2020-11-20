set shell=/bin/bash
set so=7
set ai
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set title
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmode=longest,list,full
set wildmenu
set showcmd
set hidden
set report=0
set numberwidth=1
set lazyredraw
set ttyfast
set directory=/var/tmp
set backspace=indent,eol,start
set updatetime=300
set cmdheight=1
set nowrap
set cursorline
set autoread

" Highlights Cursorline 
" hi CursorLine cterm=NONE ctermbg=509 ctermfg=495 guibg=grey guifg=white

" Gutter
hi clear SignColumn
"highlight SignColumn ctermbg=none
"set signcolumn='auto:3'


" Colors
" https://jonasjacek.github.io/colors/

" Folding
"set foldmethod=syntax "syntax highlighting items specify folds
"set foldcolumn=1 "defines 1 col at window left, to indicate folding
"let javaScript_fold=1 "activate folding by JS syntax
"set foldlevelstart=99 "start file with all folds opened
"hi Folded ctermbg=NONE
"hi Folded ctermfg=NONE

syntax on
syntax enable
silent !stty -ixon > /dev/null 2>/dev/null
"nnoremap <CR> :nohlsearch<CR>
let mapleader = ","

" Auto remove trailing whitespaces
autocmd FileType typescript,javascript,c,cpp,java,php,scala,python,ruby autocmd BufWritePre <buffer> %s/\s\+$//e 

" Auto Resize windows
autocmd VimResized * wincmd =

" Trigger refresh file on (& if) disk change whenever cursor stops moving
au CursorHold,CursorHoldI * checktime

call plug#begin(stdpath('data') . '/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
       " Plugins for Vim Fugitive GBrowse
       Plug 'tommcdo/vim-fubitive' " Bitbucket
       Plug 'tpope/vim-rhubarb' " Github
  Plug 'ruanyl/vim-gh-line'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  "Themes
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'jeffkreeftmeijer/vim-dim'

  " Languages
  Plug 'rust-lang/rust.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'derekwyatt/vim-scala'
  Plug 'chrisbra/csv.vim'
  Plug 'GEverding/vim-hocon'
  Plug 'digitaltoad/vim-pug'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " To Install specific language servers
    " :CocInstall coc-tsserver coc-json coc-html coc-css coc-eslint

call plug#end()

""" Theme
colorscheme dim

""" Key mappings
nnoremap <Leader>e :vsplit $MYVIMRC<CR>
nnoremap <Leader>s :so $MYVIMRC<CR>
nnoremap <Leader>b :Gblame<CR>
nnoremap <C-o> :copen<CR>
map } :execute "cnext"<CR>
map { :execute "cprev"<CR>
" Toggle fold
" nnoremap <tab> za
" Tab Navigation
map <C-t>l :execute "tabnext"<CR>
map <C-t>h :execute "tabprev"<CR>

""" NERDTREE
map <C-e> :NERDTreeToggle<CR>
let NERDTreeMapOpenVSplit = '<C-v>'
let NERDTreeMapOpenInTab = '<C-t>'
let NERDTreeMapOpenSplit = '<C-s>'

""" COC 
" Tab for autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><nowait> ga  :<C-u>CocList diagnostics<cr>

" Symbol renaming.
nmap <leader>gn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


""" FZF
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-s> :RG<CR>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

""" FILE SPECIFIC
au FileType fish compiler fish
au BufNewFile,BufRead *.pegjs set filetype=javascript
au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.cjsx set filetype=javascript
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.cap set filetype=ruby
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.pug set filetype=pug
au BufNewFile,BufRead Gemfile set filetype=ruby
au! BufRead,BufNewFile *.json set filetype=json
au! FileType c,cpp,java,php call CSyntaxAfter()
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let g:lightline =  {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'fugitive', 'filename', 'modified' ],
      \             [ 'cocstatus' ] ],
      \   'right': [['lineinfo'], ['percent'], ['fileencoding', 'filetype']]
      \ },
      \ 'inactive': {
      \   'left': [['filename']],
      \   'right': [['lineinfo'], ['percent']]
      \ },
      \ 'component_function': {
      \   'fugitive': 'FugitiveStatusline',
      \   'cocstatus': 'coc#status'
      \ }
      \ }
" Auto update lightline
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

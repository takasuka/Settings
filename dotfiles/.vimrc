"set nocompatible
"filetype off
"if has('vim_starting')
"    set runtimepath+=~/.vim/neobundle.vim.git
"    call neobundle#rc(expand('~/.vim/'))
"endif
"
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'tpope/vim-surround'
"NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'LeafCage/foldCC'
""NeoBundle 'mattn/webapi-vim'
""NeoBundle 'thinca/vim-openbuf'
""NeoBundle 'choplin/unite-vim_hacks'
""NeoBundle 'altercation/vim-colors-solarized'
""NeoBundle 'vim-scripts/DirDiff.vim'
"NeoBundle 'vim-scripts/wombat256.vim'
"NeoBundle 'opsplorer'
filetype plugin indent on

" ============================================================================= 
"colorscheme wombat256mod 
"colorscheme jellybeans
colorscheme desert
syntax enable
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set background=light
set number
set cursorline
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=marker
set laststatus=2
set statusline=%F%m%r\ [%{&fileencoding}][%{&fileformat}]\ \%y\ %=%c,%l%11p%%
set incsearch
set ignorecase              " 大文字小文字区別しない
set smartcase               " 検索パターンに大文字含まれたら区別するよ
set scrolloff=999           " 常にカーソル行を真ん中に
set completeopt=menuone     " 補完候補が一つしかなくてもポップアップメニューを表示します。補完候補の情報を見るのに便利です。
highlight Visual ctermbg=DarkGray
highlight Pmenu  ctermbg=DarkGray
highlight PmenuSel  ctermbg=Black
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" ============================================================================= 

" ============================================================================= 
" key mapping
nnoremap <silent> date : r! date "+\%Y/\%m/\%d \%A" <CR>
" snippet展開対応済み
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk
" USキーボード対策
noremap ; :
" ============================================================================= 

" ============================================================================= 
" neocomplcache
let g:neocomplcache_enable_at_startup = 1                   " 起動時有効化
let g:neocomplcache_enable_smart_case = 1                   " smartcase有効化（大文字が入力されるまで小文字・大文字の違いを無視）

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" tab補完
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" ============================================================================= 
" ref.vim
let g:ref_phpmanual_path = $HOME . '/.vim/bundle/vim-ref/php-chunked-xhtml'
" ============================================================================= 

" ============================================================================= 
" Unite
nnoremap <silent> :ub : Unite -auto-resize  -no-quit -buffer-name=buffer buffer:! <CR>
nnoremap <silent> ;ub : Unite -auto-resize  -no-quit -buffer-name=buffer buffer:! <CR>
nnoremap <silent> :ud : Unite -winheight=15 -no-quit -buffer-name=files  file file_rec file_mru <CR>
nnoremap <silent> ;ud : Unite -winheight=15 -no-quit -buffer-name=files  file file_rec file_mru <CR>
nnoremap <silent> :ug : Unite -winheight=15 -no-quit -buffer-name=grep   grep <CR>
nnoremap <silent> ;ug : Unite -winheight=15 -no-quit -buffer-name=grep   grep <CR>
" ============================================================================= 

" ============================================================================= 
" PHP向け
autocmd BufWritePost *.php :call PHPLint()                                                                                                                                          
function PHPLint()
  let error = system(&ft . ' -l ' . bufname(''))
  if strpart(error, 0, 16) != 'No syntax errors'
    echo error
  endif
endfunction
" ============================================================================= 

" ============================================================================= 
" foldmethod
hi Folded gui=bold term=standout ctermfg=DarkBlue
set foldtext=FoldCCtext()
" ============================================================================= 

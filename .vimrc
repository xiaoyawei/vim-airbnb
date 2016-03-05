set nocompatible
let g:EclimCompletionMethod='omnifunc'
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
au BufWinEnter,BufNewFile * silent tab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

setlocal textwidth=100
set colorcolumn=101
au BufEnter <buffer> set colorcolumn=101

set textwidth=100
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

set encoding=utf-8

" syntax
" define <Leader>
let mapleader=";"

syntax enable
syntax on
" display line number
set number
" detect filetype
filetype on
filetype indent on
filetype plugin on

" set color theme
set t_Co=256
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme dusk

" no cursor blinking
" set gcr=a:block-blinkon0
" show status
set laststatus=2

" code folding
" set foldmethod=indent
set foldmethod=syntax
" auto start code folding
set nofoldenable

" block from linux custom begins
" do not display nonreadable chars
set nolist
" display coordinate info
set ruler
" display command info
set showcmd
" highlight the current line
set cursorline
" set cursorcolumn
" quick jump to the matched parenthesis
" set showmatch
" highlight the unmatched parenthesis
let loaded_matchparen=1

" highlight the matched pattern
set hlsearch
" block from linux custom ends

" block from linux custom begins
" find the lines with blanks at end (fs -> find space)
map <leader>fs :/.*\s\+$<CR>
" delete the blanks at the line end (res -> remove end space)
map <leader>res :s#\s\+$##<CR>
" block from linux custom ends

" no highlight
map <Leader>nh :nohl<CR>

" complete


" shortcuts for line begining and end nmap lb ^
nmap lb ^
nmap le $
" copy to X buffers
vnoremap <Leader>y "+y
" paste from X buffers
nmap <Leader>p "+p
" exit current window
nmap <Leader>q :q<CR>
" save current window
nmap <Leader>w :w<CR>
" save all window and exit vim
nmap <Leader>WQ :wa<CR>:q<CR>
" force to quit vim
nmap <Leader>Q :qa!<CR>
" next window
nnoremap <Leader>nw <C-W><C-W>
" jump to the right window
nnoremap <Leader>lw <C-W>l
" jump to the left window
nnoremap <Leader>hw <C-W>h
" jump to the upper window
nnoremap <Leader>kw <C-W>k
" jump to the lower window
nnoremap <Leader>jw <C-W>j
" jump between pairs of parenthesiss
" pa -> pair
nmap <Leader>pa %
" jump to next word
nmap <Leader>n *
" jump to previous word
nmap <Leader>p #

" turn on real-time search
set incsearch
" get case insensitive during search
set ignorecase
" turn of compatible mode
set nocompatible
" smart complete
set wildmenu

" specify path for pathogen
runtime bundle/pathogen/autoload/pathogen.vim
" run pathogen
execute pathogen#infect()

" skip parenthesiss
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '>'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
inoremap <Leader>a <c-r>=SkipPair()<CR>

" manual append parenthesis
func ClosePairs()
  if getline('.')[col('.') - 2] == '('
    return ")\<ESC>i"
  elseif getline('.')[col('.') - 2] == '['
    return "]\<ESC>i"
  elseif getline('.')[col('.') - 2] == '{'
    return "}\<ESC>i"
  elseif getline('.')[col('.') - 2] == "\'"
    return "\"\<ESC>i"
  elseif getline('.')[col('.') - 2] == "\""
    return "\"\<ESC>"
  else
    return ""
  endif
endfunc
inoremap <Leader>v <c-r>=ClosePairs()<CR>

" configs for vim-signature
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" traverse the named tags
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

" function to replace. args:
" confirm: whether to confirm before replacement
" wholeword: to match wholeword
" replace: string to replace
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" no confirm, not wholeword
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" not confirm, wholeword
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm, not wholeword
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm and wholeword
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" code template
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" use NERDTree. fl -> file list
nmap <Leader>fl :NERDTreeToggle<CR>
" set window width
let NERDTreeWinSize=32
" set window position
let NERDTreeWinPos="right"
" display hidden file
let NERDTreeShowHidden=0
" no redundant info
let NERDTreeMinimalUI=1
" remove buffer
let NERDTreeAutoDeleteBuffer=1

" show/hide MiniBufExplorer window
map <Leader>bl :MBEToggle<cr>
" shortcut for switch
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>
map <Leader>bd :MBEbd<cr>

" setup for environment saving
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" save undo history
set undodir=~/.undo_history/
set undofile
" shortcut for saving environment
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" shortcut for restoring environment
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" deploy the gundo tree
nnoremap <Leader>ud :GundoToggle<CR>

" color theme for YcmCompleter
" menu
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" items
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" toggle for trailing whitespaces highlights
map <Leader>tw :ToggleWhitespace<cr>

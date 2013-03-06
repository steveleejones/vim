set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set timeoutlen=1000
" test text.
" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen au FileType cs set omnifunc=syntaxcomplete#Complete
"au FileType cs set foldmethod=marker
"au FileType cs set foldmarker={,}
"au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
"au FileType cs set foldlevelstart=2  

set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set gfn=Courier_New:h8:cANSI

set number

set nobackup

map <f3> :NERDTreeToggle %:p:h<cr>
imap <f3> <esc>:NERDTreeToggle<cr>i

let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

let NERDTreeWinPos="right"

set nocp
filetype plugin on

map <f2> :TlistToggle <cr>
imap <f2> <esc>:TlistToggle<cr>i
"let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Width = 90

set lines=60 columns=175

:hi CursorLine   cterm=NONE ctermbg=lightgray guibg=lightgray 
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

:set errorformat=\ %#%f(%l\\\,%c):\ %m

colorscheme torte

imap jj <esc>
map <F5> !bmake
nnoremap gd gdzz
nnoremap n nzz
nnoremap N Nzz
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
nnoremap Y y$

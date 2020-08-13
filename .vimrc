if has("gui_running") 
    call plug#begin('~\vimfiles\plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'https://github.com/mileszs/ack.vim.git'
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/sainnhe/artify.vim.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/macthecadillac/lightline-gitdiff.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/haishanh/night-owl.vim.git'
Plug 'https://github.com/chrisbra/NrrwRgn.git'
Plug 'https://github.com/passimm/onehalf_vim.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://github.com/ryanoasis/vim-devicons.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/itchyny/vim-gitbranch.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/lifepillar/vim-solarized8.git'

call plug#end()

set nocp
"don't ignore case when searching
set noic
"General Settings
:filetype plugin on
:syntax on
"this line disable BG color erase,to enable tmux use colorscheme's bg color
set t_ut=
"set cursorline
set showcmd
set autoread
set autowrite
set hlsearch
set incsearch
set ignorecase smartcase
set autoindent
set smartindent
set cindent
set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e
set iskeyword=a-z,A-Z,48-57,_
filetype plugin indent on
"tab Settings
"####tab width
set shiftwidth=4
set tabstop=4
set softtabstop=4
"####end tab width
set expandtab
set backspace=2
set laststatus=2
set ruler
set splitright
set splitbelow
set mouse-=a
"set mouse=i
"set nu
set nofixendofline
set scrolloff=999 "cursor always in middle
"nobackup
set nobackup
set nowritebackup

if has("gui_running") 
au GUIEnter * simalt ~x  " 窗口启动时自动最大化 
au VimResized * wincmd =  "evenly resize each window
set guioptions-=m " 隐藏菜单栏 
set guioptions-=T " 隐藏工具栏 
set guioptions-=L " 隐藏左侧滚动条 
set guioptions-=r " 隐藏右侧滚动条 
set guioptions-=b " 隐藏底部滚动条 
set showtabline=0 " 隐藏Tab栏
"set guifont=Iosevka:h11:cANSI:qDRAFT
set guifont=FantasqueSansMono_NF:h12:cANSI:qDRAFT
"set guifont=Source_Code_Pro:h11:cANSI:qDRAFT
set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
"set linespace=0
endif 

set statusline=
set statusline+=\[%f:%l
"switch to right side
"set statusline+=%=
set statusline+=\ @Col:%c\]
"set fillchars=stl:,stlnc:,vert:\|,fold:-,diff:-
set fillchars=vert:\|,fold:-
set complete=.,w,b,u,t

autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif

"let search result always appear in middle
nnoremap n nzz
nnoremap N Nzz
let s:searchmode = 2

"imm ab
iab cpp_main #include <iostream>
\<CR>using namespace std;
\<CR>int main() {
\<CR>return 0;
\<CR>}
iab py_main #!/home/opt/python2.7.8/bin/python
iab divs <div styleName=""><CR></div>
iab debug_print printf("mx: at %s(%d)\n", __FILE__, __LINE__);
iab ri< reinterpret_cast<
iab si< static_cast<
iab react0 import React from 'react';
\<CR>import PT from 'prop-types';
\<CR>
\<CR>class Map extends React.Component {
\<CR>render() {
\<CR>}
\<CR>}
\<CR>
\<CR>Map.defaultProps = {
\<CR>};
\<CR>
\<CR>Map.propTypes = {
\<CR>};
\<CR>
\<CR>export default Map;

iab react1 import React from 'react';
\<CR>import PT from 'prop-types';
\<CR>
\<CR>const Map = () => {
\<CR>};
\<CR>
\<CR>Map.defaultProps = {
\<CR>};
\<CR>Map.propTypes = {
\<CR>};

cab tabe tabl\|tabe
cab fork :tab split
cab svn_revert :!svn revert %:p
cab git_revert :!git checkout -- %:p

if has('win32')
  cab pwd_xtable chdir \*\storage\xstore\src\xtable
  cab pwd_api2 chdir \*\storage\xstore\src\xtable\api\managed2\obj\amd64
  cab pwd_all chdir \*\storage\xstore\src
else
  cab pwd_xtable chdir src/xtable
  cab pwd_api2 chdir src/xtable/api/managed2/obj/amd64
  cab pwd_all chdir src
endif


"imm color
syntax on
set termguicolors
set background=dark
"###########
let g:gruvbox_italic=0
let g:gruvbox_bold=0
let g:gruvbox_contrast_dark="soft"
"colo gruvbox
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_contrast_dark="medium"
"let g:gruvbox_contrast_dark="soft"
"let g:gruvbox_contrast_light="soft"
"colo gruvbox
"###############################
"let g:molokai_original = 1
"let g:rehash256 = 1
"color molokai
"###############################
"colorscheme codedark
"let g:airline_theme='codedark'
"################################
"let g:onedark_hide_endofbuffer=1
"colorscheme onedark
"################################
"set background=light
"let g:airline_solarized_bg='light'
"colorscheme solarized8_low
"let g:airline_theme='solarized'
"colorscheme dracula
"let g:airline_theme='dracula'
"colorscheme vim-material 
"let g:airline_theme='material'
"#############################
"colorscheme onehalfdark
"let g:equinusocio_material_darker = 1
"colorscheme equinusocio_material
"let g:equinusocio_material_hide_vertsplit = 1
colorscheme night-owl

"vim-airline
let g:airline_powerline_fonts = 0 " install this first: https://github.com/powerline/fonts
let g:airline_section_c = '%f'
let g:airline_section_y = '%l,%c'
let g:airline_section_z = '%p%%'
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#quickfix#location_text = '[Location List][-]'
let g:airline#extensions#quickfix#location_text = ''

"let g:airline_theme='codedark'
set encoding=utf-8
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

"lightline
"{{{lightline.vim
"{{{lightline.vim-usage
" :h 'statusline'
" :h g:lightline.component
"}}}
"{{{functions

set showtabline=2
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline


function! SwitchLightlineColorScheme(color)"{{{
    let g:lightline.colorscheme = a:color
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction"}}}
function! CocCurrentFunction()"{{{
    return get(b:, 'coc_current_function', '')
endfunction"}}}
function! Devicons_Filetype()"{{{
    " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"}}}
function! Devicons_Fileformat()"{{{
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"}}}
function! Artify_active_tab_num(n) abort"{{{
    return Artify(a:n, 'bold')." \ue0bb"
endfunction"}}}
function! Artify_inactive_tab_num(n) abort"{{{
    return Artify(a:n, 'double_struck')." \ue0bb"
endfunction"}}}
function! Artify_lightline_tab_filename(s) abort"{{{
    return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction"}}}
function! Artify_lightline_mode() abort"{{{
    return Artify(lightline#mode(), 'monospace')
endfunction"}}}
function! Artify_line_percent() abort"{{{
    return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction"}}}
function! Artify_line_num() abort"{{{
    return Artify(string(line('.')), 'bold')
endfunction"}}}
function! Artify_col_num() abort"{{{
    return Artify(string(getcurpos()[2]), 'bold')
endfunction"}}}
function! Quickfix_Title() abort"{{{
    if &buftype == "quickfix"
        return w:quickfix_title
    else
        return expand('%:t')
    endif
endfunction"}}}
function! Artify_gitbranch() abort"{{{
    if gitbranch#name() !=# ''
        return Artify(gitbranch#name(), 'monospace')." \ue725"
    else
        return "\ue61b"
    endif
endfunction"}}}
"}}}
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
let g:lightline = {}
let g:lightline.colorscheme = "nightowl"
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '*'
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
let g:lightline.active = {
            \ 'left': [ [ 'artify_mode', 'paste' ],
            \           [ 'readonly', 'quickfix_title', 'modified' ] ],
            \ 'right': [ ['artify_lineinfo' ], ['devicons_filetype'], [ 'fileformat'] ]
            \ }
let g:lightline.inactive = {
            \ 'left': [ [ 'quickfix_title' , 'modified', 'fileformat', 'devicons_filetype' ]],
            \ 'right': [ [ 'artify_lineinfo' ] ]
            \ }
let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ 'artify_gitbranch'], ['gitstatus' ]]
            \ }
let g:lightline.tab = {
            \ 'active': [ 'artify_filename', 'modified' ],
            \ 'inactive': [ 'filename', 'modified' ] }
let g:lightline.tab_component = {
            \ }
let g:lightline.tab_component_function = {
            \ 'artify_activetabnum': 'Artify_active_tab_num',
            \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
            \ 'artify_filename': 'Artify_lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum'
            \ }
let g:lightline.component = {
            \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
            \ 'artify_mode': '%{Artify_lightline_mode()}',
            \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
            \ 'vim_logo': "\ue7c5",
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'quickfix_title': '%{Quickfix_Title()}',
            \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'percent': '%2p%%',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%2p%% %3l:%-2v',
            \ 'line': '%l',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'time': '%{strftime("%c")}',
            \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
            \ 'winnr': '%{winnr()}'
            \ }
let g:lightline.component_function = {
            \ 'gitbranch': 'gitbranch#name',
            \ 'devicons_filetype': 'Devicons_Filetype',
            \ 'devicons_fileformat': 'Devicons_Fileformat',
            \ 'coc_status': 'coc#status',
            \ 'coc_currentfunction': 'CocCurrentFunction'
            \ }

let g:lightline.component_type = {
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error'
            \ }
"}}}

set diffopt=filler,context:1000000
if &diff
else
   hi CursorLine gui=underline cterm=underline
endif

"hide vert split line
hi clear VertSplit
hi VertSplit guibg=bg guifg=bg


"Key Mappings
nmap <F1> <C-W><C-W>
nmap <F2> :TlistToggle<CR>
nmap <F3> :set paste<CR>
nmap <F4> :set nopaste<CR>
nmap <F7> @a
nmap <F8> @:
nmap <F9> :tabmove -1<cr>
nmap <F10> :tabmove +1<cr>
nmap <C-g> :!echo %:p<cr>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>
vmap <C-Y> "zy
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-k> :lprevious<cr>
nmap <C-j> :lnext<cr>
"nmap <A-P> :pu z<cr>
nmap <PageUp> :lp<cr>
nmap <PageDown> :lne<cr>
nmap <C-W><Right> :vertical:resize +10<cr>
nmap <C-W><Left> :vertical:resize -10<cr>
nmap <C-W><Up> :resize +5<cr>
nmap <C-W><Down> :resize -5<cr>
nmap ,p "zp
nmap ,P "zP
nmap ,nt :NERDTree<cr>
nmap ,to :tabo<cr>
nmap <C-T> :tabc<cr>
nmap - [c
nmap = ]c
nmap + mn
nmap _ mp
nmap ss ::call SPLIT()<cr>
nnoremap "" :qa<cr>
nnoremap ,cd :chdir %:p:h\|pwd<cr>
nnoremap tc :.+1,$tabdo :tabc<cr>
nnoremap tC :0,.-1tabdo :tabc<cr>
nnoremap ,o :only\|tabo<cr>
nnoremap L :call ToggleList("Location List", 'l')<CR>
nnoremap ,mm /\v(\<\<\<\<\<\<\<\|\>\>\>\>\>\>\>\>\|\=\=\=\=\=\=\=\=\|\\|\\|\\|\\|\\|\\|\\|\\|\v)<cr>
nnoremap ed :edit %:p:h<cr>

"text
nmap } :call SEARCH(0,'<C-R>=expand("<cword>")<CR>')<CR>
nmap s} :call SPLIT()\|call SEARCH(0,'<C-R>=expand("<cword>")<CR>')<CR>
nmap t} :tabedit\|call SEARCH(0,'<C-R>=expand("<cword>")<CR>')<CR>
"class
nmap c} :call SEARCH(2,'<C-R>=expand("<cword>")<CR>')<CR>
nmap sc} :call SPLIT()\|:call SEARCH(2,'<C-R>=expand("<cword>")<CR>')<CR>
nmap tc} :tabedit\|call SEARCH(2,'<C-R>=expand("<cword>")<CR>')<CR>
"func
nmap f} :call SEARCH(1,'<C-R>=expand("<cword>")<CR>')<CR>
nmap sf} :call SPLIT()\|call SEARCH(1,'<C-R>=expand("<cword>")<CR>')<CR>
nmap tf} :tabedit\|call SEARCH(1,'<C-R>=expand("<cword>")<CR>')<CR>
"instance
nmap si} :call SPLIT()\|call SEARCH(3,'<C-R>=expand("<cword>")<CR>')<CR>
nmap ti} :tabedit\|call SEARCH(3,'<C-R>=expand("<cword>")<CR>')<CR>
nmap AS :call SPLIT_A()<CR>

"gtag -p
nmap tp} :tabe\|Gtags -P <C-R>=expand("<cword>")<CR><CR>

"switch jsx/scss
nmap ,as :call SWITCH_JSX_SCSS()<cr>
"paste and replace
nmap <silent> cp "_cw<C-R>"<Esc>
vmap <silent> cp "_c<C-R>"<Esc>
nmap <silent> ,cp "_cw<C-R>z<Esc>

"search visual selection
vnoremap // y/<C-R>"<CR>

"fold
"set foldmethod=syntax
set nofoldenable
"let cpp_fold = 1
"let perl_fold = 1
let perl_nofold_packages = 1
nnoremap <space> @=((foldclosed(line( '.' )) < 0)? 'zc' : 'zO' )<CR>
set foldopen-=search "dont open folds when search
set foldopen-=undo

"omni-completion
set completeopt=longest,menu,preview
let OmniCpp_ShowScopeInAbbr=1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
autocmd FileType python set omnifunc=python3complete#Complete

"------------------------------------------------------------------------------------------------------
"------------------------------------------------------------------------------------------------------
"Plugin Settings

"CScope
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs kill -1
cab cs_s :tabe\|cs find s
cab cs_e :tabe\|cs find e
cab cs_g :tabe\|cs find g
cab cs_c :tabe\|cs find c
command! -nargs=1 SearchCurrentFile :call s:SearchCurrentFile(<q-args>)
cab scf SearchCurrentFile
cab cwd lcd %:p:h
function! s:SearchCurrentFile(pattern)
let searchcmd = 'vimgrep '. a:pattern . ' ' . expand("%")
exec searchcmd
endfunction

"NERDTree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows=0

"super tab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"gtags
function! SPLIT_A()
    execute 'call SPLIT()'
    "execute "normal \<c-w>b"
    execute 'A'
endfunction
function! CLEAR_ALL_QLIST()
    "clear all qlist in current tab
    let noneqcount=0
    let qcount=0
    let totalw = winnr('$')
    let oldw = winnr()
    ":windo if &buftype != "quickfix" | let noneqcount=noneqcount+1 | endif
    "let oldw = oldw+noneqcount-totalw
    :windo if &buftype == "quickfix" | let qcount=qcount+1 | lcl | endif
    let oldw = oldw-qcount
    execute printf('exe %d . "wincmd w"', oldw)
    "echom printf('before search: %d', winnr())
endfunction
function! SEARCH(type, word)
    if a:type == 0 "text
        call SEARCH_TEXT(a:word)
    elseif a:type == 1 "function
        call SEARCH_FUNC(a:word)
    elseif a:type == 3 "instance
        call SEARCH_INSTANCE(a:word)
    else "class
        call SEARCH_CLASS(a:word)
    endif
endfunction
command! -nargs=1 SearchText :call SEARCH_TEXT(<q-args>)
function! SEARCH_TEXT(word)
    call CLEAR_ALL_QLIST()

    execute printf('LAck %s', a:word)
    call SETLOCLIST(printf('Text: %s', a:word))

    " jump back to main window.
    " currently we're in qfix window, 'lcl' here
    " will move the cursor to first window, we don't like that
    :wincmd p
    call RESIZE_QUICKFIX()
endfunction
command! -nargs=1 SF :call SEARCH_FILE(<q-args>)
function! SEARCH_FILE(word)
    call CLEAR_ALL_QLIST()

    let g:ackprg = 'ag --vimgrep --nogroup --nocolor'
    execute printf(':AckFile %s', a:word)
    let g:ackprg = 'rg --vimgrep -g !build'
    call SETLOCLIST(printf('File: %s', a:word))

    " jump back to main window.
    " currently we're in qfix window, 'lcl' here
    " will move the cursor to first window, we don't like that
    :wincmd p
    call RESIZE_QUICKFIX()
endfunction
function! RESIZE_QUICKFIX()
    if len(tabpagebuflist()) > 2 
        lcl
    else
        let width = winwidth(0)
        let height = winheight(0)
        let ratio = width/height
        if (ratio > 2)
            :windo if &buftype == "quickfix" | top lopen 10 | endif
        else
            :windo if &buftype == "quickfix" | top lopen 15 | endif
        endif
    endif
endfunction
command! -nargs=1 SearchFunc :call SEARCH_FUNC(<q-args>)
function! SEARCH_FUNC(word)
    call CLEAR_ALL_QLIST()

    if has('win32')
        "execute printf(':LAck -e "[^= \t]+ +(\S+::)*%s\s*\([^()]*\)\s*(\r\|\{\|const)" -e "[^= \t]+ +(\S+::)*%s\s*\(\s*\r"', a:word, a:word)
        "execute printf(':LAck -e "[^= \t]+ +(\S+::)*%s\s*\([^()]*\)\s*(\r|\{|const)" -e "[^= \t]+ +(\S+::)*%s\s*\(\s*\r"', a:word, a:word)
        execute printf(':LAck -e "^[^=]+(\s|::)%s\s*($|\(|const)"', a:word)
    else
        "execute printf(':LAck -e "[^= \t]+ +(\S+::)*%s\s*\([^()]*\)\s*($\|\{\|const)" -e "[^= \t]+ +(\S+::)*%s\s*\(\s*$"', a:word, a:word)
        "execute printf(':LAck -e "[^= \t]+ +(\S+::)*%s\s*\([^()]*\)\s*($|\{|const)" -e "[^= \t]+ +(\S+::)*%s\s*\(\s*$"', a:word, a:word)
        execute printf(':LAck -e "^[^=]+(\s|::)%s\s*($|\(|const)"', a:word)
    endif
    call SETLOCLIST(printf('Func: %s', a:word))

    " jump back to main window.
    " currently we're in qfix window, 'lcl' here
    " will move the cursor to first window, we don't like that
    :wincmd p
    call RESIZE_QUICKFIX()
endfunction
command! -nargs=1 SearchClass :call SEARCH_CLASS(<q-args>)
function! SEARCH_CLASS(word)
    call CLEAR_ALL_QLIST()

    if has('win32')
        execute printf(':LAck -e "(class|struct|enum|interface)\s+((dll|DLL|Dll)\S+\s+)*%s\b[^;]" -e "typedef.*%s;"', a:word, a:word)
    else
        execute printf(':LAck "(class|struct|enum|interface)\s+((dll|DLL|Dll)\S+\s+)*%s\b[^;]*$" -e "typedef.*%s;"', a:word, a:word)
    endif
    call SETLOCLIST(printf('Class: %s', a:word))

    " jump back to main window.
    " currently we're in qfix window, 'lcl' here
    " will move the cursor to first window, we don't like that
    :wincmd p
    call RESIZE_QUICKFIX()
endfunction

command! -nargs=1 SearchInstance :call SEARCH_INSTANCE(<q-args>)
function! SEARCH_INSTANCE(word)
    call CLEAR_ALL_QLIST()

    execute printf(':LAck -e "[ \(]%s[\(\);\]]" -e "[nN]ew.*\b%s\b" -e "make_(shared|unique)<%s>" -e "\b%s [a-zA-Z_]*(\(|;)" -e ":\s*(public|private|protected)\s*\b%s\b"', a:word, a:word, a:word, a:word, a:word)
    call SETLOCLIST(printf('Instance: %s', a:word))

    " jump back to main window.
    " currently we're in qfix window, 'lcl' here
    " will move the cursor to first window, we don't like that
    :wincmd p
    call RESIZE_QUICKFIX()
endfunction

function! SETLOCLIST(word)
    execute printf("call setloclist(0, [], 'a', {'title': '%s'})", a:word)
endfunction

function! DARK()
    execute 'set background=dark'
    execute 'colorscheme solarized8'
    let g:airline_solarized_bg='dark'
    call airline#switch_theme('solarized')
    hi clear VertSplit
endfunction
function! Light()
    execute 'set background=light'
    execute 'colorscheme solarized8'
    let g:airline_solarized_bg='light'
    call airline#switch_theme('solarized')
    hi clear VertSplit
endfunction
function! SPLIT_GTAG_G(file)
    execute 'winc o'
    execute 'vsplit'
    execute 'Gtags -g' a:file
    execute 'ccl'
    execute 'cw'
    execute 'winc k'
endfunction
function! SPLIT_GTAG_R(file)
    execute 'winc o'
    execute 'vsplit'
    execute 'Gtags -r' a:file
    execute 'ccl'
    execute 'cw'
    execute 'winc k'
endfunction
function! FILE_AND_LINE()
    let line = line(".")
    let ff = expand("%")
    echo ff.':'.line
endfunction
function! SPLIT()
    let width = winwidth(0)
    let height = winheight(0)
    let ratio = width/height
    if (ratio > 2)
        :vsplit
    else
        :split
    endif
endfunction
function! LACK_OPEN()
    let width = winwidth(0)
    let height = winheight(0)
    let ratio = width/height
    if (ratio > 2)
        :top lopen 10
    else
        :top lopen 15
    endif
endfunction

function! SWITCH_JSX_SCSS()
    let ff = expand("%")
    let ll = split(ff,'/')
    let last = ll[-1]
    let arr = ll[0:-2]

    if last == "index.jsx"
        if filereadable(join(arr, '/')."/styles.scss")
            call SPLIT()
            execute 'e' join(arr, '/')."/styles.scss"
        elseif filereadable(join(arr, '/')."/style.scss")
            call SPLIT()
            execute 'e' join(arr, '/')."/style.scss"
        endif
    elseif last == "styles.scss"
        if filereadable(join(arr, '/')."/index.jsx")
            call SPLIT()
            execute 'e' join(arr, '/')."/index.jsx"
        endif
    elseif last == "style.scss"
        if filereadable(join(arr, '/')."/index.jsx")
            call SPLIT()
            execute 'e' join(arr, '/')."/index.jsx"
        endif
    endif
endfunction
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec('top '.a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction


"ctags/cscope switcher
set tags=./tags;
set cst
set csto=1
set csprg=cscope.sh"cscope.sh: #!/bin/sh     cscope -C "$@"
command! -nargs=1 STags :call SetTag(<q-args>)
function! SetTag(name)
    execute "set tags=~/tags/".a:name.".tags"
endfunction

"vim-bookmark
"let g:bookmark_sign = '>>'
"let g:bookmark_annotation_sign = '##'
let g:bookmark_auto_save = 1
"let g:bookmark_highlight_lines = 1
let g:bookmark_center = 1
"let g:bookmark_show_toggle_warning = 0

"conque_gdb
let g:ConqueGdb_SrcSplit = 'left'

"tabman
let g:tabman_number = 0

"java complete
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif
setlocal completefunc=javacomplete#CompleteParamsInfo
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

"ctrlp
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules\/.*)$'
if has('win32')
    "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d | findstr /v /i /r "out[\\] \.git[\\] exe$ so$ dll$ pdb$ lib$ sln$ projhash$ slnhash$ userData$ assemblies$"'
else
    "let g:ctrlp_user_command = 'find %s -type f|grep -v -e \/node_modules\/ | grep -v -e \/build\/'
endif
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

"ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep -g !build'
endif
cnoreabbrev ack LAck!
let g:ack_lhandler = "call LACK_OPEN()"
let g:ackhighlight = 0

"typescript-vim
let g:typescript_indent_disable = 0

" for js/typescript/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 sts=2 expandtab

"vim-jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

"a.vim
let g:alternateExtensions_jsx = "scss,css"
let g:alternateExtensions_scss = "jsx"
let g:alternateExtensions_css = "jsx"

"
let guifontpp_smaller_font_map="<F5>" 
let guifontpp_larger_font_map="<F6>"
let guifontpp_original_font_map="<C-F5>"

"ale
" install eslint before: npm install -g eslint-config-airbnb eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y eslint
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '»'
let g:ale_sign_warning = '»'
let g:ale_enabled = 0
let g:ale_set_quickfix = 1 "use quickfix window for lint
let g:ale_open_list = 1
"autocmd BufWritePre *.{js,jsx} ALEFix
"
"vim-auto-save
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 1

"tagbar
let g:tagbar_width = 60

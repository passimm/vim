execute pathogen#infect()
set nocp
"don't ignore case when searching
set noic
"General Settings
:filetype plugin on
:syntax on
"this line disable BG color erase,to enable tmux use colorschema's bg color
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
set nu

if has("gui_running") 
au GUIEnter * simalt ~x " 窗口启动时自动最大化 
set guioptions-=m " 隐藏菜单栏 
set guioptions-=T " 隐藏工具栏 
set guioptions-=L " 隐藏左侧滚动条 
set guioptions-=r " 隐藏右侧滚动条 
set guioptions-=b " 隐藏底部滚动条 
set showtabline=0 " 隐藏Tab栏
set guifont=Consolas_NF:h11:cANSI:qDRAFT
set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
set linespace=0
endif 

set statusline=
set statusline+=\[%f:%l
"switch to right side
"set statusline+=%=
set statusline+=\ @Col:%c\]
"set fillchars=stl:,stlnc:,vert:\|,fold:-,diff:-
set fillchars=vert:\|,fold:-

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
cab fork :tabe %:p
cab svn_revert :!svn revert %:p
cab git_revert :!git checkout -- %:p

"imm color
syntax on
set termguicolors
"###########
"colo gruvbox
let g:gruvbox_contrast_dark="hard"
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
colorscheme tender
let g:airline_theme='tender'
"if &diff
"    set background=dark
"    colorscheme vim-monokai-tasty
"endif

"vim-airline
let g:airline_powerline_fonts = 1 " install this first: https://github.com/powerline/fonts
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
let g:airline_powerline_fonts = 1
"let g:airline_theme='codedark'
set encoding=utf-8
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

set diffopt=filler,context:1000000
if &diff
else
   hi CursorLine gui=underline cterm=underline
endif

hi clear VertSplit

"Key Mappings
nmap <F1> <C-W><C-W>
nmap <F2> :TlistToggle<CR>
nmap <F3> :set paste<CR>
nmap <F4> :set nopaste<CR>
nmap <F7> @a
nmap <F8> @: 
nmap <F9> :tabmove -1<cr>
nmap <F10> :tabmove +1<cr>
nmap <C-G> :!echo %:p<cr>
nmap <C-H> :tabp<CR>
nmap <C-L> :tabn<CR> 
vmap <C-Y> "zy 
nmap <C-n> :NERDTreeToggle<CR>
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
nmap zw "zyw
nmap ,to :tabo<cr>
nmap <C-T> :tabc<cr>
nmap - [c
nmap = ]c
nmap + mn
nmap _ mp
nmap ss ::call SPLIT()<cr>
nmap C :tabo\|only\|q<cr>
"nmap gt :tabe\|Gtags
"nmap gs :call SPLIT()\|Gtags
"nmap gp :Gtags -P 
"nmap gdb :call FILE_AND_LINE()<cr>
"gtag
"nmap } :Gtags \b<C-R>=expand("<cword>")<CR>\b<CR>:lcl<cr>
"nmap s} :call SPLIT()\|Gtags \b<C-R>=expand("<cword>")<CR>\b<CR>:lcl<cr>
"nmap t} :tabe\|Gtags \b<C-R>=expand("<cword>")<CR>\b<CR>
"gtag -r
"nmap r} :Gtags -r \b<C-R>=expand("<cword>")<CR>\b<CR>:lcl<cr>
"nmap sr} :call SPLIT()\|Gtags -r \b<C-R>=expand("<cword>")<CR>\b<CR>:lcl<cr>
"nmap tr} :tabe\|Gtags -r \b<C-R>=expand("<cword>")<CR>\b<CR>
"gtag -g
"nmap g} :Gtags -g \b<C-R>=expand("<cword>")<CR>\b<CR>:lcl<cr>
"nmap sg} :call SPLIT()\|Gtags -g \b<C-R>=expand("<cword>")<CR>\b<CR>:lcl<cr>
"nmap tg} :tabe\|Gtags -g \b<C-R>=expand("<cword>")<CR>\b<CR>
nmap } :LAck! -g !build -w <C-R>=expand("<cword>")<CR><CR>
nmap s} :call SPLIT()\|:LAck -g !build -w <C-R>=expand("<cword>")<CR><CR>
nmap t} :tabe\|:LAck -g !build -w <C-R>=expand("<cword>")<CR><CR>

"gtag -p
nmap tp} :tabe\|Gtags -P <C-R>=expand("<cword>")<CR><CR>

nmap stf :call OPEN_IN_TAB(expand("<cfile>"))<cr>
"switch jsx/scss
nmap ,as :call SWITCH_JSX_SCSS()<cr>
"paste and replace
nmap <silent> cp "_cw<C-R>"<Esc>
vmap <silent> cp "_c<C-R>"<Esc>

"search visual selection
vnoremap // y/<C-R>"<CR>

"fold
"set foldmethod=syntax
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
call pathogen#helptags()
"Plugin Settings
"taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=0

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
function! DARK()
    execute 'set background=dark'
    execute 'colorscheme vim-monokai-tasty'
    call airline#switch_theme('monokai_tasty')
endfunction
function! Light()
    execute 'set background=light'
    execute 'colorscheme PaperColor'
    call airline#switch_theme('papercolor')
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
let g:ctrlp_working_path_mode = ''
"let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules\/.*)$'
if has('win32')
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d | findstr /v /i /r "out[\\] \.git[\\] exe$ so$ dll$ pdb$ lib$ sln$ projhash$ slnhash$ userData$ assemblies$"'
else
    let g:ctrlp_user_command = 'find %s -type f|grep -v -e \/node_modules\/ | grep -v -e \/build\/'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

"ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
cnoreabbrev ack LAck! -g !build

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

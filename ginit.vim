GuiTabline 0
tnoremap <Esc> <C-\><C-n>

au VimResized * wincmd =  "evenly resize each window
set guioptions-=m " 隐藏菜单栏 
set guioptions-=T " 隐藏工具栏 
set guioptions-=L " 隐藏左侧滚动条 
set guioptions-=r " 隐藏右侧滚动条 
set guioptions-=b " 隐藏底部滚动条 
set guioptions-=t " 隐藏底部滚动条 
set guioptions-=g " 隐藏底部滚动条 
set showtabline=0 " 隐藏Tab栏
"set guifont=Iosevka:h11:cANSI:qDRAFT
GuiFont FantasqueSansMono NF:h12:cANSI:qDRAFT

set linespace=5
set mouse=nic

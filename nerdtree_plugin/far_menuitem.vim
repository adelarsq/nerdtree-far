" NerdTree Plugin for search with far
if exists("g:loaded_nerdtree_far_menuitem")
  finish
endif

let g:loaded_nerdtree_far_menuitem = 1
let s:haskdeinit = system("ps -e") =~ 'kdeinit'
let s:hasdarwin = system("uname -s") =~ 'Darwin'

call NERDTreeAddMenuItem({
      \ 'text': '(f)ar search and replace',
      \ 'shortcut': 'f',
      \ 'callback': 'NERDTreeFarSearch' })

function! NERDTreeFarSearch()
  let l:oldssl=&shellslash
  set noshellslash
  let treenode = g:NERDTreeFileNode.GetSelected()
  let path = treenode.path.str()

  let g:oldcwd=g:far#cwd

  let s:cmd = 'Farp'
  execute s:cmd

  let &shellslash=l:oldssl

  let g:far#cwd=g:oldcwd

  redraw!
endfunction

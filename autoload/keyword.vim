function! keyword#Command()
  return exists('b:keyword_command') ? b:keyword_command : g:keyword_command
endfunction

function! keyword#Execute(keyword)
  let l:keyword_command = substitute(keyword#Command(), '{keyword}', a:keyword, 'g')
  execute l:keyword_command
endfunction

function! keyword#GetVisualSelection()
  let l:temp = @s
  normal! gv"sy
  let l:foo = @s
  let @s = l:temp
  return l:foo
endfunction

function! keyword#ExecuteNormal()
  call keyword#Execute(expand('<cword>'))
endfunction

function! keyword#ExecuteVisual()
  let l:selection = keyword#GetVisualSelection()
  call keyword#Execute(l:selection)
endfunction

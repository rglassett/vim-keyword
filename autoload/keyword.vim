function! keyword#Command()
  return exists('b:keyword_command') ? b:keyword_command : g:keyword_command
endfunction

function! keyword#Execute(keyword)
  execute substitute(keyword#Command(), '{keyword}', a:keyword, 'g')
endfunction

function! keyword#GetVisualSelection()
  let l:s_register = @s
  normal! gv"sy
  let l:selected_string = @s
  let @s = l:s_register
  return l:selected_string
endfunction

function! keyword#ExecuteNormal()
  call keyword#Execute(expand('<cword>'))
endfunction

function! keyword#ExecuteVisual()
  let l:selection = keyword#GetVisualSelection()
  call keyword#Execute(l:selection)
endfunction

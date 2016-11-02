function! keyword#Command()
  return exists('b:keyword_command') ? b:keyword_command : g:keyword_command
endfunction

function! keyword#Execute(keyword)
  let keyword_command = substitute(keyword#Command(), '{keyword}', a:keyword, 'g')
  execute keyword_command
endfunction

function! keyword#GetVisualSelection()
  let temp = @s
  normal! gv"sy
  let foo = @s
  let @s = temp
  return foo
endfunction

function! keyword#ExecuteNormal()
  call keyword#Execute(expand('<cword>'))
endfunction

function! keyword#ExecuteVisual()
  let selection = keyword#GetVisualSelection()
  call keyword#Execute(selection)
endfunction

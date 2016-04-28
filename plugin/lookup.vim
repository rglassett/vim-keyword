if exists('g:loaded_lookup') || &compatible
  finish
endif
let g:loaded_lookup = 1

function! s:LookupCommand()
  return exists('b:lookup_command') ? b:lookup_command : g:lookup_command
endfunction

function! s:Lookup(keyword)
  let s:lookup_command = substitute(s:LookupCommand(), '{keyword}', a:keyword, 'g')
  execute s:lookup_command
endfunction

function! s:GetVisualSelection()
  let temp = @s
  normal! gv"sy
  let foo = @s
  let @s = temp
  return foo
endfunction

function! s:LookupNormal()
  call s:Lookup(expand('<cword>'))
endfunction

function! s:LookupVisual()
  let selection = s:GetVisualSelection()
  call s:Lookup(selection)
endfunction

nnoremap <Plug>LookupNormal :call <SID>LookupNormal()<CR>
xnoremap <Plug>LookupVisual :<C-u>call <SID>LookupVisual()<CR>

if !exists('g:lookup_command')
  if &keywordprg == ':help'
    let g:lookup_command = 'help {keyword}'
  else
    let g:lookup_command = '!' . &keywordprg . ' {keyword}'
  endif
endif

if !exists('g:lookup_no_mappings')
  nmap K <Plug>LookupNormal
  xmap K <Plug>LookupVisual
endif

if exists('g:loaded_keyword') || &compatible
  finish
endif
let g:loaded_keyword = 1

function! s:KeywordCommand()
  return exists('b:keyword_command') ? b:keyword_command : g:keyword_command
endfunction

function! s:Keyword(keyword)
  let s:keyword_command = substitute(s:KeywordCommand(), '{keyword}', a:keyword, 'g')
  execute s:keyword_command
endfunction

function! s:GetVisualSelection()
  let temp = @s
  normal! gv"sy
  let foo = @s
  let @s = temp
  return foo
endfunction

function! s:KeywordNormal()
  call s:Keyword(expand('<cword>'))
endfunction

function! s:KeywordVisual()
  let selection = s:GetVisualSelection()
  call s:Keyword(selection)
endfunction

nnoremap <Plug>KeywordNormal :call <SID>KeywordNormal()<CR>
xnoremap <Plug>KeywordVisual :<C-u>call <SID>KeywordVisual()<CR>

if !exists('g:keyword_command')
  if &keywordprg == ':help'
    let g:keyword_command = 'help {keyword}'
  else
    let g:keyword_command = '!' . &keywordprg . ' {keyword}'
  endif
endif

if !exists('g:keyword_skip_mappings')
  nmap K <Plug>KeywordNormal
  xmap K <Plug>KeywordVisual
endif

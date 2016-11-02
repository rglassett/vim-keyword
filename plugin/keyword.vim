if exists('g:loaded_keyword') || &compatible
  finish
endif
let g:loaded_keyword = 1

if !exists('g:keyword_command')
  if &keywordprg == ':help'
    let g:keyword_command = 'help {keyword}'
  else
    let g:keyword_command = '!' . &keywordprg . ' {keyword}'
  endif
endif

nnoremap <Plug>KeywordNormal :call keyword#ExecuteNormal()<CR>
xnoremap <Plug>KeywordVisual :<C-u>call keyword#ExecuteVisual()<CR>

if !exists('g:keyword_skip_mappings')
  nmap K <Plug>KeywordNormal
  xmap K <Plug>KeywordVisual
endif

if exists('g:loaded_lookup') || &compatible
  finish
endif
let g:loaded_lookup = 1

function! s:LookupCommand()
  return exists('b:lookup_command') ? b:lookup_command : g:lookup_command
endfunction

function! s:Lookup(keyword)
  let s:lookup_command = substitute(s:LookupCommand(), "{keyword}", a:keyword, "g")
  execute s:lookup_command
endfunction

nnoremap <Plug>LookupNormal :call <SID>Lookup(expand('<cword>'))<CR>
xnoremap <Plug>LookupVisual y:call <SID>Lookup(getreg('"'))<CR>

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

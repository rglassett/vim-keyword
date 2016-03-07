# Lookup.vim

Lookup.vim aims to improve Vim's built-in <kbd>K</kbd> command. It acts the same
way by default, but it comes with a few handy configuration options.

By default, <kbd>K</kbd> uses `keywordprg`, which must be either a shell command
or Vim's internal `:help`. Lookup.vim supports both internal and external
commands, allows chaining, and allows keywords to be passed anywhere in a
command:

    let g:lookup_command = 'silent grep {keyword} | cwindow | redraw!'

Lookup can be made filetype-sensitive through autocommands or ftplugin settings:

    " ~/.vim/ftplugin/vim.vim
    let b:lookup_command = 'help {keyword}'

Lookup maps itself to <kbd>K</kbd> in Normal and Visual modes by default, but
you're welcome to ignore those mappings and make your own:

    let g:lookup_no_mappings = 1
    nmap <Leader>k <Plug>LookupNormal
    vmap <Leader>k <Plug>LookupVisual

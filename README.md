# Keyword.vim

Keyword.vim aims to improve Vim's built-in <kbd>K</kbd> command. It acts the
same way by default, but it comes with a few handy configuration options.

Vim's native <kbd>K</kbd> mapping simply passes the current keyword as an
argument to the command specified by the `keywordprg` option, and only supports
shell commands and Vim's internal `help`.

By contrast, Keyword.vim supports both editor and shell commands, and keywords
may be interpolated anywhere in a command:

    let g:keyword_command = 'silent grep {keyword} | cwindow | redraw!'

You can set a buffer-local keyword command through autocommands or ftplugins:

    " ~/.vim/ftplugin/vim.vim
    let b:keyword_command = 'help {keyword}'

Keyword maps itself to <kbd>K</kbd> in Normal and Visual modes by default, but
you're welcome to ignore those mappings and make your own:

    let g:keyword_skip_mappings = 1
    nmap <Leader>k <Plug>KeywordNormal
    xmap <Leader>k <Plug>KeywordVisual

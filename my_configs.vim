let g:ycm_global_ycm_extra_conf = "~/.vim_runtime/.ycm_extra_conf.py"

"syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

set foldmethod=syntax

cab pa !p4 add %
cab pe !p4 edit %
cab pd !p4 diff %

autocmd BufWritePre * %s/\s\+$//e

":autocmd BufWritePost *.c call UpdateCScope()
":autocmd BufWritePost *.h call UpdateCScope()

command UC call UpdateCScope()

function! UpdateCScope()
    :silent !find $CSCOPE_DB -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > $CSCOPE_DB/cscope.files
    :silent !cscope -bvq -i $CSCOPE_DB/cscope.files -f $CSCOPE_DB/cscope.out
    cs reset
endfunction

filetype indent on

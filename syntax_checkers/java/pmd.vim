"============================================================================
"File:        pmd.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Dmitry Geurkov <d.geurkov at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" Tested with pmd 5.5
"============================================================================

if exists('g:loaded_syntastic_java_pmd_checker')
    finish
endif
let g:loaded_syntastic_java_pmd_checker = 1

if !exists('g:syntastic_java_pmd_path')
    let g:syntastic_java_pmd_path = 'pmd'
endif

if !exists('g:syntastic_java_pmd_conf_file')
    let g:syntastic_java_pmd_conf_file = 'pmd.xml'
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_java_pmd_IsAvailable() dict
    if !executable(self.getExec())
        return 0
    endif

    let conf_file = expand(g:syntastic_java_pmd_conf_file, 1)
    call self.log('filereadable(' . string(conf_file) . ') = ' . filereadable(conf_file))

    return filereadable(conf_file)
endfunction

function! SyntaxCheckers_java_pmd_GetLocList() dict
    let opts = []
    let dir = syntastic#util#shescape( expand('%:p:h', 1))
    call extend(opts, [
        \ 'pmd',
        \ '-dir', dir,
        \ '-R', expand(g:syntastic_java_pmd_conf_file, 1),
        \ '-f', 'xml' ])

    let makeprg = self.makeprgBuild({ 'args_after': opts, 'fname': '' })

    let errorformat = '%f:%t:%l:%c:%m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'Preprocess': 'Preprocess',
        \ 'subtype': 'Style' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'java',
    \ 'name': 'pmd',
    \ 'exec': g:syntastic_java_pmd_path . '/bin/run.sh'})

function! Preprocess(errors) abort " {{{2
    let out = []
    let fname = expand('%:p', 1)
    for i in range(0, len(a:errors) - 1)
        let err = a:errors[i]
        if match(err, '\m<violation\>') > -1
            let line = str2nr(matchstr(err, '\m\<beginline="\zs\d\+\ze"'))
            if line == 0
                continue
            endif

            let col = str2nr(matchstr(err, '\m\<begincolumn="\zs\d\+\ze"'))

            let type = 'E'

            if len(a:errors) < i + 1
                continue
            endif

            let message = a:errors[i+1]

            call add(out, join([fname, type, line, col, message], ':'))
        elseif match(err, '\m<file name="') > -1
            let fname = syntastic#util#decodeXMLEntities(matchstr(err, '\v\<file name\="\zs[^"]+\ze"'))
        endif
    endfor
    return out
endfunction " }}}2

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:

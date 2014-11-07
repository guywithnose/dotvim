" Author:
"   tyru <tyru.exe@gmail.com>
" Version: 0.0.5
" License:
" NEW BSD LICENSE
"   Copyright (c) 2009, tyru
"   All rights reserved.
"
"   Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
"
"       * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
"       * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
"       * Neither the name of the tyru nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

let s:PATTERN = '\C'.'^\s*'.'\%(public\s\+\|static\s\+\|abstract\s\+\|protected\s\+\|private\s\+\)\{-}'.'function\>'.'\s\+'.'\('.'[^(]\+'.'\)'.'\%('.'\s*'.'('.'\=\)'

function! cfi#get_func_name()
  let orig_view = winsaveview()
  try
    let [orig_lnum, orig_col] = [line('.'), col('.')]

    if search(s:PATTERN, 'bW') == 0 || line('.') == 0
      return ""
    endif

    let match = matchlist(getline('.'), s:PATTERN)
    if empty(match)
      return ""
    endif

    let [begin_lnum, begin_col] = [line('.'), col('.')]

    if search('{', 'W') == 0 || searchpair('{', '', '}', 'W') == 0 || line('.') == 0 || !(s:pos_is_less_than([begin_lnum, begin_col], [orig_lnum, orig_col]) && s:pos_is_less_than([orig_lnum, orig_col], [line('.'), col('.')]))
      return ""
    endif

    return match[1]
  finally
    call winrestview(orig_view)
  endtry
endfunction

function! s:pos_is_less_than(pos1, pos2)
  let [lnum1, col1] = a:pos1
  let [lnum2, col2] = a:pos2
  return lnum1 < lnum2 || (lnum1 == lnum2 && col1 < col2)
endfunction
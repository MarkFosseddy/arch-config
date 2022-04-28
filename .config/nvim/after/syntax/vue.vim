syntax clear htmlTagName
syntax match htmlTagName contained "\<[a-zA-Z0-9:-]*\>"
unlet! b:current_syntax

function! s:attr(name, value)
  return a:name . '=\("\|''\)[^\1]*' . a:value . '[^\1]*\1'
endfunction

function! s:should_register(start_pattern)
  return search(a:start_pattern, 'n') != 0
endfunction

let s:languages = [
\  {'name': 'pug',        'tag': 'template', 'attr_pattern': s:attr('lang', '\%(pug\|jade\)')},
\  {'name': 'typescript', 'tag': 'script',   'attr_pattern': '\%(lang=\("\|''\)[^\1]*\(ts\|typescript\)[^\1]*\1\|ts\)'},
\  {'name': 'sass',       'tag': 'style'},
\  {'name': 'scss',       'tag': 'style'},
\ ]

for s:language in s:languages
  let s:attr_pattern = has_key(s:language, 'attr_pattern') ? s:language.attr_pattern : s:attr('lang', s:language.name)
  let s:start_pattern = '<' . s:language.tag . '\>\_[^>]*' . s:attr_pattern . '\_[^>]*>'

  if s:should_register(s:start_pattern)
    execute 'syntax include @' . s:language.name . ' syntax/' . s:language.name . '.vim'
    unlet! b:current_syntax
    execute 'syntax region vue_' . s:language.name
\           'keepend'
\           'start=/' . s:start_pattern . '/'
\           'end="</' . s:language.tag . '>"me=s-1'
\           'contains=@' . s:language.name . ',vueSurroundingTag'
\           'fold'
    endif
endfor

syn region  vueSurroundingTag   contained start=+<\(script\|style\|template\)+ end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent
syn keyword htmlSpecialTagName  contained template
syn keyword htmlArg             contained scoped ts
syn match   htmlArg "[@v:][-:.0-9_a-z]*\>" contained

syntax sync fromstart

let b:current_syntax = "vue"

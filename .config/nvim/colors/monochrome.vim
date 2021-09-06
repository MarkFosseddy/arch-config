"
" TODO:
"   - Markdown syntax
"   - Lightline
"   - Theming
"   - Snippets
"

set background=dark

hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "monochrome"

" Colors
let s:black = '#161821'
let s:red = '#e27878'
let s:green = '#b4be82'
let s:yellow = '#e2a478'
let s:blue = '#84a0c6'
let s:magenta = '#a093c7'
let s:cyan = '#89b8c2'
let s:white = '#c6c8d1'

" Attribute
let s:italic = "italic"
let s:bold = "bold"
let s:underline = "underline"
let s:none = "NONE"

" Themes
" Yellow-Red Dark
let s:dbg = "#0e0f15"
let s:lbg = "#454b68"
let s:bg = "#161821"
let s:fg = "#d6cbc5"
let s:keyword = "#f7d492"
let s:string = "#d2a494"

" Reddish-Gray Dark
"let s:dbg = "#0e0f15"
"let s:lbg = "#454b68"
"let s:bg = "#161821"
"let s:fg = "#e8e1d7"
"let s:keyword = "#928688"
"let s:string = "#c1b6b4"

" White-Blue Dark
"let s:dbg = "#0e0f15"
"let s:lbg = "#454b68"
"let s:bg = "#161821"
"let s:fg = "LightGray"
"let s:keyword = "White"
"let s:string = "#778899"

" Red-Orange Light
"let s:dbg = "#e7d0b7"
"let s:lbg = "#d3aa7c"
"let s:bg = "#ecdac6"
"let s:fg = "#241007"
"let s:keyword = "#673403"
"let s:string = "#ba7742"

function! s:hi(...)
    let group = a:1
    let fg = get(a:, 2, s:fg)
    let bg = get(a:, 3, s:bg)
    let attr = get(a:, 4, s:none)

    let cmd = ["hi", group]

    if fg != s:none
        call add(cmd, "guifg=".fg)
    endif

    if bg != s:none
        call add(cmd, "guibg=".bg)
    endif

    call add(cmd, "gui=".attr)

    exec join(cmd, " ")
endfunction

" --- Lightline ---------------------------------------------------------------
"let s:p = {'normal': {}}
"let s:p.normal.left = [[s:blue, s:white]]
"let s:p.normal.right = [[s:blue, s:white]]
"let s:p.normal.middle = [[s:blue, s:white]]
"let g:lightline#colorscheme#monochrome#palette = lightline#colorscheme#fill(s:p)

" --- Vim Interface -----------------------------------------------------------
call s:hi("Normal")
call s:hi("CursorLine", s:keyword, s:lbg)
call s:hi("CursorLineNr", s:keyword, s:bg, s:bold)
call s:hi("ColorColumn", s:none, s:dbg)
call s:hi("Search", s:bg, s:keyword)
call s:hi("Visual", s:keyword, s:lbg)
call s:hi("ErrorMsg", s:white, s:red)
call s:hi("NonText", s:lbg)
call s:hi("LineNr", s:lbg)
call s:hi("Directory")
call s:hi("SignColumn")
call s:hi("MatchParen", s:keyword, s:lbg)
call s:hi("Pmenu", s:fg, s:dbg)
call s:hi("PmenuSel", s:string, s:lbg)
call s:hi("PmenuSbar", s:none, s:lbg)
call s:hi("PmenuThumb", s:none, s:string)

" --- Programming languages ---------------------------------------------------
call s:hi("Comment", s:lbg)

call s:hi("Constant", s:fg)
call s:hi("String", s:string)
call s:hi("Character", s:fg)
call s:hi("Number", s:fg)
call s:hi("Boolean", s:fg)
call s:hi("Float", s:fg)

call s:hi("Identifier", s:fg)
call s:hi("Function", s:fg)

call s:hi("Statement", s:keyword)
call s:hi("Conditional", s:keyword)
call s:hi("Repeat", s:keyword)
call s:hi("Label", s:fg)
call s:hi("Operator", s:fg)
call s:hi("Keyword", s:fg)
call s:hi("Exception", s:fg)

call s:hi("PreProc", s:fg)
call s:hi("Include", s:keyword)
call s:hi("Define", s:keyword)
call s:hi("Macro", s:keyword)
call s:hi("PreCondit", s:keyword)

call s:hi("Type", s:fg)
call s:hi("StorageClass", s:keyword)
call s:hi("Structure", s:fg)
call s:hi("Typedef", s:keyword)

call s:hi("Special", s:keyword)
call s:hi("SpecialComment", s:keyword)
"TODO
"call s:hi("SpecialChar", s:cyan)
"call s:hi("Tag", s:cyan)
"call s:hi("Delimiter", s:cyan)
"call s:hi("Debug", s:cyan)

call s:hi("Todo", s:lbg)

" --- TypeScript --------------------------------------------------------------
call s:hi("typescriptDocComment", s:fg)
call s:hi("typescriptMagicComment", s:string)
call s:hi("typescriptRef", s:lbg)
call s:hi("typescriptTemplateSB", s:keyword)
call s:hi("typescriptIdentifier", s:keyword)
call s:hi("typescriptVariable", s:keyword)
call s:hi("typescriptEnumKeyword", s:keyword)
call s:hi("typescriptOperator", s:keyword)
call s:hi("typescriptKeywordOp", s:keyword)
call s:hi("typescriptMethodAccessor", s:keyword)
call s:hi("typescriptAsyncFuncKeyword", s:keyword)
call s:hi("typescriptObjectAsyncKeyword", s:keyword)
call s:hi("typescriptAsyncFor", s:keyword)
call s:hi("typescriptFuncKeyword", s:keyword)
call s:hi("typescriptArrowFunc", s:keyword)
call s:hi("typescriptInterfaceExtends", s:keyword)
call s:hi("typescriptConstraint", s:keyword)
call s:hi("typescriptClassExtends", s:keyword)
call s:hi("typescriptDecorator", s:string)
call s:hi("typescriptClassKeyword", s:keyword)
call s:hi("typescriptInterfaceKeyword", s:keyword)
call s:hi("typescriptReadonlyModifier", s:keyword)
call s:hi("typescriptReadonlyArrayKeyword", s:keyword)
call s:hi("typescriptAccessibilityModifier", s:keyword)
call s:hi("typescriptConstructSignature", s:keyword)
call s:hi("typescriptAliasKeyword", s:keyword)
call s:hi("tsxTagName", s:keyword)
call s:hi("tsxIntrinsicTagName", s:keyword)

" --- JavaScript --------------------------------------------------------------
call s:hi("javaScriptOperator", s:keyword)
call s:hi("javaScriptFunction", s:keyword)
call s:hi("javaScriptIdentifier", s:keyword)
call s:hi("javaScriptLabel", s:keyword)
call s:hi("javaScriptException", s:keyword)
call s:hi("javaScriptReserved", s:keyword)
call s:hi("javaScriptEmbed", s:fg)

" --- CSS ---------------------------------------------------------------------
call s:hi("cssTagName", s:string)
call s:hi("cssSelectorOp", s:string)
call s:hi("cssSelectorOp2", s:string)
call s:hi("cssPseudoClassId", s:string)
call s:hi("cssIdentifier", s:string)
call s:hi("cssAtRule", s:keyword)
call s:hi("cssAtKeyword", s:keyword)
call s:hi("cssClassName", s:string)
call s:hi("cssClassNameDot", s:string)
call s:hi("cssProp", s:keyword)
call s:hi("cssAttr", s:fg)

" --- SCSS --------------------------------------------------------------------
call s:hi("sassId", s:string)
call s:hi("sassFor", s:keyword)
call s:hi("sassClass", s:string)
call s:hi("sassMixin", s:keyword)
call s:hi("sassMedia", s:keyword)
call s:hi("sassIdChar", s:string)
call s:hi("sassMixing", s:keyword)
call s:hi("sassReturn", s:keyword)
call s:hi("sassExtend", s:keyword)
call s:hi("sassControl", s:keyword)
call s:hi("sassCharset", s:keyword)
call s:hi("sassClassChar", s:string)
call s:hi("sassAmpersand", s:string)
call s:hi("sassPlaceholder", s:string)
call s:hi("sassFunctionDecl", s:keyword)
call s:hi("sassMediaOperators", s:keyword)

" --- HTML --------------------------------------------------------------------
let html_no_rendering = 1
call s:hi("htmlSpecialTagName", s:keyword)
call s:hi("javaScript", s:fg)

" --- Pug ---------------------------------------------------------------------
call s:hi("pugScriptConditional", s:keyword)
call s:hi("pugScriptLoopKeywords", s:keyword)
call s:hi("pugScriptStatement", s:keyword)
call s:hi("pugIdChar", s:string)
call s:hi("pugClassChar", s:string)
call s:hi("pugPipeChar", s:fg)
call s:hi("pugId", s:string)
call s:hi("pugClass", s:string)
call s:hi("pugDocType", s:lbg)

" --- JSON --------------------------------------------------------------------
call s:hi("jsonBraces", s:fg)
call s:hi("jsonKeyword", s:keyword)

" --- VimL --------------------------------------------------------------------
"call s:hi("vimOption")
"call s:hi("vimGroup")
"call s:hi("vimHiClear")
"call s:hi("vimHiGroup")
"call s:hi("vimHiAttrib")
"call s:hi("vimHiGui")
"call s:hi("vimHiGuiFgBg")
"call s:hi("vimHiCTerm")
"call s:hi("vimHiCTermFgBg")
"call s:hi("vimSynType")
"hi link vimCommentTitle Comment

" --- Python ------------------------------------------------------------------
"call s:hi("pythonEscape", s:blue)

" --- Diffs -------------------------------------------------------------------
"call s:hi("diffFile", s:cgray)
"call s:hi("diffNewFile", s:cgray)
"call s:hi("diffIndexLine", s:cgray)
"call s:hi("diffLine", s:cgray)
"call s:hi("diffSubname", s:cgray)
"call s:hi("diffAdded", s:white, s:green)
"call s:hi("diffRemoved", s:white, s:red)

" --- Markdown ----------------------------------------------------------------
"call s:hi("Title", s:white, s:default_bg)
"call s:hi("markdownHeadingDelimiter", s:white, s:default_bg)
"call s:hi("markdownHeadingRule", s:white, s:default_bg)
"call s:hi("markdownLinkText", s:blue, s:default_bg)

" --- Telescope ---------------------------------------------------------------
call s:hi("TelescopeMatching", s:bg, s:keyword)

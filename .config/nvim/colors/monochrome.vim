"
" TODO:
"   - Github diff
"   - Move pug syntax to config
"
"   - js, ts snippets
"   - css, scss snippets?
"   - html snippets
"   - vue snippets
"   - react snippets
"
"   - Lua syntax
"   - VimL syntax
"   - Go syntax
"   - Rust syntax
"   - Python syntax
"

hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "monochrome"

" Themes
let s:themes = {
\   "yellow_red": {
\       "fg"        : "#d6cbc5",
\       "bg"        : "#161821",
\       "lbg"       : "#454b68",
\       "dbg"       : "#0e0f15",
\       "string"    : "#d2a494",
\       "keyword"   : "#f7d492",
\       "background": "dark"
\   },
\   "reddish_gray": {
\       "fg"        : "#e8e1d7",
\       "bg"        : "#161821",
\       "lbg"       : "#454b68",
\       "dbg"       : "#0e0f15",
\       "string"    : "#c1b6b4",
\       "keyword"   : "#928688",
\       "background": "dark"
\    },
\   "white_blue": {
\       "fg"        : "LightGray",
\       "bg"        : "#161821",
\       "lbg"       : "#454b68",
\       "dbg"       : "#0e0f15",
\       "string"    : "#778899",
\       "keyword"   : "White",
\       "background": "dark"
\   },
\   "red_orange": {
\       "fg"        : "#241007",
\       "bg"        : "#ecdac6",
\       "lbg"       : "#d3aa7c",
\       "dbg"       : "#e7d0b7",
\       "string"    : "#ba7742",
\       "keyword"   : "#673403",
\       "background": "light"
\   }
\ }

" Theme
let s:theme = s:themes.yellow_red
execute 'set background='.s:theme.background

" Colors
let s:red = '#e27878'
let s:cyan = '#89b8c2'
let s:blue = '#84a0c6'
let s:green = '#b4be82'
let s:white = '#c6c8d1'
let s:black = '#161821'
let s:yellow = '#e2a478'
let s:magenta = '#a093c7'

" Attribute
let s:none = "NONE"
let s:bold = "bold"
let s:italic = "italic"
let s:underline = "underline"

function! s:hi(...)
    let group = a:1
    let fg = get(a:, 2, s:theme.fg)
    let bg = get(a:, 3, s:theme.bg)
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
let s:p = {'normal': {}, 'insert': {}, 'command': {}, 'visual': {}, 'replace': {}, 'inactive': {}, 'tabline': {}}
let s:p.normal.left = [[s:theme.bg, s:theme.fg], [s:theme.fg, s:theme.lbg]]
let s:p.normal.right = [[s:theme.fg, s:theme.lbg], [s:theme.fg, s:theme.lbg]]
let s:p.normal.middle = [[s:theme.fg, s:theme.dbg]]
let s:p.insert.left = [[s:theme.bg, s:theme.keyword], [s:theme.fg, s:theme.lbg]]
let s:p.command.left = [[s:theme.bg, s:theme.keyword], [s:theme.fg, s:theme.lbg]]
let s:p.visual.left = [[s:theme.bg, s:theme.string], [s:theme.fg, s:theme.lbg]]
let s:p.replace.left = [[s:theme.bg, s:theme.fg], [s:theme.fg, s:theme.lbg]]
let s:p.inactive.left = [[s:theme.fg, s:theme.lbg]]
let s:p.tabline.left = [[s:theme.fg, s:theme.dbg]]
let s:p.tabline.tabsel = [[s:theme.fg, s:theme.lbg]]
let s:p.tabline.middle = [[s:theme.fg, s:theme.dbg]]
let g:lightline#colorscheme#monochrome#palette = lightline#colorscheme#fill(s:p)

" --- Vim Interface -----------------------------------------------------------
call s:hi("Normal")
call s:hi("CursorLine", s:theme.keyword, s:theme.lbg)
call s:hi("CursorLineNr", s:theme.keyword, s:theme.bg, s:bold)
call s:hi("ColorColumn", s:none, s:theme.dbg)
call s:hi("Search", s:theme.bg, s:theme.keyword)
call s:hi("Visual", s:theme.keyword, s:theme.lbg)
call s:hi("ErrorMsg", s:white, s:red)
call s:hi("NonText", s:theme.lbg)
call s:hi("LineNr", s:theme.lbg)
call s:hi("Directory")
call s:hi("SignColumn")
call s:hi("MatchParen", s:theme.keyword, s:theme.lbg)
call s:hi("Title", s:theme.string)
call s:hi("Pmenu", s:theme.fg, s:theme.dbg)
call s:hi("PmenuSel", s:theme.string, s:theme.lbg)
call s:hi("PmenuSbar", s:none, s:theme.lbg)
call s:hi("PmenuThumb", s:none, s:theme.string)

" --- Programming languages ---------------------------------------------------
call s:hi("Comment", s:theme.lbg)

call s:hi("Constant", s:theme.fg)
call s:hi("String", s:theme.string)
call s:hi("Character", s:theme.fg)
call s:hi("Number", s:theme.fg)
call s:hi("Boolean", s:theme.fg)
call s:hi("Float", s:theme.fg)

call s:hi("Identifier", s:theme.fg)
call s:hi("Function", s:theme.fg)

call s:hi("Statement", s:theme.keyword)
call s:hi("Conditional", s:theme.keyword)
call s:hi("Repeat", s:theme.keyword)
call s:hi("Label", s:theme.fg)
call s:hi("Operator", s:theme.fg)
call s:hi("Keyword", s:theme.fg)
call s:hi("Exception", s:theme.fg)

call s:hi("PreProc", s:theme.fg)
call s:hi("Include", s:theme.keyword)
call s:hi("Define", s:theme.keyword)
call s:hi("Macro", s:theme.keyword)
call s:hi("PreCondit", s:theme.keyword)

call s:hi("Type", s:theme.fg)
call s:hi("StorageClass", s:theme.keyword)
call s:hi("Structure", s:theme.fg)
call s:hi("Typedef", s:theme.keyword)

call s:hi("Special", s:theme.keyword)
call s:hi("SpecialComment", s:theme.keyword)
"TODO
"call s:hi("SpecialChar", s:cyan)
"call s:hi("Tag", s:cyan)
"call s:hi("Delimiter", s:cyan)
"call s:hi("Debug", s:cyan)

call s:hi("Todo", s:theme.lbg)

" --- TypeScript --------------------------------------------------------------
call s:hi("typescriptDocComment", s:theme.fg)
call s:hi("typescriptMagicComment", s:theme.string)
call s:hi("typescriptRef", s:theme.lbg)
call s:hi("typescriptTemplateSB", s:theme.keyword)
call s:hi("typescriptIdentifier", s:theme.keyword)
call s:hi("typescriptVariable", s:theme.keyword)
call s:hi("typescriptEnumKeyword", s:theme.keyword)
call s:hi("typescriptOperator", s:theme.keyword)
call s:hi("typescriptKeywordOp", s:theme.keyword)
call s:hi("typescriptMethodAccessor", s:theme.keyword)
call s:hi("typescriptAsyncFuncKeyword", s:theme.keyword)
call s:hi("typescriptObjectAsyncKeyword", s:theme.keyword)
call s:hi("typescriptAsyncFor", s:theme.keyword)
call s:hi("typescriptFuncKeyword", s:theme.keyword)
call s:hi("typescriptArrowFunc", s:theme.keyword)
call s:hi("typescriptInterfaceExtends", s:theme.keyword)
call s:hi("typescriptConstraint", s:theme.keyword)
call s:hi("typescriptClassExtends", s:theme.keyword)
call s:hi("typescriptDecorator", s:theme.string)
call s:hi("typescriptClassKeyword", s:theme.keyword)
call s:hi("typescriptInterfaceKeyword", s:theme.keyword)
call s:hi("typescriptReadonlyModifier", s:theme.keyword)
call s:hi("typescriptReadonlyArrayKeyword", s:theme.keyword)
call s:hi("typescriptAccessibilityModifier", s:theme.keyword)
call s:hi("typescriptConstructSignature", s:theme.keyword)
call s:hi("typescriptAliasKeyword", s:theme.keyword)
call s:hi("tsxTagName", s:theme.keyword)
call s:hi("tsxIntrinsicTagName", s:theme.keyword)

" --- JavaScript --------------------------------------------------------------
call s:hi("javaScriptOperator", s:theme.keyword)
call s:hi("javaScriptFunction", s:theme.keyword)
call s:hi("javaScriptIdentifier", s:theme.keyword)
call s:hi("javaScriptLabel", s:theme.keyword)
call s:hi("javaScriptException", s:theme.keyword)
call s:hi("javaScriptReserved", s:theme.keyword)
call s:hi("javaScriptEmbed", s:theme.fg)

" --- CSS ---------------------------------------------------------------------
call s:hi("cssTagName", s:theme.string)
call s:hi("cssSelectorOp", s:theme.string)
call s:hi("cssSelectorOp2", s:theme.string)
call s:hi("cssPseudoClassId", s:theme.string)
call s:hi("cssIdentifier", s:theme.string)
call s:hi("cssAtRule", s:theme.keyword)
call s:hi("cssAtKeyword", s:theme.keyword)
call s:hi("cssClassName", s:theme.string)
call s:hi("cssClassNameDot", s:theme.string)
call s:hi("cssProp", s:theme.keyword)
call s:hi("cssAttr", s:theme.fg)

" --- SCSS --------------------------------------------------------------------
call s:hi("sassId", s:theme.string)
call s:hi("sassFor", s:theme.keyword)
call s:hi("sassClass", s:theme.string)
call s:hi("sassMixin", s:theme.keyword)
call s:hi("sassMedia", s:theme.keyword)
call s:hi("sassIdChar", s:theme.string)
call s:hi("sassMixing", s:theme.keyword)
call s:hi("sassReturn", s:theme.keyword)
call s:hi("sassExtend", s:theme.keyword)
call s:hi("sassControl", s:theme.keyword)
call s:hi("sassCharset", s:theme.keyword)
call s:hi("sassClassChar", s:theme.string)
call s:hi("sassAmpersand", s:theme.string)
call s:hi("sassPlaceholder", s:theme.string)
call s:hi("sassFunctionDecl", s:theme.keyword)
call s:hi("sassMediaOperators", s:theme.keyword)

" --- HTML --------------------------------------------------------------------
let html_no_rendering = 1
call s:hi("htmlSpecialTagName", s:theme.keyword)
call s:hi("javaScript", s:theme.fg)

" --- Pug ---------------------------------------------------------------------
call s:hi("pugScriptConditional", s:theme.keyword)
call s:hi("pugScriptLoopKeywords", s:theme.keyword)
call s:hi("pugScriptStatement", s:theme.keyword)
call s:hi("pugIdChar", s:theme.string)
call s:hi("pugClassChar", s:theme.string)
call s:hi("pugPipeChar", s:theme.fg)
call s:hi("pugId", s:theme.string)
call s:hi("pugClass", s:theme.string)
call s:hi("pugDocType", s:theme.lbg)

" --- Go ----------------------------------------------------------------------
" TODO

" --- Rust --------------------------------------------------------------------
" TODO

" --- Python ------------------------------------------------------------------
" TODO

" --- VimL --------------------------------------------------------------------
" TODO

" --- JSON --------------------------------------------------------------------
call s:hi("jsonBraces", s:theme.fg)
call s:hi("jsonKeyword", s:theme.keyword)

" --- Markdown --- "
call s:hi("markdownBlockquote", s:theme.keyword)
call s:hi("markdownRule", s:theme.keyword)
call s:hi("markdownLinkText", s:theme.keyword)
call s:hi("markdownItalicDelimiter", s:theme.keyword)
call s:hi("markdownBoldDelimiter", s:theme.keyword)

" --- Telescope ---------------------------------------------------------------
call s:hi("TelescopeMatching", s:theme.bg, s:theme.keyword)

" --- NERDTree ----------------------------------------------------------------
call s:hi("NERDTreeExecFile", s:theme.string)

" --- Plug --------------------------------------------------------------------
call s:hi("plugDeleted", s:theme.lbg)

" --- Diffs -------------------------------------------------------------------
"call s:hi("diffFile", s:cgray)
"call s:hi("diffNewFile", s:cgray)
"call s:hi("diffIndexLine", s:cgray)
"call s:hi("diffLine", s:cgray)
"call s:hi("diffSubname", s:cgray)
"call s:hi("diffAdded", s:white, s:green)
"call s:hi("diffRemoved", s:white, s:red)

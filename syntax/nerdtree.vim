" let s:tree_up_dir_line = '../'
syn match NERDTreeIgnore #\~#
exec 'syn match NERDTreeIgnore #\['.g:NERDTreeGlyphReadOnly.'\]#'

"highlighting for the .. (up dir) line at the top of the tree
" execute "syn match NERDTreeUp #\\V". s:tree_up_dir_line .'#'

"quickhelp syntax elements
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*:#ms=s+2,me=e-1
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*,#ms=s+2,me=e-1
syn match NERDTreeHelpTitle #" .*\~$#ms=s+2,me=e-1
syn match NERDTreeToggleOn #(on)#ms=s+1,he=e-1
syn match NERDTreeToggleOff #(off)#ms=e-3,me=e-1
syn match NERDTreeHelpCommand #" :.\{-}\>#hs=s+3
syn match NERDTreeHelp  #^".*# contains=NERDTreeHelpKey,NERDTreeHelpTitle,NERDTreeIgnore,NERDTreeToggleOff,NERDTreeToggleOn,NERDTreeHelpCommand

"highlighting for sym links
syn match NERDTreeLinkTarget #->.*# containedin=NERDTreeDir,NERDTreeFile
syn match NERDTreeLinkFile #.* ->#me=e-3 containedin=NERDTreeFile
syn match NERDTreeLinkDir #.*/ ->#me=e-3 containedin=NERDTreeDir

"highlighting to conceal the delimiter around the file/dir name
if has('conceal')
    exec 'syn match NERDTreeNodeDelimiters #\%d' . char2nr(g:NERDTreeNodeDelimiter) . '# conceal containedin=ALL'
    setlocal conceallevel=2 concealcursor=nvic
else
    exec 'syn match NERDTreeNodeDelimiters #\%d' . char2nr(g:NERDTreeNodeDelimiter) . '# containedin=ALL'
    hi! link NERDTreeNodeDelimiters Ignore
endif

"highlighting for directory nodes and file nodes
syn match NERDTreeDirSlash #/# containedin=NERDTreeDir

if g:NERDTreeDirArrowExpandable !=# ''
    exec 'syn match NERDTreeClosable #' . escape(g:NERDTreeDirArrowCollapsible, '~') . '\ze .*/# containedin=NERDTreeDir,NERDTreeFile'
    exec 'syn match NERDTreeOpenable #' . escape(g:NERDTreeDirArrowExpandable, '~') . '\ze .*/# containedin=NERDTreeDir,NERDTreeFile'
    let s:dirArrows = escape(g:NERDTreeDirArrowCollapsible, '~]\-').escape(g:NERDTreeDirArrowExpandable, '~]\-')
    exec 'syn match NERDTreeDir #[^'.s:dirArrows.' ].*/#'
    exec 'syn match NERDTreeExecFile #^.*'.g:NERDTreeNodeDelimiter.'\*\($\| \)# contains=NERDTreeRO,NERDTreeBookmarkName'
    exec 'syn match NERDTreeFile  #^[^"\.'.s:dirArrows.'] *[^'.s:dirArrows.']*# contains=NERDTreeLink,NERDTreeRO,NERDTreeBookmarkName,NERDTreeExecFile'
else
    exec 'syn match NERDTreeDir #[^'.g:NERDTreeNodeDelimiter.']\{-}/\ze\($\|'.g:NERDTreeNodeDelimiter.'\)#'
    exec 'syn match NERDTreeExecFile #[^'.g:NERDTreeNodeDelimiter.']\{-}'.g:NERDTreeNodeDelimiter.'\*\($\| \)# contains=NERDTreeRO,NERDTreeBookmarkName'
    exec 'syn match NERDTreeFile     #^.*'.g:NERDTreeNodeDelimiter.'.*[^\/]\($\|'.g:NERDTreeNodeDelimiter.'.*\)# contains=NERDTreeLink,NERDTreeRO,NERDTreeBookmarkName,NERDTreeExecFile'
endif

"highlighting for readonly files
exec 'syn match NERDTreeRO #.*'.g:NERDTreeNodeDelimiter.'\zs.*\ze'.g:NERDTreeNodeDelimiter.'.*\['.g:NERDTreeGlyphReadOnly.'\]# contains=NERDTreeIgnore,NERDTreeBookmarkName,NERDTreeFile'

exec 'syn match NERDTreeFlags #\[[^\]]*\]\ze'.g:NERDTreeNodeDelimiter.'# containedin=NERDTreeFile,NERDTreeExecFile,NERDTreeLinkFile,NERDTreeRO,NERDTreeDir'

syn match NERDTreeCWD #^[</].*$#

"highlighting for bookmarks
syn match NERDTreeBookmarkName # {.*}#hs=s+2,he=e-1

"highlighting for the bookmarks table
syn match NERDTreeBookmarksLeader #^>#
syn match NERDTreeBookmarksHeader #^>-\+Bookmarks-\+$# contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmarkName #^>.\{-} #he=e-1 contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmark #^>.*$# contains=NERDTreeBookmarksLeader,NERDTreeBookmarkName,NERDTreeBookmarksHeader

hi def link NERDTreePart Special
hi def link NERDTreePartFile Type
hi def link NERDTreeExecFile Title
hi def link NERDTreeDirSlash Identifier

hi def link NERDTreeBookmarksHeader statement
hi def link NERDTreeBookmarksLeader ignore
hi def link NERDTreeBookmarkName Identifier
hi def link NERDTreeBookmark normal

hi def link NERDTreeHelp String
hi def link NERDTreeHelpKey Identifier
hi def link NERDTreeHelpCommand Identifier
hi def link NERDTreeHelpTitle Macro
hi def link NERDTreeToggleOn Question
hi def link NERDTreeToggleOff WarningMsg

hi def link NERDTreeLinkTarget Type
hi def link NERDTreeLinkFile Macro
hi def link NERDTreeLinkDir Macro

hi def link NERDTreeDir Directory
hi def link NERDTreeUp Directory
hi def link NERDTreeFile Normal
hi def link NERDTreeCWD Statement
hi def link NERDTreeOpenable Directory
hi def link NERDTreeClosable Directory
hi def link NERDTreeIgnore ignore
hi def link NERDTreeRO WarningMsg
hi def link NERDTreeBookmark Statement
hi def link NERDTreeFlags Number

hi def link NERDTreeCurrentNode Search

hi NERDTreeFile ctermbg=NONE guibg=NONE

"-----------------------------------------------------------------------------
" Pathogen
"-----------------------------------------------------------------------------

" Pathogen is a simple library for manipulating comma delimited path options.
"
" Add this to your vimrc: 
" 
"   call pathogen#runtime_append_all_bundles() 
" 
" After adding this, you can take any plugin, unzip/untar/svn-checkout/git-clone it
" to its own private directory in .vim/bundle, and it will be added to the runtime path.
" This makes it easy to remove or update each plugin individually.
filetype off
call pathogen#runtime_append_all_bundles()  
call pathogen#helptags()



"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is chonged from the outside
set autoread

" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>



"-----------------------------------------------------------------------------
" VIM User Interface
"-----------------------------------------------------------------------------

" Set 8 lines to the cursor - when moving vertical..
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" List of patterns to ignore when executing wildmenu completion on files and dirs, also works for Command-T
set wildignore+=*.o,*.obj,.git,*.pyc,tmp/**,temp/**

" Display line numbers
set number

" Show the line and column number of the cursor position
set ruler

" Command bar height is two rows
set cmdheight=2

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acmgt

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Visual bell only, I hate that damned beeping
set noerrorbells
set visualbell

" This is the timeout used while waiting for user input on a multi-keyed macro or while 
" just sitting and waiting for another key to be pressed measured in milliseconds.
set timeoutlen=700

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

" Hide the mouse pointer while typing
set mousehide



"-----------------------------------------------------------------------------
" Moving, searching and highliting
"-----------------------------------------------------------------------------

" Allow backspacing over indent, eol, and the start of an insert
set backspace=eol,start,indent

" Allow navigating left and right over lines
set whichwrap+=<,>,h,l

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Search scan wraps
set wrapscan

" Magic is on for regular expressions
set magic

" Show matching brackets
set showmatch

" How many tenths of second to blink for matching bracket
set matchtime=2



"-----------------------------------------------------------------------------
" Text, tab and indent related
"-----------------------------------------------------------------------------

" Tabs are 4 spaces and always turn them to spaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Wrap at words
set lbr!
set linebreak

" Smart and auto indenting ON
set autoindent
set smartindent

" Wrap lines 
set wrap

" Set text width for automatic wrapping when entering text
set textwidth=750



"-----------------------------------------------------------------------------
" Colors, fonts, encoding and file formats
"-----------------------------------------------------------------------------

" Switch on syntax highlighting
syntax enable

" Setting specific for molokai theme
let g:molokai_original=0

if has("gui_running")

    if has("win32") || has("win64")
        set guifont=Envy\ Code\ R:h11
    elseif has("mac")
        set guifont=Envy\ Code\ R:h11
    else
        set guifont=Envy\ Code\ R\ 11
    endif

    colorscheme nhq-molokai

    if !exists("g:vimrcloaded")
        winpos 714 0
        if ! &diff
            winsize 150 59
        else
            winsize 227 90
        endif
        let g:vimrcloaded = 1
    endif

endif

set encoding=utf8

try 
    lang en_US
catch
endtry

set fileformats=unix,dos,mac





"-----------------------------------------------------------------------------
" Others - need to check
"-----------------------------------------------------------------------------

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
" set cpoptions=ces$

" These commands open folds
" set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" These things start comment lines
" set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Disable encryption (:X)
" set key=

" Same as default except that I remove the 'u' option
" set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
" set showfulltag

" get rid of the silly characters in window separators
" set fillchars=""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Initial path seeding
set path=
set path+=/usr/local/include/**
set path+=/usr/include/**
set path+=~/code/**

" Set the tags files to be the following
set tags=./tags,tags

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
" nmap <silent> ,cd :lcd %:h<CR>
" nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
" nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" put the vim directives for my file editing settings in
" nmap <silent> ,vi
"      \ ovim:set ts=4 sts=4 sw=4:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Show all available VIM servers
" nmap <silent> ,ss :echo serverlist()<CR>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
" nmap <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
"      \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
"      \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
"      \ . ">"<CR>

" set text wrapping toggles
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Run the command that was just yanked
" nmap <silent> ,rc :@"<cr>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
" cnoremap <ESC>b     <S-Left>
" cnoremap <ESC><C-B> <S-Left>
" cnoremap <ESC>f     <S-Right>
" cnoremap <ESC><C-F> <S-Right>
" cnoremap <ESC><C-H> <C-W>

" Maps to make handling windows a bit easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Map CTRL-E to do what ',' used to do
" nnoremap <c-e> ,
" vnoremap <c-e> ,

" Delete current buffer
noremap <silent> <leader>bd :bd<CR>

" Switch to next buffer
noremap <silent> <leader>n :b#<CR>

" Deleta all buffers
noremap <silent> <leader>ba :1,300 bd!<cr>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Search the current file for what's currently in the search
" register and display matches
" nmap <silent> ,gs
"      \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048




" I don't like it when the matching parens are automatically highlighted
" let loaded_matchparen = 1

"-----------------------------------------------------------------------------
" MiniBufExplorer Plugin Settings
"-----------------------------------------------------------------------------
" Yup, I don't like this one either
" let loaded_minibufexplorer = 1

"-----------------------------------------------------------------------------
" ShowMarks Plugin Stuff
"-----------------------------------------------------------------------------
" I don't think I like this
" let g:loaded_showmarks = 1

"-----------------------------------------------------------------------------
" Source Explorer Plugin Settings
"-----------------------------------------------------------------------------
" The switch of the Source Explorer
" nmap <silent> <F8> :SrcExplToggle<CR>

" Set the height of Source Explorer window
" let g:SrcExpl_winHeight = 16

" Set 10 ms for refreshing the Source Explorer
" let g:SrcExpl_refreshTime = 10

" In order to Avoid conflicts, the Source Explorer should know what plugins
" are using buffers. And you need add their bufname into the list below
" according to the command ":buffers!"
" let g:SrcExpl_pluginList = [
"             \ "_NERD_tree_",
"             \ "Source_Explorer"
"             \ ]
" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
" let g:SrcExpl_searchLocalDef = 1

" Do not let the Source Explorer update the tags file when opening
" let g:SrcExpl_isUpdateTags = 0

" Use program 'ctags' with argument '--sort=foldcase -R' to create or
" update a tags file
" let g:SrcExpl_updateTagsCmd = "retag.ksh"

" Set "<F9>" key for updating the tags file artificially
" let g:SrcExpl_updateTagsKey = "<F9>" 

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <silent> <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <silent> <S-F7> :NERDTreeClose<CR>

" Store the bookmarks file in perforce
" let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]


"-----------------------------------------------------------------------------
" Command-T
"-----------------------------------------------------------------------------
" Command-T file finder
nmap <silent> <Leader>t :CommandT<CR>
" Command-T rescan files in current directory
nmap <silent> <Leader>tf :CommandTFlush<CR>

let g:CommandTMaxFiles=100000
let g:CommandTMaxDepth=30
"let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=20

"-----------------------------------------------------------------------------
" FSwitch Settings
"-----------------------------------------------------------------------------
" nmap <silent> ,of :FSHere<CR>
" nmap <silent> ,ol :FSRight<CR>
" nmap <silent> ,oL :FSSplitRight<CR>
" nmap <silent> ,oh :FSLeft<CR>
" nmap <silent> ,oH :FSSplitLeft<CR>
" nmap <silent> ,ok :FSAbove<CR>
" nmap <silent> ,oK :FSSplitAbove<CR>
" nmap <silent> ,oj :FSBelow<CR>
" nmap <silent> ,oJ :FSSplitBelow<CR>

"-----------------------------------------------------------------------------
" SnipMate Settings
"-----------------------------------------------------------------------------
"source ~/.vim/snippets/support_functions.vim
"source ~/.vim/snippets/support_functions_derek.vim

" function! ListKnownSnippetLanguageTypes(A, L, P)
"     let filesanddirs = split(globpath(g:snippets_dir, a:A . "*"), "\n")
"     let dirsonly = []
"     for f in filesanddirs
"         if isdirectory(f)
"             let each = split(f, '/')
"             let dirsonly = add(dirsonly, each[-1])
"         end
"     endfor
"     return dirsonly
" endfunction

" function! ReloadSnippets(type)
"     call ResetSnippets()
"     if a:type != ""
"         call ExtractSnips(g:snippets_dir . a:type, a:type)
"     else
"         let alltypes = ListKnownSnippetLanguageTypes("", "", "")
"         for type in alltypes
"             call ExtractSnips(g:snippets_dir . type, type)
"         endfor
"     endif
" endfunction

" command! -complete=customlist,ListKnownSnippetLanguageTypes
"          \ -nargs=? RS call ReloadSnippets("<args>")

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
nmap ,fb :FufBuffer<CR>
nmap ,ff :FufFile<CR>
nmap ,ft :FufTag<CR>

" Set additional tags for FuzzyFinder - generated by executing 'ftag.sh .' at terminal
" set tags+=ftags 

"-----------------------------------------------------------------------------
" UltiSnips Settings
"-----------------------------------------------------------------------------
" set runtimepath+=~/.vim/ultisnips
" let g:UltiSnipsExpandTrigger="<c-9>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

" function! RunSystemCall(systemcall)
"     let output = system(a:systemcall)
"     let output = substitute(output, "\n", '', 'g')
"     return output
" endfunction

"au FileType javascript call JavaScriptFold()



"-----------------------------------------------------------------------------
" Javascript section
"-----------------------------------------------------------------------------

au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
" augroup derek_scons
"     au!
"     au BufNewFile,BufRead SCons* setf scons
" augroup END

" augroup derek_xsd
"     au!
"     au BufEnter *.xsd,*.wsdl,*.xml setl tabstop=4 | setl shiftwidth=4
"     au BufEnter *.xsd,*.wsdl,*.xml setl formatoptions=crq | setl textwidth=80
" augroup END

" augroup Binary
"     au!
"     au BufReadPre   *.bin let &bin=1
"     au BufReadPost  *.bin if &bin | %!xxd
"     au BufReadPost  *.bin set filetype=xxd | endif
"     au BufWritePre  *.bin if &bin | %!xxd -r
"     au BufWritePre  *.bin endif
"     au BufWritePost *.bin if &bin | %!xxd
"     au BufWritePost *.bin set nomod | endif
" augroup END

"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------

iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate
iab fone      phone
iab Fone      Phone



"-----------------------------------------------------------------------------
" Other abbreviations
"-----------------------------------------------------------------------------

iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

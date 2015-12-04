set encoding=utf-8
syntax on
set autoindent
set shiftwidth=2
set expandtab
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set number
set fileencodings=utf-8
set clipboard=unnamed,unnamedplus,autoselect
set viminfo='20,<1000,s10,h
set hlsearch
set t_Co=256
set backspace=indent,eol,start
set wildmode=list:longest

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleCheck

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a "Google Chrome"'

" カッコを補完する 範囲選択→Shift+S " など
NeoBundle 'tpope/vim-surround'

" VimでShellを起動するプラグイン
NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'tomasr/molokai'
NeoBundle 'noahfrederick/vim-hemisu'

" :Unite jazzradio
" :JazzradioUpdateChannels
" :JazzradioPlay
" :JazzradioStop
" http://blog.supermomonga.com/articles/vim/jazzradio-vim-released.html
NeoBundle 'supermomonga/jazzradio.vim', { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('jazzradio.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'jazzradio'
        \     ],
        \     'commands' : [
        \       'JazzradioUpdateChannels',
        \       'JazzradioStop',
        \       {
        \         'name' : 'JazzradioPlay',
        \         'complete' : 'customlist,jazzradio#channel_key_complete'
        \       }
        \     ],
        \     'function_prefix' : 'jazzradio'
        \   }
        \ })
endif


" インデント綺麗に成形
NeoBundle 'junegunn/vim-easy-align'
vmap ;a <Plug>(EasyAlign)

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" add plugins
NeoBundle 'tomtom/tcomment_vim'
vnoremap ! :TComment<CR>

" シンタックスハイライト用のベースプラグイン
"NeoBundle "tpope/vim-pathogen"
"execute pathogen#infect()

" QML用のシンタックスハイライト
NeoBundle "peterhoeg/vim-qml"

" カーソル部分が光るプラグイン
"NeoBundle "osyo-manga/vim-brightest"

NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'bbatsov/rubocop'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'YankRing.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'wesleyche/Trinity'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Shougo/vimproc', {
              \ 'build' : {
              \     'windows' : 'make -f make_mingw32.mak',
              \     'cygwin' : 'make -f make_cygwin.mak',
              \     'mac' : 'make -f make_mac.mak',
              \     'unix' : 'make -f make_unix.mak',
              \    },
              \ }
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'yegappan/mru'

" :Unite outline
NeoBundle 'h1mesuke/unite-outline'
let g:unite_data_directory = '~/'
let g:unite_abbr_highlight = 'Nomal'

au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

"NeoBundle 'TwitVim'
"let twitvim_browser_cmd = 'open' " for Mac
"let twitvim_force_ssl = 1
"let twitvim_count = 40

" Neo Snippet
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'


call neobundle#end()


" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" 自分用 snippet ファイルの場所
let s:my_snippet = '~/snippets/'
let g:neosnippet#snippets_directory = s:my_snippet
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" 補完候補の数
let g:neocomplcache_max_list = 5
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1


" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><Enter> pumvisible() ? neocomplcache#close_popup() : ""
inoremap <expr><Space> (pumvisible() ? neocomplcache#cancel_popup() : "\<Space>")

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Close popup by <Space>.
"inoremap <expr><Space>  pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" End NeoCompleteCache -------------------------------------------------


hi IndentGuidesOdd  ctermbg=206 ctermfg=206
hi IndentGuidesEven ctermbg=7 ctermfg=7

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" over.vimの起動
nnoremap ,m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>


" for lightline.vim --------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
set laststatus=2

" #MRU
let MRU_Auto_Close=1
let MRU_Window_Height=15
let MRU_Max_Entries=100
let MRU_Window_Open_Always=1
let MRU_Open_File_Use_Tabs=1

" NERDTREE
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


colorscheme molokai
""set background=light
""colorscheme hemisu

"hi Normal ctermfg=188 ctermbg=500
hi Normal ctermbg=NONE

let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
let g:quickhl_manual_colors = ["cterm=underline,bold ctermbg=87 ctermfg=202"]

hi Normal ctermbg=None
hi rubyControl ctermbg=None
hi rubyBeginEnd ctermbg=None ctermfg=46
hi rubyEval ctermbg=None ctermfg=125
hi LineNr ctermbg=None ctermfg=114
hi Visual cterm=reverse
hi Search cterm=underline ctermfg=160 ctermbg=7
hi Folded cterm=None ctermfg=135 ctermbg=None
hi htmlTagName cterm=None ctermfg=165
hi htmlLink cterm=None ctermfg=25

" Key Mapping
nmap sp :YRShow<CR>
nmap <C-F> :Unite file buffer<CR>
nmap <C-B> :Unite buffer<CR>

nnoremap !rspec :w <CR> :! rspec %<CR>
nnoremap !!R :w <CR> :! ruby %<CR>
nnoremap !!!R :w <CR> :! rails runner %
nnoremap !!P :w <CR> :! python %<CR>
nnoremap !!B :w <CR> :! bundle exec ruby %<CR>
nnoremap !R :R<CR>
nnoremap ! :Switch<CR>
nnoremap R :MRU<CR>
nnoremap ;p :set paste! paste?<CR>
nnoremap ;h :noh<CR>
nnoremap ;n :set number! number?<CR>
nnoremap e :Unite outline<CR>
nnoremap <silent> <TAB>c :tabnew<CR>
nnoremap <silent> <TAB>n :tabnext<CR>
nnoremap <silent> <TAB>w :tabclose<CR>
nnoremap <silent> <TAB><S-w> :tabonly<CR>
nnoremap <silent> <TAB>1 :tabn 1<CR>
nnoremap <silent> <TAB>2 :tabn 2<CR>
nnoremap <silent> <TAB>3 :tabn 3<CR>
nnoremap <silent> <TAB>4 :tabn 4<CR>
nnoremap <silent> <TAB>5 :tabn 5<CR>
nnoremap <silent> <TAB><TAB> :tabnext <CR>
nnoremap <silent> <TAB><RIGHT> :tabnext <CR>
nnoremap <silent> <TAB><LEFT> :tabprevious <CR>
nnoremap <silent> <S-F> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <silent> <S-T><S-W> :TweetVimHomeTimeline<CR>

nnoremap ;tw :TweetVimSay<CR>
nnoremap ;twh :TweetVimHomeTimeline<CR>

nnoremap <Space>ig :IndentGuidesToggle<CR>

nmap <Space><Space> <Plug>(quickhl-manual-this)
xmap <Space><Space> <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap ![ [
inoremap !{ {
inoremap !" "
inoremap !( (
inoremap !<BS> <BS><RIGHT><BS>
inoremap !$ <ESC>$a
inoremap !0 <ESC>0i
inoremap !W <ESC><RIGHT>wi
inoremap <% <% %><LEFT><LEFT><LEFT>

nnoremap !# 0i#<ESC>$
nnoremap !!# 0x<ESC>$
nnoremap !B 0i<CR><UP>=begin<ESC>
nnoremap !E 0i<CR><UP>=end<ESC>

nnoremap WW <C-W>o
vnoremap ;q :QuickRun<CR>
nnoremap ;r :set filetype=ruby<CR>

nnoremap W<S-RIGHT> <C-W>l
nnoremap W<S-LEFT> <C-W>h
nnoremap W<S-UP> <C-W>k
nnoremap W<S-Down> <C-W>j
nnoremap N :NERDTree<CR>

nnoremap <S-RIGHT> O
nnoremap <S-B> :! bash<CR>
nnoremap <S-B><S-B> :!<UP><CR>

" Mark down shortcut
inoremap ;ml [タイトル](URL)<LEFT><LEFT><LEFT>
inoremap ;mi ![タイトル](URL)<LEFT><LEFT><LEFT>


"Switch
let s:switch_definition = {
      \ '*': [
      \   ['is', 'are']
      \ ],
      \ 'ruby,eruby,haml' : [
      \   ['if', 'unless'],
      \   ['while', 'until'],
      \   ['.blank?', '.present?','.size==0','.nil?'],
      \   ['include', 'extend'],
      \   ['class', 'module'],
      \   ['.inject', '.delete_if'],
      \   ['.map', '.map!'],
      \   ['attr_accessor', 'attr_reader', 'attr_writer'],
      \   ['do','{'],
      \   ['end','}']
      \ ],
      \ 'Gemfile,Berksfile' : [
      \   ['=', '<', '<=', '>', '>=', '~>'],
      \ ],
      \ 'ruby.application_template' : [
      \   ['yes?', 'no?'],
      \   ['lib', 'initializer', 'file', 'vendor', 'rakefile'],
      \   ['controller', 'model', 'view', 'migration', 'scaffold'],
      \ ],
      \ 'rspec': [
      \   ['describe', 'context', 'specific', 'example'],
      \   ['before', 'after'],
      \   ['be_true', 'be_false'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'eql', 'equal'],
      \   { '\.should_not': '\.should' },
      \   ['\.to_not', '\.to'],
      \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
      \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
      \ ],
      \ 'markdown' : [
      \   ['[ ]', '[x]']
      \ ]
      \ }

nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'

if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

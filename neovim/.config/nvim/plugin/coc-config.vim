let g:coc_global_extensions = [
\ 'coc-eslint',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-highlight',
\ 'coc-snippets',
\ 'coc-vetur',
\ 'coc-json',
\ 'coc-prettier',
\ ]
" 太長的更新間隔會導致明顯的延遲並降低使用者體驗（預設是 4000 ms = 4s ）
set updatetime=200
" Run color highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" 永遠顯示 signcolumn（行號左邊那個，這我不知道怎麼翻），否則每當有診斷出來時整個程式碼就會被往右移
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " 新的版本可以把 signcolumn 和行號合併（這個我版本不夠沒看過，有人知道會長怎樣可以下面留言嗎？）
  set signcolumn=number
else
  set signcolumn=yes
endif

" 用 tab 鍵觸發自動補全
" 注意：載入設定後記得用命令 `verbose imap <tab>` 確定這沒有被其他外掛覆蓋掉
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 讓 enter 鍵自動完成第一個建議並讓 coc 進行格式化（不確定個格式化指的是什麼，我看不太出來）
" enter 可以被重複 keymap（看不懂就算了，意思是你亂搞不會出錯）
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 用 \rn 重新命名變數、函數（原文寫「符號」）
nmap <leader>rn <Plug>(coc-rename)

" 這個讓你可以捲動浮動視窗和跳出式框框（有時候自動補全給你的文件會太長超出螢幕，如果你想要看下面的內容必須設定這個）
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <S-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <S-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <S-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <S-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
" Cursor
hi CocCursorRange guibg=#b16286 guifg=#ebe1c0
nmap <expr><silent> <C-s> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunction

nnoremap <leader>fx :CocCommand eslint.executeAutofix<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

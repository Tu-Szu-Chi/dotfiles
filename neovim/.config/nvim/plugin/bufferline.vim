lua << EOF
require'bufferline'.setup {
      options = {
     numbers = "ordinal",
offsets = {
  {
    filetype = "NvimTree",
    text = "",
    highlight = "Directory",
    text_align = "left"
  }
}
     },
     }
EOF

nnoremap <silent><leader>[ :BufferLineCyclePrev<Cr>
nnoremap <silent><leader>] :BufferLineCycleNext<Cr>
nnoremap <A-Up> :m-2<CR>

" Go to tab by number
noremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
noremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
noremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
noremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
noremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
noremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
noremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
noremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
noremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

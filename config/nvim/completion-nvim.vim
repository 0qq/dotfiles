" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_chain_complete_list = [
                              \{'complete_items': ['lsp', 'snippet']},
                              \{'mode': '<c-p>'},
                              \{'mode': '<c-n>'}
                              \]
let g:completion_enable_snippet = 'UltiSnips'
command! Format  execute 'lua vim.lsp.buf.formatting()'

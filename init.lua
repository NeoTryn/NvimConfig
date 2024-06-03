vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.cmd('syntax enable')

vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
Plug 'tomasr/molokai'
call plug#end()
]]

vim.cmd('colorscheme molokai')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp"},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

vim.api.nvim_create_user_command('RemoveCarriageReturn', function()
  vim.cmd [[%s/\r//g]]
end, {})

-- Set up coc.nvim
vim.cmd [[
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use `K` to show documentation in preview window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Use `<leader>rn` to rename current symbol
nnoremap <silent> <leader>rn <Plug>(coc-rename)

" Use `<leader>f` to format selected region or buffer
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer
command! -nargs=0 Fold :call CocAction('fold')

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Remap keys for applying codeAction to the current buffer
nmap <leader>a  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)

" Remap keys for applying codeAction to the current line
nmap <leader>qf  <Plug>(coc-fix-current)
]]

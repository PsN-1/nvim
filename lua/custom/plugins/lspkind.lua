return {
  'onsails/lspkind-nvim',
  {
    'preservim/nerdtree',
    cmd = { 'NERDTreeToggle', 'NERDTreeFind', 'NERDTree' },
    keys = { { '<leader>v', desc = '[V]iew file tree' } },
    init = function()
      vim.g.NERDTreeShowHidden = 1
    end,
  },
  'prisma/vim-prisma',
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}

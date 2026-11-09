-- Tweaks for very large repos (especially Go monorepos).

-- Skip expensive extras on huge files.
vim.api.nvim_create_autocmd('BufReadPre', {
  group = vim.api.nvim_create_augroup('large-file-perf', { clear = true }),
  callback = function(event)
    local path = vim.api.nvim_buf_get_name(event.buf)
    if path == '' then
      return
    end
    local ok, size = pcall(vim.uv.fs_stat, path)
    if not ok or not size or size.size < 1024 * 1024 then
      return
    end
    vim.b[event.buf].large_file = true
    vim.bo[event.buf].undolevels = -1
    if vim.treesitter and vim.treesitter.stop then
      pcall(vim.treesitter.stop, event.buf)
    end
  end,
})

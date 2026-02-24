return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}

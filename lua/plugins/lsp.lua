-- lua/plugins/lsp.lua
local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify("❌ Mason 未安装", "error")
  return
end

local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok2 then
  vim.notify("❌ mason-lspconfig 未安装", "error")
  return
end

local ok3, lspconfig = pcall(require, "lspconfig")
if not ok3 then
  vim.notify("❌ lspconfig 未安装", "error")
  return
end

-- Mason 基础配置
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- mason-lspconfig 配置
mason_lspconfig.setup({
  ensure_installed = { "lua_ls" },
  automatic_installation = false,  -- 关键：禁止自动安装，避免冲突
})

-- 获取 cmp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- 通用 on_attach 函数
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

-- === 核心修复：手动配置，不使用 setup_handlers ===
-- 只配置你明确指定的服务器

-- 配置 lua_ls（确保只配置一次）
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- 注意：不要重复调用！只保留这一个配置

-- 如果你需要其他语言，在这里添加，例如：
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- import tokyonight plugin safely
local tokyonight_status = pcall(require, "tokyonight")

if not tokyonight_status then
    return
else
    vim.cmd([[colorscheme tokyonight]])
end

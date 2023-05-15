-- import nord plugin safely
local nord_status, nord = pcall(require, "nord")

if not nord_status then
    return
else
    vim.cmd([[colorscheme nord]])
end

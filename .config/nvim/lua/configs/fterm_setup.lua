-- import fterm plugin safely
local fterm_status, fterm = pcall(require, "FTerm")

if not fterm_status then
    return
end

-- set up fterm with some default options.
fterm.setup({
    border = "single", -- use a single-line border.
    dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
    },
    position = "center", -- center the terminal in the middle of the screen.
})

-- define a user command to run Python scripts.
vim.cmd([[command! -nargs=* Pyexec lua require("FTerm").run("python3 " .. table.concat({...}, " "))]])

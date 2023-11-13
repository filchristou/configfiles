-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--functions
function toggle_background()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    elseif vim.o.background == "light" then
        vim.o.background = "dark"
    end
    print("vim.o.background=" .. vim.o.background)
end

function toggle_virtualedit()
    if vim.o.virtualedit == "insert" or vim.o.virtualedit == "block" or vim.o.virtualedit == "onemore" or vim.o.virtualedit == "" then
        vim.o.virtualedit = "all"
    else
        vim.o.virtualedit = "block"
    end
    print("vim.o.virtualedit=" .. vim.o.virtualedit)
end

function visual_selection_range()
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
    if csrow < cerow or (csrow == cerow and cscol <= cecol) then
        return csrow, cerow
    else
        return cerow, csrow
    end
end

function catselection(file)
    fr, lr = visual_selection_range()
    filpath = vim.fn.expand('%')
    com = string.format("sed -n %s,%sp %s > %s", fr, lr, filpath, file)
    vim.cmd("!"..com)
end

function catandshowdiff()
    catselection("~/.util/ds/diff2.txt")
    showdiff(0)
end

function showdiff(mode)
    if mode == 1 then
        vim.cmd("split | term git --no-pager diff --no-index /u/home/wima/fchrstou/.util/ds/diff1.txt /u/home/wima/fchrstou/.util/ds/diff2.txt")
    else
        vim.cmd("split | term git --no-pager diff --no-index --word-diff /u/home/wima/fchrstou/.util/ds/diff1.txt /u/home/wima/fchrstou/.util/ds/diff2.txt")
    end
end

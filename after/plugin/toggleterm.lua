local Terminal  = require('toggleterm.terminal').Terminal
local M = {}
require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    vim.api.nvim_set_keymap("n", "<leader>s",  "<cmd>lua _spotifytui_toggle()<CR>", {noremap = true, silent = true}),
    vim.api.nvim_set_keymap("n", "<leader>b",  "<cmd>lua _btop_toggle()<CR>", {noremap = true, silent = true}),
    vim.api.nvim_set_keymap("n", "<leader>g",  "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true}),
    vim.api.nvim_set_keymap("n", "<leader>f",  "<cmd>lua _floatingterm_toggle()<CR>", {noremap = true, silent = true}),
    vim.api.nvim_set_keymap("n", "<leader>j",  "<cmd>lua _horizontalterm_toggle()<CR>", {noremap = true, silent = true}),
    vim.api.nvim_set_keymap("n", "<leader>x",  "<cmd>lua _xplr_toggle()<CR>", {noremap = true, silent = true}),
    vim.api.nvim_set_keymap("n", "<leader>nd", "<cmd>lua _discordo_toggle()<CR>", {noremap = true, silent = true}),

    vim.cmd([[command Spt lua _spotifytui_toggle()]]),
    vim.cmd([[command Discordo lua _discordo_toggle()]]),
    vim.cmd([[command Xplr lua _xplr_toggle()]]),
    vim.cmd([[command Horizontalterm lua _horizontalterm_toggle()]]),
    vim.cmd([[command Btop lua _btop_toggle()]]),
    vim.cmd([[command Floatingterm lua _floatingterm_toggle()]]),
    vim.cmd([[command Lazygit lua _lazygit_toggle()]]),
})

local xplr = Terminal:new({
    cmd = "xplr",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },

    on_open = function(term)
        vim.cmd("startinsert!")
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})

local discordo = Terminal:new({
    cmd = "discordo",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})
local spotifytui = Terminal:new({
    cmd = "spt",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})

local btop = Terminal:new({
    cmd = "btop",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})

local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local floatingterm = Terminal:new({
    cmd = "tmux",
    dir = "git_dir",
    direction = "float",
    float_opts = {},

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local horizontalterm = Terminal:new({
    cmd = "tmux",
    dir = "git_dir",
    direction = "horizontal",
    float_opts = {},

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})

local horizontalterm = Terminal:new({
    cmd = "tmux",
    dir = "git_dir",
    direction = "horizontal",
    float_opts = {},

    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,

    on_close = function(term)
        vim.cmd("startinsert!")
    end,

})

function _xplr_toggle()
    xplr:toggle()
end

function _discordo_toggle()
    discordo:toggle()
end

function _spotifytui_toggle()
    spotifytui:toggle()
end

function _btop_toggle()
    btop:toggle()
end


function _lazygit_toggle()
    lazygit:toggle()
end

function _floatingterm_toggle()
    floatingterm:toggle()
end

function _horizontalterm_toggle()
    horizontalterm:toggle()
end


return {
    _xplr_toggle = _xplr_toggle,
    _discordo_toggle = _discordo_toggle,
    _spotifytui_toggle = _spotifytui_toggle,
    _btop_toggle = _btop_toggle,
    _lazygit_toggle = _lazygit_toggle,
    _floatingterm_toggle = _floatingterm_toggle,
    _horizontalterm_toggle = _horizontalterm_toggle,
}

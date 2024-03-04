-- Example remaps
-- vim.keymap.set({'n', 'v'}, 'j', 'h')
-- vim.keymap.set({'n', 'v'}, 'k', 'j')
-- vim.keymap.set({'n', 'v'}, 'l', 'k')
-- vim.keymap.set({'n', 'v'}, ';', 'l')

-- <leader> key
vim.g.mapleader = ' '

-- Clear search highlightings
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')

-- leader+c opens config file (Init.lua)
vim.cmd('nmap <leader>c :e ~/dotfiles/.config/nvim/init.lua<cr>')

-- leader+s saves the file
-- vim.cmd('nmap <leader>s<cr> :wa')

-- skip folded regions
vim.cmd('nmap j gj')
vim.cmd('nmap k gk')
 
-- sync system clipboard
-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- search ignore case 
vim.opt.ignorecase = true

 -- disable ignore case if one val is capital
 vim.opt.smartcase = true



-- Macro functions for vim bindings
vscode = require('vscode-neovim')

function restart_neovim()
    local result = vscode.call("vscode-neovim.restart")
    print("Restarting neovim...")
    return result
end

function open_copilot() 
    print("Opening Copilot...")
    local result = vscode.call("workbench.action.chat.openInSidebar")
    local result = vscode.call("workbench.action.focusSideBar")
    return result
end

function open_file_explorer() 
    print("Opening File Explorer...")
    local result = vscode.call("workbench.view.explorer")
    local result = vscode.call("workbench.action.focusSideBar")
    return result
end

function open_current_file_in_explorer() 
    print("Opening File Explorer...")
    local result = vscode.call("workbench.files.action.showActiveFileInExplorer")
    return result
end

function move_to_right_group() 
    print("Moving to right group...")
    local result = vscode.call("workbench.action.splitEditorToRightGroup")
    return result
end

vim.api.nvim_set_keymap('n', '<leader>b', ':lua restart_neovim()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>u', ':lua open_copilot()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>e', ':lua open_file_explorer()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':lua open_current_file_in_explorer()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>mr', ':lua move_to_right_group()<cr>', {noremap = true, silent = true})
vim.print("hi")

-- Last call print. It seems like it eats the last print line
vim.print("")

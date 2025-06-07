vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Search current selection
local function v_set_search(cmdtype)
	vim.fn.setreg("s", vim.fn.getreg("s"))
	vim.cmd('normal! gv"sy')
	local search = vim.fn.escape(vim.fn.getreg("s"), cmdtype .. "\\")
	search = string.gsub(search, "\n", "\\n")
	vim.fn.setreg("/", "\\V" .. search)
	vim.fn.setreg("s", vim.fn.getreg("s"))
end

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Copiar al portapapeles del sistema
keymap.set("n", "<M-c>", '"+y', { desc = "Yank to system clipboard" })
keymap.set("v", "<M-c>", '"+y', { desc = "Yank to system clipboard" })

-- -- Pegar desde el portapapeles del sistema
keymap.set("n", "<M-v>", '"+p', { desc = "Paste from system clipboard" })
keymap.set("v", "<M-v>", '"+p', { desc = "Paste from system clipboard" })

-- Move lines up & down
keymap.set("n", "<C-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
keymap.set("n", "<C-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move line down" })
keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "Move line up" })

-- Remove search highlight on Esc
keymap.set("n", "<Esc>", ":noh<Return><Esc>", { silent = true, desc = "Clear search highlight" })
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

keymap.set("x", "*", function()
	v_set_search("/")
	vim.cmd("normal! /<C-R>=@/<CR><CR>")
end, { desc = "Search selection forward" })
keymap.set("x", "#", function()
	v_set_search("?")
	vim.cmd("normal! ?<C-R>=@/<CR><CR>")
end, { desc = "Search selection backward" })

-- Maintain Visual Mode after shifting > and <
keymap.set("v", "<", "<gv", { desc = "Shift left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Shift right and reselect" })

-- Replace word under cursor, globally, with confirmation
keymap.set("n", "<Leader>k", ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", { desc = "Replace word under cursor" })
keymap.set("v", "<Leader>k", 'y :%s/<C-r>"//gc<Left><Left><Left>', { desc = "Replace selected text" })

-- Copiar rutas de archivo al portapapeles del sistema
keymap.set("n", "<leader>cp", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	print("Ruta completa copiada: " .. vim.fn.expand("%:p"))
end, { desc = "Copy full file path to clipboard" })

keymap.set("n", "<leader>cr", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Ruta relativa copiada: " .. vim.fn.expand("%"))
end, { desc = "Copy relative file path to clipboard" })

keymap.set("n", "<leader>cf", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
	print("Nombre de archivo copiado: " .. vim.fn.expand("%:t"))
end, { desc = "Copy filename to clipboard" })

keymap.set("n", "<leader>cd", function()
	vim.fn.setreg("+", vim.fn.expand("%:h"))
	print("Directorio copiado: " .. vim.fn.expand("%:h"))
end, { desc = "Copy file directory to clipboard" })

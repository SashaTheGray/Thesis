-- https://github.com/ellisonleao/glow.nvim
local fetched, glow = pcall(require, "glow")
if not fetched then
	print("[-] Could not fetch Glow -> " .. glow)
end

return glow.setup({
	pager = true,
	width = 150,
})

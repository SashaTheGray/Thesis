-- https://github.com/ellisonleao/glow.nvim
local fetched, glow = pcall(require, "glow")
if not fetched then
	print("[-] Could not fetch Glow -> " .. glow)
end

--[[ return glow.setup({ ]]
--[[ 	glow_path = "", ]]
--[[ 	glow_install_path = "~/.local/bin", ]]
--[[ 	border = "shadow", ]]
--[[ 	style = "dark", ]]
--[[ 	pager = false, ]]
--[[ 	width = 80, ]]
--[[ }) ]]

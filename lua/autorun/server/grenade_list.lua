grenade_list = {}

local default_grenade_list = {
	"ttt_confgrenade_proj",
	"ttt_firegrenade_proj",
	"ttt_smokegrenade_proj"
}

local file_name = "grenade_list.txt"

function GetGrenadeList()
	local readInput = file.Open(file_name, "r", "DATA")
	if readInput then
		while not readInput:EndOfFile() do
			local line = readInput:ReadLine()
			table.insert(grenade_list, line:TrimRight("\n"))
		end
		readInput:Close()
	else
		local writeFile = file.Open(file_name, "w", "DATA")
		writeFile:Write("ttt_confgrenade_proj\nttt_firegrenade_proj\nttt_smokegrenade_proj")
		writeFile:Close()
		grenade_list = default_grenade_list
	end
end

hook.Add("Initialize", "ttt_get_grenade_list", GetGrenadeList)
-- a file specifically to load all other lua files in the mod (and for config stuff)

local files = {
    "items/joker",
    "lib/smods.",
    "lib/config",
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end
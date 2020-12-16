local addonName, addon = ...

local L = setmetatable({}, {
	__index = function(self, key)
		if key then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addon.L = L

local locale = GetLocale()

if locale == "deDE" then
--Translation missing
elseif locale == "enUS" then
	L["Covenant Armour Set"] = true
	L["Covenant Armour Sets."] = true
	L["Kyrian Set"] = true
	L["Display Keyrian Set"] = true
	L["Necrolord Set"] = true
	L["Display Necrolord Set"] = true
	L["Night Fae Set"] = true
	L["Display Night Fae Set"] = true
	L["Venthyr Set"] = true
	L["Display Venthyr Set"] = true
elseif locale == "esES" then
--Translation missing
elseif locale == "esMX" then
--Translation missing
elseif locale == "frFR" then
--Translation missing
elseif locale == "itIT" then
--Translation missing
elseif locale == "koKR" then
--Translation missing
elseif locale == "ptBR" then
--Translation missing
elseif locale == "ruRU" then
--Translation missing
elseif locale == "zhCN" then
--Translation missing
elseif locale == "zhTW" then
--Translation missing
end

-- values by their key
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end

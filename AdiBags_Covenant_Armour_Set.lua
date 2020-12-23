--[[
Title: AdiBags - Covenant Armour Set
Version: v1.0.0
Author LownIgnitus - Mihkael-Alexstrasza
Adds Covenant Armour Sets to AdiBags filter groups
]]


local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local L = addon.L
local MatchIDs
local Tooltip
local Result = {}

local function AddToSet(Set, List)
	for _, v in ipairs(List) do
		Set[v] = true
	end
end

local kyrian = {
                178153, -- Selfless Watcher's Helm - Cloth
                178154, -- Selfless Watcher's Chestplate
                178155, -- Selfless Watcher's Warboots
                178156, -- Selfless Watcher's Gauntlets
                178157, -- Selfless Watcher's Legguards
                178158, -- Selfless Watcher's Shoulders
                178159, -- Selfless Watcher's Girdle
                178160, -- Selfless Watcher's Wristwraps
                178161, -- Selfless Watcher's Cloak
                177050, -- Selfless Bearer's Head - Leather
                177051, -- Selfless Bearer's Chest
                177052, -- Selfless Bearer's Feet
                177053, -- Selfless Bearer's Hands
                177054, -- Selfless Bearer's Legs
                177055, -- Selfless Bearer's Shoulders
                177056, -- Selfless Bearer's Waist
                177057, -- Selfless Bearer's Wrists
                177058, -- Selfless Bearer's Cloak
                179940, -- Selfless Forgelite's Vest - Mail
                179941, -- Selfless Forgelite's Boots
                179942, -- Selfless Forgelite's Gloves
                179943, -- Selfless Forgelite's Helm
                179944, -- Selfless Forgelite's Breeches
                179945, -- Selfless Forgelite's Spaulders
                179946, -- Selfless Forgelite's Belt
                179947, -- Selfless Forgelite's Wristwraps
                179948, -- Selfless Forgelite's Drape
                174289, -- Selfless Collector's Greathelm - Plate
                174290, -- Selfless Collector's Chestplate
                174291, -- Selfless Collector's Warboots
                174292, -- Selfless Collector's Gauntlets
                174293, -- Selfless Collector's Legguards
                174294, -- Selfless Collector's Spaulders
                174295, -- Selfless Collector's Girdle
                174296, -- Selfless Collector's Wristguards
                174297 -- Selfless Collector's Greatcloak
}

local necrolord = {
                182268, -- Bladesworn Conjurer's Cowl - Cloth
                182269, -- Bladesworn Conjurer's Tunic
                182270, -- Bladesworn Conjurer's Slippers
                182271, -- Bladesworn Conjurer's Gloves
                182272, -- Bladesworn Conjurer's Leggings
                182273, -- Bladesworn Conjurer's Mantle
                182274, -- Bladesworn Conjurer's Cinch
                182275, -- Bladesworn Conjurer's Wristwraps
                182276, -- Bladesworn Conjurer's Cape
                182259, -- Bladesworn Wraith's Visage - Leather
                182260, -- Bladesworn Wraith's Jerkin
                182261, -- Bladesworn Wraith's Boots
                182262, -- Bladesworn Wraith's Stranglers
                182263, -- Bladesworn Wraith's Breeches
                182264, -- Bladesworn Wraith's Shoulders
                182265, -- Bladesworn Wraith's Belt
                182266, -- Bladesworn Wraith's Armguards
                182267, -- Bladesworn Wraith's Cloak
                182277, -- Bladesworn Tactician's Faceguard - Mail
                182278, -- Bladesworn Tactician's Hauberk
                182279, -- Bladesworn Tactician's Sabatons
                182280, -- Bladesworn Tactician's Gauntlets
                182281, -- Bladesworn Tactician's Chausses
                182282, -- Bladesworn Tactician's Spaulders
                182283, -- Bladesworn Tactician's Girdle
                182284, -- Bladesworn Tactician's Bracers
                182285, -- Bladesworn Tactician's Drape
                182250, -- Bladesworn Harbinger's Greathelm - Plate
                182251, -- Bladesworn Harbinger's Chestguard
                182252, -- Bladesworn Harbinger's Stompers
                182253, -- Bladesworn Harbinger's Crushers
                182254, -- Bladesworn Harbinger's Greaves
                182255, -- Bladesworn Harbinger's Pauldrons
                182256, -- Bladesworn Harbinger's Warbelt
                182257, -- Bladesworn Harbinger's Vambracers
                182258 -- Bladesworn Harbinger's Greatcloak
}

local nightFae = {
                175576, -- Faewoven Raiment - Cloth
                175581, -- Faewoven Sandals
                175586, -- Faewoven Handwraps
                175588, -- Faewoven Cowl
                175592, -- Faewoven Leggings
                175597, -- Faewoven Amice
                175600, -- Faewoven Sash
                175603, -- Faewoven Cuffs
                179623, -- Faewoven Drape
                179657, -- Faewoven Tunic
                179765, -- Oakheart Tunic - Leather
                179766, -- Oakheart Anklewraps
                179767, -- Oakheart Armguards
                176768, -- Oakheart Crest
                176769, -- Oakheart Britches
                176770, -- Oakheart Mantle
                176771, -- Oakheart Belt
                179772, -- Oakheart Bracers
                179773, -- Oakheart Cape
                179774, -- Oakheart Vestment
                181877, -- Runewarden's Greatcloak - Mail
                181909, -- Runewarden's Hauberk
                181910, -- Runewarden's Boots
                181911, -- Runewarden's Gloves
                181912, -- Runewarden's Guise
                181913, -- Runewarden's Legguards
                181914, -- Runewarden's Spaulders
                181915, -- Runewarden's Buckle
                181916, -- Runewarden's Armguards
                181979, -- Runewarden's Vestment
                179620, -- Queensguard Cloak - Plate
                179887, -- Queensguard Greathelm
                179888, -- Queensguard Chestplate
                179889, -- Queensguard Sabatons
                179890, -- Queensguard Gauntlets
                179891, -- Queensguard Greaves
                179892, -- Queensguard Pauldrons
                179893, -- Queensguard Girdle
                179894 -- Queensguard Vambraces
}

local venthyr = {
                180901, -- Soulbreaker's Ebony Vestments - Cloth
                180906, -- Soulbreaker's Ebony Slippers
                180911, -- Soulbreaker's Ebony Handwraps
                180913, -- Soulbreaker's Ebony Hood
                180917, -- Soulbreaker's Ebony Leggings
                180922, -- Soulbreaker's Ebony Mantle
                180925, -- Soulbreaker's Ebony Sash
                180928, -- Soulbreaker's Ebony Wraps
                180934, -- Soulbreaker's Ebony Drape
                180904, -- Ebony Death Shroud Vest - Leather
                180908, -- Ebony Death Shroud Boots
                180909, -- Ebony Death Shroud Bloves
                180915, -- Ebony Death Shroud Hood
                180919, -- Ebony Death Shroud Breeches
                180920, -- Ebony Death Shroud Spaulders
                180927, -- Ebony Death Shroud Belt
                180931, -- Ebony Death Shroud Bindings
                180936, -- Ebony Death Shroud Cloak
                180903, -- Fearstalker's Ebony Hauberk - Mail
                180907, -- Fearstalker's Ebony Sabatons
                180912, -- Fearstalker's Ebony Gauntlets
                180914, -- Fearstalker's Ebony Helm
                180918, -- Fearstalker's Ebony Leggings
                180923, -- Fearstalker's Ebony Monnion
                180926, -- Fearstalker's Ebony Beelt
                180930, -- Fearstalker's Ebony Bracers
                180937, -- Fearstalker's Ebony Cloak
                180900, -- Dread Sentinel's Ebony Headgear - Plate
                180902, -- Dread Sentinel's Ebony Chestplate
                180905, -- Dread Sentinel's Ebony Greatboots
                180910, -- Dread Sentinel's Ebony Grips
                180916, -- Dread Sentinel's Ebony Legguards
                180921, -- Dread Sentinel's Ebony Spaulders
                180924, -- Dread Sentinel's Ebony Girdle
                180929, -- Dread Sentinel's Ebony Vambraces
                180938 -- Dread Sentinel's Ebony Cloak
}

local function MatchIDs_Init(self)
	wipe(Result)

	if self.db.profile.moveKyrian then
		AddToSet(Result, kyrian)
	end

	if self.db.profile.moveNecrolords then
		AddToSet(Result, necrolord)
	end

	if self.db.profile.moveNightFae then
		AddToSet(Result, nightFae)
	end

	if self.db.profile.moveVenthyr then
		AddToSet(Result, venthyr)
	end

	return Result
 end

local function Tooltip_Init()
	local tip, leftside = CreateFrame("GameTooltip"), {}
	for i = 1, 6 do
		local Left, Right = tip:CreateFontString(), tip:CreateFontString()
		Left:SetFontObject(GameFontNormal)
		Right:SetFontObject(GameFontNormal)
		tip:AddFontStrings(Left, Right)
		leftside[i] = Left
	end
	tip.leftside = leftside
	return tip
end

local setFilter = AdiBags:RegisterFilter("Covenant Armour Set", 98, "ABEvent-1.0")
setFilter.uiName = L["Covenant Armour Set"]
setFilter.uiDesc = L["Covenant Armour Sets."]

function setFilter:OnInitialize()
	self.db = AdiBags.db:RegisterNamespace("Covenant Armour Set", {
		profile = {
			moveKyrian = true,
			moveNecrolords = true,
			moveNightFae = true,
			moveVenthyr = true,
		}
	})
end

function setFilter:Update()
	MatchIDs = nil
	self:SendMessage("AdiBags_FiltersChanged")
end

function setFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function setFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function setFilter:Filter(slotData)
	MatchIDs = MatchIDs or MatchIDs_Init(self)
	if MatchIDs[slotData.itemId] then
		return L["Covenant Armour Set"]
	end

	Tooltip = Tooltip or Tooltip_Init()
	Tooltip:SetOwner(UIParent,"ANCHOR_NONE")
	Tooltip:ClearLines()

	if slotData.bag == BANK_CONTAINER then
		Tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
	else
		Tooltip:SetBagItem(slotData.bag, slotData.slot)
	end

	Tooltip:Hide()
end

function setFilter:GetOptions()
	return {
		moveKyrian = {
			name = L["Kyrian Set"],
			desc = L["Display Keyrian Set"],
			type = "toggle",
			order = 10
		},
		moveNecrolords  = {
			name = L["Necrolord Set"],
			desc = L["Display Necrolord Set"],
			type = "toggle",
			order = 20
		},
		moveNightFae = {
			name = L["Night Fae Set"],
			desc = L["Display Night Fae Set"],
			type = "toggle",
			order = 30
		},
		moveVenthyr = {
			name = L["Venthyr Set"],
			desc = L["Display Venthyr Set"],
			type = "toggle",
			order = 40
		},
	},
	AdiBags:GetOptionHandler(self, false, function()
		return self:Update()
	end)
end

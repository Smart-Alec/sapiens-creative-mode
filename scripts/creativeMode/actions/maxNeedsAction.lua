--- CreativeMode: maxNeedsAction.lua
--- @author SirLich, death-rae

local maxNeedsAction = {
	iconModelName = 'icon_happy'
}

-- Sapiens 
local gameObject = mjrequire "common/gameObject"
local logger = mjrequire "hammerstone/logging"
local logicInterface = mjrequire "mainThread/logicInterface"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec2 = mjm.vec2

function maxNeedsAction:getName(baseObjectInfo, multiSelectAllObjects, lookAtPos, isTerrain)
	local name = baseObjectInfo.sharedState.name

	if #multiSelectAllObjects > 1 then
		name = 'your Sapiens'
	end

	return "Make " .. name .. " happy."
end

function maxNeedsAction:visibilityFilter(baseObjectInfo, multiSelectAllObjects, lookAtPos, isTerrain)
	return not isTerrain and gameObject.types[baseObjectInfo.objectTypeIndex].key == 'sapien'
end

function maxNeedsAction:onClick(baseObjectInfo, multiSelectAllObjects, lookAtPos, isTerrain)
	logicInterface:callServerFunction("setMaxNeeds", multiSelectAllObjects)
end


return maxNeedsAction
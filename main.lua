--[[Init--]]
local moneyBags = RegisterMod("Moneybag", 1)
local game = Game()
StartDebug()
Isaac.DebugString("[Moneybag] Loaded!")

--[[Items--]]
local moneybag_trinket = Isaac.GetTrinketIdByName( "Moneybag" )

local bagCoins = 0

--[[Update--]]
function moneyBags:placeMoneyIntoBag( )
    local player = Isaac.GetPlayer(0)
	if player:HasTrinket(moneybag_trinket) and player:GetNumCoins() == 99 and bagCoins < 50 then
		bagCoins = bagCoins + 1
		if bagCoins > 50 then
			bagCoins = 50
		end
		Isaac.DebugString("Placed coin in bag")
		Isaac.DebugString(bagCoins .. " coins in bag")

	end

end

--[[New Run--]]
function moneyBags:newRun( )
  local player = Isaac.GetPlayer(0)
  Isaac.DebugString("[moneyBags] New Run Detected!")
end

--[[Callbacks--]]
moneyBags:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, moneyBags.newRun)
moneyBags:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, moneyBags.placeMoneyIntoBag);

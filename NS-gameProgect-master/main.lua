-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics = require("physics")
physics.start( )
physics.setGravity( 0, 0 )

local sizeBlock = 16

local function newBlock( param )
	local rect = display.newRect( param.x, param.y, sizeBlock - 1,sizeBlock - 1)
	rect:setFillColor( 0.2, 0.2, 0.2 )
	rect.strokeWidth = 3
end

local playerCharacter = display.newRect( display.pixelHeight / 2, display.pixelWidth / 2, sizeBlock, sizeBlock)
playerCharacter:setFillColor( 0.3, 0.7, 0.4 )
physics.addBody( playerCharacter, "dynamic")


local function movingPlayerCharacter( event )
	
	speed = 30
	if (event.keyName == "w" and event.phase == "down")then
		playerCharacter:setLinearVelocity( 0,-speed)
	end
	if (event.keyName == "a" and event.phase == "down")then
		playerCharacter:setLinearVelocity( -speed,0)
	end
	if (event.keyName == "s" and event.phase == "down")then
		playerCharacter:setLinearVelocity( 0,speed)
	end
	if (event.keyName == "d" and event.phase == "down")then
		playerCharacter:setLinearVelocity( speed,0)
	end

	local function playerRotationOnMouse(event)
		local message = "Mouse Position = (" .. tostring(event.x) .. "," .. tostring(event.y) .. ")"
		local angle = math.atan2(playerCharacter.y-event.y, playerCharacter.x-event.x)
		playerRotation = angle * 180 / math.pi
    	playerCharacter.rotation = playerRotation
    	--print( angle )
    	--print( message )
    	--print( playerRotation )
	end
	Runtime:addEventListener( "mouse", playerRotationOnMouse )
end
Runtime:addEventListener( "key", movingPlayerCharacter )
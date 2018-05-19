-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require("physics")
physics.start( )



local person = display.newRect( display.pixelHeight / 2, display.pixelWidth-170, 60, 100 )
physics.addBody(person, {bounce=0.001})
person.isFixedRotation = true

local function moving( event )

	local speed = 340
	local vx, vy = person:getLinearVelocity()
	--run
	if ( event.keyName ==  "d" and event.phase == "down" ) then
		person:setLinearVelocity( vx+speed,vy)
	end
	if ( event.keyName ==  "d" and event.phase == "up" ) then
			person:setLinearVelocity(vx-speed,vy)
	end
	if ( event.keyName ==  "a" and event.phase == "down" ) then
		person:setLinearVelocity(vx-speed,vy)
	end
	if ( event.keyName ==  "a" and event.phase == "up" ) then
			person:setLinearVelocity(vx+speed,vy)
	end

	--jump
	if ( event.keyName ==  "w" and event.phase == "up" ) then
		--person:setLinearVelocity( vx, 300000 )
		person:applyLinearImpulse( 0, 600, person.x, person.y )
	end
end
Runtime:addEventListener( "key", moving )

	--BLOCK
local sizeBlock = 50

local function newBlock( param )
	local rect = display.newRect( param.x, param.y, sizeBlock - 1,sizeBlock - 1)
	physics.addBody( rect, "static", {density=0, friction=0, bounce=0})
	rect:setFillColor( 0.2, 0.2, 0.2 )
	rect.strokeWidth = 3
end

local spaceShip = {
	{0,0}, {1,0}, {2,0}, {3,0}, {4,0}, {5,0}, {6,1}, {7,2}, {7,3}, {8,4}, {7,5}, {6,6}, {5,6}, {4,6}, {3,6}, {3,5}, {3,4}, {2,6}, {1,6}, {0,6}, {-1,6}, {-2,6}, {-3,6}, {-4,6}, {-5,6}, {-6,6}, {-7,6}, {-8,6}, {-8,5}, {-8,4}, {-8,3}, {-8,2}, {-8,1}, {-7,0}, {-6,0}, {-5,0}, {-4,0}, {-3,0}, {-2,0}, {-1,0}
}

local function spawnSpaceShip( param )
	local ship = spaceShip[1]
	for i = 1, #spaceShip do
		local s = spaceShip[i]
		newBlock {x = (param.x + s[1] * sizeBlock),y = param.y + -s[2] * sizeBlock}
	end
end

spawnSpaceShip{x = display.pixelHeight / 2, y =  1000}
--CircleRoom.lua

CircleRoom = Object:extend()

function CircleRoom:new()
	self.area = Area()
	self.timer = Timer()
	self.timer:every(1, function()
        self.area:addGameObject('Circle', random(0, 800), random(0, 600))
    end)
end

function CircleRoom:update(dt)
	 self.area:update(dt)
	  self.timer:update(dt)
end

function CircleRoom:draw()
 	self.area:draw()
end
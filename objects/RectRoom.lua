--RectRoom.lua

RectRoom = Object:extend()

function RectRoom:new()
	self.area = Area()
	self.timer = Timer()
	 for i = 1, 10 do
        self.area:addGameObject('Rectangle', random(0, 800), random(0, 600))
    end
    
end

function RectRoom:update(dt)
		 self.area:update(dt)
	  self.timer:update(dt)

	if input:pressed('removeRectangle') then
        table.remove(self.area.game_objects, love.math.random(1, #self.area.game_objects))
    if #self.area.game_objects == 0 then
            for i = 1, 10 do
                self.area:addGameObject('Rectangle', random(0, 800), random(0, 600))
            end
        end
    end
end

function RectRoom:draw()
	self.area:draw()
 
end
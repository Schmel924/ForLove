--CircleRoom.lua

CircleRoom = Object:extend()

function CircleRoom:new()
	self.area = Area(self)
    self.main_canvas = love.graphics.newCanvas(gw, gh)
	self.timer = Timer()
end

function CircleRoom:update(dt)
	 self.area:update(dt)
	  self.timer:update(dt)
end

function CircleRoom:draw()
 	love.graphics.setCanvas(self.main_canvas)
    love.graphics.clear()
    love.graphics.circle('line', gw/2, gh/2, 50)
    self.area:draw()
    love.graphics.setCanvas()
	
	love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.main_canvas, 0, 0, 0, sx, sy)
    love.graphics.setBlendMode('alpha')

end
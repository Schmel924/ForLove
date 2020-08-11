--CircleRoom.lua

CircleRoom = Object:extend()

function CircleRoom:new()

end

function CircleRoom:update(dt)

end

function CircleRoom:draw()
 love.graphics.circle('line', 150, 150, 50)
end
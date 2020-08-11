--RectRoom.lua

RectRoom = Object:extend()

function RectRoom:new()

end

function RectRoom:update(dt)

end

function RectRoom:draw()
 love.graphics.rectangle('line', 150, 150, 50, 50)
end
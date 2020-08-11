Circle = Object:extend()

function Circle:new(x,y,radius)
  self.x = x or 50
  self.y = y or 50
  self.r = radius or 10
  self.creation_time = love.timer.getTime()
end
function Circle:update(dt)
end

function Circle:draw()
  love.graphics.circle( 'fill', self.x, self.y, self.r)
end


require ('./utils')

function love.load()
	local object_files = {}
    recursiveEnumerate('objects', object_files)
	requireFiles(object_files)

	love.graphics.setColor(0, 0.5, 0.5, 0.4)
	current_room = nil
	gotoRoom('CircleRoom')
end

function love.update(dt)
    if current_room then current_room:update(dt) end
    
end

function love.draw()
	if current_room then current_room:draw() end
end

function gotoRoom(room_type, ...)
    current_room = _G[room_type](...)

end
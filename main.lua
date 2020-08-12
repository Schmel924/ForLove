require ('./utils')

function love.load()
	input = Input()
	input:bind('d', 'removeRectangle')
	local object_files = {}
    recursiveEnumerate('objects', object_files)
	requireFiles(object_files)

	love.graphics.setColor(0, 0.5, 0.5, 0.4)
	current_room = nil
	gotoRoom('RectRoom')
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
io.stdout:setvbuf("no") -- for live console output
Object = require("libs/classic")


-- Libs and Objs requirement
function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        if love.filesystem.isFile(file) then
        	if file:sub(-3) == "lua" then
        	    table.insert(file_list, file)
        	end
            
        elseif love.filesystem.isDirectory(file) then
            recursiveEnumerate(file, file_list)
        end
    end
end
function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

function love.load()
	-- Libs and Objs requirement
	local object_files = {}
    recursiveEnumerate('objects', object_files)
	requireFiles(object_files)
	local lib_files = {}
    recursiveEnumerate('libs', lib_files)
	requireFiles(lib_files)

	current_room = nil
	newC = Circle (150,150,10)
end

function love.update(dt)
    if current_room then current_room:update(dt) end
end

function love.draw()
	if current_room then current_room:draw() end
	newC:draw()
end

function gotoRoom(room_type, ...)
    current_room = _G[room_type](...)

end
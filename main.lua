io.stdout:setvbuf("no") -- for live console output
Object = require("libs/classic")
Input = require ('libs/input')
Timer = require ('libs/hump-master/timer')
require ('./utils')



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
        print (file)
        require(file)
    end
end

function love.load()
	-- Libs and Objs requirement
 --[[   local lib_files = {}
    recursiveEnumerate('libs', lib_files)
    requireFiles(lib_files)]]
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
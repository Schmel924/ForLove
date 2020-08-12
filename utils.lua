io.stdout:setvbuf("no") -- for live console output
Object = require("libs/classic")
Input = require ('libs/input')
Timer = require ('libs/hump-master/timer')

function UUID()
    local fn = function(x)
        local r = love.math.random(16) - 1
        r = (x == "x") and (r + 1) or (r % 4) + 9
        return ("0123456789abcdef"):sub(r, r)
    end
    return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end

 
function random(min, max)
    return love.math.random()*(max - min) + min
end

function love.filesystem.isFile (f)
	i=love.filesystem.getInfo(f)
	if i.type == 'file' then return true else return false end
end

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
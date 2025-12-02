local pixalArt = "https://raw.githubusercontent.com/OogyBoogy124/pixalArtLab12/refs/heads/main/"
local addr = pixalArt .. "printArt.txt"

local colorBlocks = { [0] = 1, [1] = 2, [2] = 3 }

local function placeBlocks(pixel)
    local color = tonumber(pixel)
    if color and colorBlocks[color] then
        turtle.select(colorBlocks[color])
        turtle.placeDown()
        turtle.forwad()
    end
end

local function drawRowForward(row)
    for i = 1, #row do
        placePixel(row:sub(i, i))
    end
end

local function drawRowBackward(row)
    for i = #row, 1, -1 do
        placePixel(row:sub(i, i))
    end
end

local function printFinish(turns)
    while true do
        local strip = turns.readLine()
        if not strip or strip == "" then
            print("Finished image")
            break
        end
        drawRowForward(strip)
        turtle.turnRight()
		turtle.forward()
		turtle.turnRight()
		turtle.forward()
        strip = turns.readLine()
        if not strip or strip == "" then
            print("Finished image")
            break
        end
        drawRowBackward(strip)
        turtle.turnLeft()
		turtle.forward()
		turtle.turnLeft()
		turtle.forward()
    end
end

local req = http.get(addr)
printFinish(req)
req.close()
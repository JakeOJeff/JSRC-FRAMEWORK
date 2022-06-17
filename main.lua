
require("button") -- Requires button.lua Library

function love.load() -- load function
money = 0
button:new("Click me", function() money = money + 1 print(money) end, 10, 10, 5, 5, {255,255,255}, myFont, 50,150,50, 75,175,75, 100,200,100) -- Properties
end

function love.update(dt) -- update function
update_buttons()

end

function love.draw() -- draw function
draw_buttons()
end

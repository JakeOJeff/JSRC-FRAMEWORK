local class = require("middleclass")
loading = class("load")
local load = {}
lg = love.graphics
local originalFont = lg.getFont()


function loading:initialize(bar,barColor, maxBar, maxBarColor, height, x, y,levelTF, levelX, levelY, starterLevel, maxLevels, mouse )
    self.bar = bar or 0
    self.maxBar = maxBar or 150
    self.barColor = barColor or {0,1,0}
    self.maxBarColor = maxBarColor or {0.8,0.8,0.8}
    self.height = height or 50
    self.x = x or 300
    self.y = y or 350
    self.level = starterLevel or 0
    self.mouse = mouse or 1
    self.maxLevels = maxLevels or 10
    self.speedBar = self.maxLevels * 10
    self.levelTF = levelTF or true
    self.levelX = levelX or 300
    self.levelY = levelY or 300

       table.insert(load, self)
       return self
   end


function loading:update()
        if love.mouse.isDown(self.mouse) then
            if self.bar >= self.maxBar then
              self.bar = 0
              self.level   = self.level + 1
              self.speedBar = self.speedBar - 10
            else
                self.bar = math.min(self.maxBar, self.bar + self.speedBar)
            end
        end
end
function loading:draw()
    if self.levelTF == true then
    lg.print(self.level, self.levelX, self.levelY)
    else
        return
    end
    lg.setColor(self.maxBarColor)
    lg.rectangle("fill",self.x,self.y, self.maxBar, self.height)
    lg.setColor(self.barColor)
    lg.rectangle("fill",self.x,self.y, self.bar, self.height)

end 

function loading:reset()
    if self.level > 0 then
      self.level = self.level - 1
    else
        return
    end
end

function update_loading()
	for i, v in pairs(load) do
		v:update()
	end
end
function reset_loading()
	for i, v in pairs(load) do
		v:reset()
	end
end
function draw_loading()
	for i, v in pairs(load) do
		v:draw()
	end 
end


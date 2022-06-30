local class = require("middleclass")
button = class("button")
local buttons = {}
local originalFont = love.graphics.getFont()
sampleCodeVal = 0

function button:initialize(text, code, widthS, heightS, rx, ry, textColor, font, color, hover, click)

	self.code = code or (function() sampleCode = "hello" 
	sampleCodeVal = sampleCodeVal + 1
end)
	self.text = text or "Button"
	self.width = widthS or 19
	self.height = heightS or 25
	self.rx = rx or 0
	self.ry = ry or 0
	self.textColor = textColor or {255,255,255}
	self.font = font or love.graphics.getFont()
	self.color = color or {0.5,0.5,0.5}
	self.hover = hover or {0.4,0.4,0.4}
	self.click = click or {0.7,0.7,0.7}
	self.Fcolor = {self.color[1],self.color[2],self.color[3]}
	table.insert(buttons, self)
	return self


end

function button:update()
	local x, y = love.mouse.getPosition()
	if x < self.width + self.font:getWidth(self.text) + 20 and x > self.width and y < self.height + self.font:getHeight(self.text) + 20 and y > self.height then 
		
		if not love.mouse.isDown(1) then
			self.Fcolor = {self.hover[1],self.hover[2],self.hover[3]}
	    else
			self.code()
			self.Fcolor = {self.click[1],self.click[2],self.click[3]}
			love.timer.sleep(.1)
		end
	else
		self.Fcolor = {self.color[1],self.color[2],self.color[3]}
	end 
end

function button:draw()
	love.graphics.setFont(self.font)

	love.graphics.setColor(self.Fcolor)
	love.graphics.rectangle("fill", self.width, self.height, self.font:getWidth(self.text) + 20, self.font:getHeight(self.text) + 20, self.rx, self.ry)

	love.graphics.setColor(self.textColor)
	love.graphics.print(self.text, self.width + 10, self.height + 10)
	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(originalFont)
    if sampleCode then
	love.graphics.print(sampleCode.." x"..math.floor(sampleCodeVal), 10, 75)
	end
end 

function update_buttons()
	for i, v in pairs(buttons) do
		v:update()
	end
end

function draw_buttons()
	for i, v in pairs(buttons) do
		v:draw()
	end 
end

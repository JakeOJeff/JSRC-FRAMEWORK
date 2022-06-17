local class = require("middleclass")
button = class("button")
local buttons = {}
local originalFont = love.graphics.getFont()
sampleCodeVal = 0

function button:initialize(text, code, widthS, heightS, rx, ry, textColor, font, color1,color2,color3, hoverColor1,hoverColor2,hoverColor3, clickColor1,clickColor2,clickColor3)

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
	self.colorR = color1 or 50
	self.colorG = color2 or 50
	self.colorB = color3 or 50
	self.hoverR = hoverColor1 or 45
	self.hoverG = hoverColor2 or 45
	self.hoverB = hoverColor3 or 45
	self.clickR = clickColor1 or 75
	self.clickG = clickColor2 or 75
	self.clickB = clickColor3 or 75
	self.originalColor = {self.colorR,self.colorG,self.colorB} 
	table.insert(buttons, self)
	return self


end

function button:update()
	local x, y = love.mouse.getPosition()
	if x < self.width + self.font:getWidth(self.text) + 20 and x > self.width and y < self.height + self.font:getHeight(self.text) + 20 and y > self.height then 
		
		if not love.mouse.isDown(1) then
			self.color = {(self.hoverR/255),(self.hoverG/255),(self.hoverB/255)}
			
	    elseif love.mouse.isDown(1) then 
			self.code()
			self.color = {(self.clickR/255),(self.clickG/255),(self.clickB/255)}
			love.timer.sleep(.1)
		end
	else
		self.color = {self.colorR/255,self.colorG/255,self.colorB/255}
	end 
end

function button:draw()
	love.graphics.setFont(self.font)

	love.graphics.setColor(self.color)
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
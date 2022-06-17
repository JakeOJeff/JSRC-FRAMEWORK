local class = require("middleclass")
label = class("label")
local labels = {}
local originalFont = love.graphics.getFont()
sampleCodeVal = 0

function label:initialize(text, widthS, heightS, font, color1,color2,color3, hoverColor1,hoverColor2,hoverColor3)


	self.text = text or "Label"
	self.width = widthS or 50
	self.height = heightS or 75
	self.font = font or love.graphics.getFont()
	self.colorR = color1 or 255
	self.colorG = color2 or 255
	self.colorB = color3 or 255
	self.hoverR = hoverColor1 or 45
	self.hoverG = hoverColor2 or 45
	self.hoverB = hoverColor3 or 45
	self.originalColor = {self.colorR,self.colorG,self.colorB} 
	table.insert(labels, self)
	return self


end

function label:update()
	local x, y = love.mouse.getPosition()
	if x < self.width + self.font:getWidth(self.text) + 20 and x > self.width and y < self.height + self.font:getHeight(self.text) + 20 and y > self.height then 
			self.color = {(self.hoverR/255),(self.hoverG/255),(self.hoverB/255)}
	else
		self.color = {self.colorR/255,self.colorG/255,self.colorB/255}
	end 
end

function label:draw()
	love.graphics.setFont(self.font)

	love.graphics.setColor(self.color)
	love.graphics.print(self.text, self.width + 10, self.height + 10)
	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(originalFont)
end 

function update_labels()
	for i, v in pairs(labels) do
		v:update()
	end
end

function draw_labels()
	for i, v in pairs(labels) do
		v:draw()
	end 
end
local class = require("middleclass")
frame = class("frame")
local frames = {}
local originalFont = love.graphics.getFont()

function frame:initialize(text, widthS, heightS, width, height, rx, ry, textColor, font, color1,color2,color3, hoverColor1,hoverColor2,hoverColor3)
 -- Frame Properties
	self.text = text or "Frame"
	self.widthS = widthS or 100
	self.heightS = heightS or 25
    self.width = width or 200
    self.height = height or 130
	self.rx = rx or 0
	self.ry = ry or 0
	self.textColor = textColor or {255,255,255}
	self.font = font or love.graphics.getFont()
	self.colorR = color1 or 255
	self.colorG = color2 or 255
	self.colorB = color3 or 255
	self.hoverR = hoverColor1 or 45
	self.hoverG = hoverColor2 or 45
	self.hoverB = hoverColor3 or 45
	self.originalColor = {self.colorR,self.colorG,self.colorB} 
	table.insert(frames, self)
	return self


end

function frame:update()
	local x, y = love.mouse.getPosition()
	if x < self.widthS + self.width and x > self.widthS and y < self.heightS + self.height and y > self.heightS then 
		self.color = {(self.hoverR/255),(self.hoverG/255),(self.hoverB/255)}
	else
		self.color = {self.colorR/255,self.colorG/255,self.colorB/255}
	end 
	if self.widthS ~= -1 and self.heightS ~= -1 then
        self.widthS = self.widthS
        self.heightS = self.heightS
    end
end

function frame:draw()
	love.graphics.setFont(self.font)

	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", self.widthS, self.heightS, self.width, self.height, self.rx, self.ry)
    
	love.graphics.setColor(self.textColor)
	love.graphics.print(self.text, self.widthS + 10, self.heightS + 10)
	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(originalFont)

end 

function update_frames()
	for i, v in pairs(frames) do
		v:update()
	end
end

function draw_frames()
	for i, v in pairs(frames) do
		v:draw()
	end 
end
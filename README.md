# JSRC-FRAMEWORK
A lua GUI library for Löve games

Creating a New GUI is made simpler!

Create a Heavily customizable button/frames/labels/etc in 3 Lines!

## How to start?
Start of by importing the file that you need, in this example, i will use buttons

```lua
require("button") -- Requires button.lua Library
```

Then, create the button
 
More Info on changing ButtonClick function, Gui Color, Shape, Text Color, Etc can be seen here : [JSRC FRAMEWORK](https://jsrc-framework.glitch.me/)

```lua
button:new() 
```

Next Update the button and Draw the button

```lua

function love.update(dt) -- update function
update_buttons()

end

function love.draw() -- draw function
draw_buttons()
end
```

Thats it on using the Simple UI Library!

You can get Info on different Properties and how to implement them in [JSRC FRAMEWORK](https://jsrc-framework.glitch.me/)

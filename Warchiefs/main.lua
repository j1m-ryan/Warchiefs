-----------------------------------------------------------------------------------------
--
-- main.lua


-----------------------------------------------------------------------------------------

--local widget = require("widgetLibrary.widget")
-- widget library for buttons
local widget = require("widget")

--functions for buttons events

    
-- background image

local background = display.newImage("images/gameposter.png")

    background.x=295
    background.y=625

        --create buttons
--new game button
local btn =widget.newButton{
    width = 500,
    height = 290,
    left = 120,
    top = 650,
    defaultFile = "images/btnnewgame.png",
}
--resume game button
local btn =widget.newButton{
    width = 465,
    height = 270,
    left = 130,
    top = 780,
    defaultFile = "images/btnresumegame.png",
}
--options game button
local btn =widget.newButton{
    width = 400,
    height = 250,
    left = 158,
    top = 910,
    defaultFile = "images/btnoptions.png",
}
--exit button
local btn =widget.newButton{
    width = 400,
    height = 250,
    left = 170,
    top = 1020,
    defaultFile = "images/btnexit.png",
}






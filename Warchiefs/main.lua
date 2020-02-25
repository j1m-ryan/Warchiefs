local composer = require("composer")

-- Seed the random number generator
math.randomseed(os.time())

-- Set game window title to "Warchiefs"
native.setProperty("windowTitleText", "Warchiefs")

--Set game window mode to full screen
native.setProperty("windowMode", "maximized")

-- initalize global variables
_G.name = ""
_G.clan = ""
_G.gender = ""
_G.strength = 5
_G.charisma = 5
_G.agility = 5
_G.dexterity = 5
_G.spirit = 5

_G.town = ""
-- Go to the menu screen
composer.gotoScene("menu")

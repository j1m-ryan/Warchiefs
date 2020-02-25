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
_G.gold = 10000
_G.largeHealthPotions = 0
_G.smallHealthPotions = 0
_G.x = 30
_G.y = 30
-- Go to the menu screen
composer.gotoScene("menu")

local composer = require("composer")

-- Seed the random number generator
math.randomseed(os.time())

-- Set game window title to "Warchiefs"
native.setProperty("windowTitleText", "Warchiefs")

--Set game window mode to full screen
native.setProperty("windowMode", "maximized")

-- Go to the menu screen
composer.gotoScene("menu")

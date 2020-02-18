local composer = require("composer")

-- Hide status bar
--display.setStatusBar(display.HiddenStatusBar)

-- Seed the random number generator
math.randomseed(os.time())
native.setProperty("windowTitleText", "Warchiefs")
native.setProperty("windowMode", "maximized")

-- Go to the menu screen
composer.gotoScene("menu")

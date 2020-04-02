local composer = require("composer")
local player  = ("playerData")

-- Seed the random number generator
math.randomseed(os.time())

-- Set game window title to "Warchiefs"
native.setProperty("windowTitleText", "Warchiefs")

--Set game window mode to full screen
native.setProperty("windowMode", "maximized")

-- Reserve audio channels for music
audio.reserveChannels( 1 )
audio.reserveChannels( 2 )
audio.reserveChannels( 3 )

-- Set volume of music channels
audio.setVolume( 1, { channel=1 } )
audio.setVolume( 1, { channel=2 } )
audio.setVolume( 1, { channel=3 } )
audio.setMinVolume(0)

-- Go to the menu screen
composer.gotoScene("menu")

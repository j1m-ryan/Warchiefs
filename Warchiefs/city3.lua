--copy above

local composer = require("composer")
local player = require("playerData")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
    composer.removeHidden()
    player.location = "city3"
    local sceneGroup = self.view
    local phase = event.phase

    -- Create the widget
    -- Code here runs when the scene is still off screen (but is about to come on screen)
    local background = display.newImageRect("images/city3inside.png", 1280, 720)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local widget = require("widget")

    -- Function to handle button events
    local function goToWorldMap(event)
        if ("ended" == event.phase) then
            composer.gotoScene("worldmap")
        end
    end
    local function goToLvl(event)
        if ("ended" == event.phase) then
            composer.gotoScene("level")
        end
    end
    local function goToMage(event)
        if ("ended" == event.phase) then
            composer.gotoScene("mage")
        end
    end
    local function goToCastle(event)
        if ("ended" == event.phase) then
            composer.gotoScene("combat")
        end
    end
    local exitRyansTown =
        widget.newButton(
        {
            left = 1030,
            top = 500,
            width = 200,
            height = 190,
            id = "exitRyansTown",
            onEvent = goToWorldMap,
            defaultFile = "images/door.png"
        }
    )
    local lvlScreen =
        widget.newButton(
        {
            defaultFile = "images/market.png",
            left = 130,
            top = 350,
            width = 250,
            height = 200,
            id = "lvlScreen",
            onEvent = goToLvl
        }
    )

    local mageBtn =
        widget.newButton(
        {
            width = 100,
            height = 300,
            left = 785,
            top = 30,
            id = "magebtn",
            defaultFile = "images/tower.png",
            onEvent = goToMage
        }
    )
    local castleBtn =
        widget.newButton(
        {
            labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
            left = 925,
            top = 130,
            id = "castleBtn",
            label = "castle",
            fontSize = 40,
            onEvent = goToCastle
        }
    )
    sceneGroup:insert(background)
    sceneGroup:insert(castleBtn)
    sceneGroup:insert(mageBtn)
    sceneGroup:insert(lvlScreen)

    sceneGroup:insert(exitRyansTown)
end

-- show()
function scene:show(event)
end

-- hide()
function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is on screen (but is about to go off screen)
    elseif (phase == "did") then
    -- Code here runs immediately after the scene goes entirely off screen
    end
end

-- destroy()
function scene:destroy(event)
    local sceneGroup = self.view
end
----
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene

--copy above

local composer = require("composer")

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
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
end

-- show()
function scene:show(event)
    _G.town = "ryanstown"
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Create the widget
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local background = display.newImageRect("images/ryanstown.png", 1280, 720)
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
                composer.showOverlay("level")
            end
        end
        local exitRyansTown =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 1070,
                top = 650,
                id = "exitRyansTown",
                label = "EXIT",
                onEvent = goToWorldMap,
                font = "Castellar",
                fontSize = 40
            }
        )
        local lvlScreen =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 920,
                top = 650,
                id = "lvlScreen",
                label = "LVL",
                onEvent = goToLvl,
                font = "Castellar",
                fontSize = 40
            }
        )
    elseif (phase == "did") then
    -- Code here runs when the scene is entirely on screen
    end
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

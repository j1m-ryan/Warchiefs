local composer = require("composer")
local player = require("playerData")
local scene = composer.newScene()
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create(event)
    composer.removeHidden()
    local sceneGroup = self.view
    local phase = event.phase
    local widget = require("widget")
    print(player.gold)
    local background
    if player.location == "ryanstown" then
        background = display.newImageRect("images/combatback.png", 1280, 720)
    elseif player.location == "city2" then
        background = display.newImageRect("images/combatback2.png", 1280, 720)
    else
        background = display.newImageRect("images/combatback3.png", 1280, 720)
    end

    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local function leaveCastle(event)
        if ("ended" == event.phase) then
            composer.gotoScene("worldmap")
        end
    end

    local exit =
        widget.newButton(
        {
            left = 1030,
            top = 500,
            width = 200,
            height = 190,
            id = "exit",
            onEvent = leaveCastle,
            defaultFile = "images/door.png"
        }
    )

    if (phase == "will") then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
    elseif (phase == "did") then

    -- Code here runs when the scene is entirely on screen
    end

    sceneGroup:insert(background)

    sceneGroup:insert(exit)
end

-- show()
function scene:show(event)
    local sceneGroup = self.view
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
    -- Code here runs prior to the removal of scene's view
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene

local composer = require("composer")
local player = require("playerData")
local scene = composer.newScene()
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create(event)
    local sceneGroup = self.view
end

-- show()
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase
    print(player.gold)
    local background = display.newImageRect("images/castleinterior.png", 1280, 720)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    local character = display.newImageRect("images/hero1.png", 300, 300)
    local widget = require("widget")
    local characterDirection = "right"
    character.x = 200
    character.y = 460
    physics.start()
    physics.setGravity(0, 0)
    physics.addBody(character, {radius = 30, isSensor = true})
    function onKeyEvent(event)
        print("x")
        print(character.x)
        print("Y")
        print(character.y)
        if event.keyName == "a" then
            if characterDirection == "right" then
                characterDirection = "left"
                character.xScale = -1
            end
            if event.phase == "down" then
                transition.to(character, {time = 3000, x = character.x - (screenW / 2) - 10})
            elseif event.phase == "up" then
                transition.cancel()
            end
        end
        if event.keyName == "d" then
            if characterDirection == "left" then
                characterDirection = "right"
                character.xScale = 1
            end
            if event.phase == "down" then
                transition.to(character, {time = 3000, x = character.x + (screenW / 2) + 10})
            elseif event.phase == "up" then
                transition.cancel()
            end
        end
    end

    if (phase == "will") then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
    elseif (phase == "did") then
        Runtime:addEventListener("key", onKeyEvent)
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

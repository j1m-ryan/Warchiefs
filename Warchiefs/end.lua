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
    player.gold = player.gold + 5000
    player.level = player.level + 1
    local sceneGroup = self.view
    local background = display.newImageRect("images/end.png", 1280, 720)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    victoryString = player.name .. " " .. player.clan .. " controls all the cities!"
    local victoryText = display.newText(victoryString, 600, 200, native.systemFont, 35)
    local goldString = "You finished the game with " .. player.gold .. " gold!"
    local goldText = display.newText(goldString, 600, 300, native.systemFont, 35)

    local widget = require("widget")
    local function goToWorldMap(event)
        if ("ended" == event.phase) then
            composer.gotoScene("menu")
        end
    end

    victoryText:setFillColor(0, 0, 0)
    goldText:setFillColor(0, 0, 0)

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
    sceneGroup:insert(background)
    sceneGroup:insert(victoryText)
    sceneGroup:insert(exitRyansTown)
    sceneGroup:insert(goldText)

    -- Code here runs when the scene is first created but has not yet appeared on screen
end

-- show()
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
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

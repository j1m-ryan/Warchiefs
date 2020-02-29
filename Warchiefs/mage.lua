local composer = require("composer")
local player = require("playerData")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view
end

-- show()
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase
    local background = display.newImageRect("images/mage.png", 1280, 720)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    local widget = require("widget")
    local function goBack(event)
        if ("ended" == event.phase) then
            composer.hideOverlay("level")
            composer.gotoScene(player.location)
        end
    end
    local backBTN =
        widget.newButton(
        {
            labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
            left = 1070,
            top = 650,
            id = "goBack",
            label = "Back",
            onEvent = goBack,
            font = "Castellar",
            fontSize = 40
        }
    )
    local buyLarge =
        widget.newButton(
        {
            labelColor = {default = {.4, .6, .4}, over = {0, 0, 0, 0.5}},
            left = 370,
            top = 250,
            id = "buyLarge",
            label = "BUY",
            onEvent = buyLargePotion,
            font = "Castellar",
            fontSize = 40
        }
    )
    local buySmall =
        widget.newButton(
        {
            labelColor = {default = {.4, .6, .4}, over = {0, 0, 0, 0.5}},
            left = 370,
            top = 650,
            id = "buySmall",
            label = "BUY",
            onEvent = buySmallPotion,
            font = "Castellar",
            fontSize = 40
        }
    )

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

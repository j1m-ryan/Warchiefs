local composer = require("composer")
local scene = composer.newScene()

-- create()
function scene:create(event)
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local sceneGroup = self.view
end

-- show()
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local widget = require("widget")

        -- Set background image
        local background = display.newImageRect("images/background.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        -- Function to go to the origin scene
        local function goToOrigin(event)
            if ("ended" == event.phase) then
                composer.gotoScene("origin", {effect = "crossFade", time = 500})
            end
        end

        -- Create the Buttons
        local newGame =
            widget.newButton(
            {
                labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
                left = 50,
                top = 400,
                id = "newGame",
                label = "New Game",
                onEvent = goToOrigin,
                font = "Castellar",
                fontSize = 70
            }
        )

        local resume =
            widget.newButton(
            {
                labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
                left = 50,
                top = 500,
                id = "resume",
                label = "Resume Game",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 70
            }
        )

        local options =
            widget.newButton(
            {
                labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
                left = 50,
                top = 600,
                id = "options",
                label = "Options",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 70
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

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

        -- Background music 
        local backgroundMusic = audio.loadStream( "audio/bgmenumusic.mp3" )


        -- Create the Buttons
        local newGame =
            widget.newButton(
            {
                width = 400,
                height = 200,
                left = 450,
                top = 300,
                id = "newGame",
                defaultFile = "images/btnnewgame.png",
                overFile = "images/btn1hover.png",
                onEvent = goToOrigin
            }
        )

        local resume =
            widget.newButton(
            {
                width = 400,
                height = 200,
                left = 450,
                top = 410,
                id = "resume",
                defaultFile = "images/btnresumegame.png",
                overFile = "images/btn4hover.png",
                onEvent = handleButtonEvent,
                font = "Castellar"
            }
        )

        local options =
            widget.newButton(
            {
                labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
                width = 400,
                height = 200,
                left = 450,
                top = 520,
                id = "options",
                defaultFile = "images/btnoptions.png",
                overFile = "images/btn2hover.png",
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

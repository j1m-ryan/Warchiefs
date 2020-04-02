local composer = require("composer")
local scene = composer.newScene()



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

        -- Function to go to the menu scene

        local function goToMenu(event)
            if ("ended" == event.phase) then
                composer.gotoScene("menu", {effect = "crossFade", time = 500})
            end
        end

        local function volumeUp(event)
            if ("ended" == event.phase) then
                audio.setVolume(audio.getVolume() + 0.1)
            end
        end

        local function volumeDown(event)
            if ("ended" == event.phase) then
                audio.setVolume(audio.getVolume() - 0.1)
            end
        end

        -- Create the Buttons
        local volUp =
            widget.newButton(
            {
                width = 250,
                height = 75,
                left = 500,
                top = 380,
                id = "volUp",
                defaultFile = "images/volumeupbutton.png",
                overFile = "images/voluphover.png",
                onEvent = volumeUp
            }
        )

        local volDown =
            widget.newButton(
            {
                width = 250,
                height = 75,
                left = 500,
                top = 490,
                id = "volDown",
                defaultFile = "images/volumedownbutton.png",
                overFile = "images/voldownhover.png",
                onEvent = volumeDown
            }
        )

        local returnMain =
            widget.newButton(
            {
                width = 250,
                height = 75,
                left = 500,
                top = 600,
                id = "returnmain",
                defaultFile = "images/mainbutton.png",
                overFile = "images/returnmainhover.png",
                onEvent = goToMenu

            }
        )


    elseif (phase == "did") then
    -- Code here runs when the scene is entirely on screen

    --play bg music
    audio.play (menuMusic, {channel = 1, loops=-1})


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

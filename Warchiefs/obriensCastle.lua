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
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Create the widget
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local background = display.newImageRect("images/obrienscastle.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        local widget = require("widget")

        -- Function to handle button events
        local function goToWorldMap(event)
            if ("ended" == event.phase) then
                composer.gotoScene("menu")
            end
        end
        local exitOBriensCastle =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 750,
                top = 600,
                id = "exitOBriensCastle",
                label = "EXIT TO",
                onEvent = goToWorldMap,
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

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
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local clanInfo = ""

        local background = display.newImageRect("images/origin.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        local clanText = display.newText(clanInfo, 950, 200, "Castellar", 40)
        clanText:setFillColor(0, 0, 0)
        local widget = require("widget")

        -- Function to handle button events
        local function handleButtonEvent(event)
            if ("ended" == event.phase) then
                print("Button was pressed and released")
            end
        end

        local function ryanText(event)
            if ("ended" == event.phase) then
                clanText.text = "Info about the ryan clan....."
            end
        end

        local function obrienText(event)
            if ("ended" == event.phase) then
                clanText.text = "Info about Obriens"
            end
        end

        -- Create the widget
        local ryan =
            widget.newButton(
            {
                labelColor = {default = {0.3, 0.3, 0.3}, over = {0, 0, 0, 0.5}},
                left = 160,
                top = 165,
                id = "ryan",
                label = "Ryan",
                onEvent = ryanText,
                font = "Castellar",
                fontSize = 70
            }
        )

        local obrien =
            widget.newButton(
            {
                labelColor = {default = {0.3, 0.3, 0.3}, over = {0, 0, 0, 0.5}},
                left = 160,
                top = 265,
                id = "obrien",
                label = "O'Brien",
                onEvent = obrienText,
                font = "Castellar",
                fontSize = 70
            }
        )

        local singh =
            widget.newButton(
            {
                labelColor = {default = {0.3, 0.3, 0.3}, over = {0, 0, 0, 0.5}},
                left = 160,
                top = 375,
                id = "singh",
                label = "Singh",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 70
            }
        )
        local shazad =
            widget.newButton(
            {
                labelColor = {default = {0.3, 0.3, 0.3}, over = {0, 0, 0, 0.5}},
                left = 160,
                top = 475,
                id = "shazad",
                label = "Shazad",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 70
            }
        )
        local oConnellMcGrath =
            widget.newButton(
            {
                labelColor = {default = {0.3, 0.3, 0.3}, over = {0, 0, 0, 0.5}},
                left = 160,
                top = 585,
                id = "oConnellMcGrath",
                label = "O'Connell Mc Grath",
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

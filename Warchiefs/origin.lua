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

        local clanText = display.newText(clanInfo, 940, 260, "Castellar", 30)
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
                clanText.text =
                    "The Ryans are a strong and \nagile people originitating \nfrom the mid-west of the land \nStrength +1\nAgility +1\n"
            end
        end

        local function createCharFunc(event)
            if ("ended" == event.phase) then
                composer.gotoScene("characterCreator", {effect = "crossFade", time = 500})
            end
        end

        local function obrienText(event)
            if ("ended" == event.phase) then
                clanText.text = "Info about O'Brien's"
            end
        end
        local function oConnellMcGrathText(event)
            if ("ended" == event.phase) then
                clanText.text = "Info about O'Connel lMcGraths"
            end
        end
        local function shazadText(event)
            if ("ended" == event.phase) then
                clanText.text = "Info about Shazads"
            end
        end
        local function singhText(event)
            if ("ended" == event.phase) then
                clanText.text = "Info about Singh's"
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
                onEvent = singhText,
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
                onEvent = shazadText,
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
                onEvent = oConnellMcGrathText,
                font = "Castellar",
                fontSize = 70
            }
        )
        local createCharacter =
            widget.newButton(
            {
                labelColor = {default = {0.3, 0.3, 0.3}, over = {0, 0, 0, 0.5}},
                left = 740,
                top = 30,
                id = "createCharacter",
                label = "Create Character",
                onEvent = createCharFunc,
                font = "Castellar",
                fontSize = 45
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

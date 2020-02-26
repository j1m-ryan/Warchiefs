local composer = require("composer")
local scene = composer.newScene()
local player  = require("playerData")

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
        local clanInfo = ""
        local ryan
        local obrien
        local singh
        local shazad
        local oConnellMcGrath

        --clan warning intialized
        local clanWarning
        local clanWarningText = display.newText("", 1010, 95, native.systemFont, 35)
        -- Set Background image
        local background = display.newImageRect("images/origin.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        -- Display information about each clan in a label
        local clanText = display.newText(clanInfo, 940, 260, "Castellar", 30)
        clanText:setFillColor(0, 0, 0)

        --ask player to choose a clan
        function clanWarning()
            if (clanInfo == "") then
                clanWarningText = display.newText("You must pick a clan", 1010, 95, native.systemFont, 35)
                clanWarningText:setFillColor(1, 0, 0)
            end
        end
        -- Update the clan information for the Ryan clan
        local function ryanText(event)
            if ("ended" == event.phase) then
                display.remove(clanWarningText)

                player.clan = "Ryan"
                player.strength = 6
                ryan._view._label:setFillColor(1, 0, 0, 0.5)
                obrien._view._label:setFillColor(0.3, 0.3, 0.3)
                singh._view._label:setFillColor(0.3, 0.3, 0.3)
                shazad._view._label:setFillColor(0.3, 0.3, 0.3)
                oConnellMcGrath._view._label:setFillColor(0.3, 0.3, 0.3)
                clanText.text =
                    "The Ryans are a strong and \nagile people originitating \nfrom the mid-west of the land \nStrength +1\nAgility +1\n"
            end
        end

        -- Update the clan information for the O'Brien clan
        local function obrienText(event)
            player.clan = "O'Brien"
            if ("ended" == event.phase) then
                clanWarningText.text = ""
                player.strength = 6
                ryan._view._label:setFillColor(0.3, 0.3, 0.3)
                obrien._view._label:setFillColor(1, 0, 0, 0.5)
                singh._view._label:setFillColor(0.3, 0.3, 0.3)
                shazad._view._label:setFillColor(0.3, 0.3, 0.3)
                oConnellMcGrath._view._label:setFillColor(0.3, 0.3, 0.3)

                clanText.text = "Info about O'Brien's"
            end
        end

        -- Update the clan information for the Shazad clan
        local function shazadText(event)
            if ("ended" == event.phase) then
                clanWarningText.text = ""
                player.clan = "Shazad"
                player.strength = 6
                ryan._view._label:setFillColor(0.3, 0.3, 0.3)
                obrien._view._label:setFillColor(0.3, 0.3, 0.3)
                singh._view._label:setFillColor(0.3, 0.3, 0.3)
                shazad._view._label:setFillColor(1, 0, 0, 0.5)
                oConnellMcGrath._view._label:setFillColor(0.3, 0.3, 0.3)
                clanText.text = "Info about Shazads"
            end
        end

        -- Update the clan information for the Singh clan
        local function singhText(event)
            if ("ended" == event.phase) then
                clanWarningText.text = ""
                player.clan = "Singh"
                player.strength = 6
                ryan._view._label:setFillColor(0.3, 0.3, 0.3)
                obrien._view._label:setFillColor(0.3, 0.3, 0.3)
                singh._view._label:setFillColor(1, 0, 0, 0.5)
                shazad._view._label:setFillColor(0.3, 0.3, 0.3)
                oConnellMcGrath._view._label:setFillColor(0.3, 0.3, 0.3)
                clanText.text = "Info about Singh's"
            end
        end

        -- Update the clan information for the O'Connell McGrath clan
        local function oConnellMcGrathText(event)
            if ("ended" == event.phase) then
                clanWarningText.text = ""
                player.clan = "O'Connell McGrath"
                player.strength = 6
                ryan._view._label:setFillColor(0.3, 0.3, 0.3)
                obrien._view._label:setFillColor(0.3, 0.3, 0.3)
                singh._view._label:setFillColor(0.3, 0.3, 0.3)
                shazad._view._label:setFillColor(0.3, 0.3, 0.3)
                oConnellMcGrath._view._label:setFillColor(1, 0, 0, 0.5)
                clanText.text = "Info about O'Connell McGraths"
            end
        end

        -- Function to go to character creator scene
        local function createCharFunc(event)
            if (player.clan == "") then
                clanWarning()
                return true
            end
            if ("ended" == event.phase) then
                composer.gotoScene("charactercreator", {effect = "crossFade", time = 500})
            end
        end

        -- Create the buttons
        ryan =
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

        obrien =
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

        singh =
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
        shazad =
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
        oConnellMcGrath =
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

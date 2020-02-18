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
        local attributePoints = 10
        local strength = 8
        local charisma = 10
        local dexterity = 8
        local agility = 8
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local background = display.newImageRect("images/characterCreator.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        local widget = require("widget")
        local attributeLabel
        local strengthLabel
        local charismaLabel
        local dexterityLabel
        local agilityLabel
        local function addStr(event)
            if ("ended" == event.phase) then
                strength = strength + 1
                strengthLabel.text = strength
                attributePoints = attributePoints - 1
                attributeLabel.text = attributePoints
            end
        end
        local function minStr(event)
            if ("ended" == event.phase) then
                strength = strength - 1
                strengthLabel.text = strength
                attributePoints = attributePoints + 1
                attributeLabel.text = attributePoints
            end
        end
        local function addDex(event)
            if ("ended" == event.phase) then
                dexterity = dexterity + 1
                dexterityLabel.text = dexterity
                attributePoints = attributePoints - 1
                attributeLabel.text = attributePoints
            end
        end
        local function minDex(event)
            if ("ended" == event.phase) then
                dexterity = dexterity - 1
                dexterityLabel.text = dexterity
                attributePoints = attributePoints + 1
                attributeLabel.text = attributePoints
            end
        end
        local function addAgi(event)
            if ("ended" == event.phase) then
                agility = agility + 1
                agilityLabel.text = agility
                attributePoints = attributePoints - 1
                attributeLabel.text = attributePoints
            end
        end
        local function minAgi(event)
            if ("ended" == event.phase) then
                agility = agility - 1
                agilityLabel.text = agility
                attributePoints = attributePoints + 1
                attributeLabel.text = attributePoints
            end
        end
        local function addChr(event)
            if ("ended" == event.phase) then
                charisma = charisma + 1
                charismaLabel.text = charisma
                attributePoints = attributePoints - 1
                attributeLabel.text = attributePoints
            end
        end
        local function minCha(event)
            if ("ended" == event.phase) then
                charisma = charisma - 1
                charismaLabel.text = charisma
                attributePoints = attributePoints + 1
                attributeLabel.text = attributePoints
            end
        end
        attributeLabel = display.newText(attributePoints, 340, 245, "Castellar", 30)

        strengthLabel = display.newText(strength, 340, 300, "Castellar", 30)
        charismaLabel = display.newText(charisma, 340, 350, "Castellar", 30)

        dexterityLabel = display.newText(dexterity, 340, 410, "Castellar", 30)

        agilityLabel = display.newText(agility, 340, 460, "Castellar", 30)
        -- Function to handle button events
        local function handleButtonEvent(event)
            if ("ended" == event.phase) then
            --     composer.gotoScene("origin", {effect = "crossFade", time = 500})
            end
        end

        -- Create the widget

        local startGame =
            widget.newButton(
            {
                labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
                left = 50,
                top = 600,
                id = "startGame",
                label = "Start Game",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 70
            }
        )
        local male =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 100,
                top = 150,
                id = "male",
                label = "male",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 20
            }
        )
        local female =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 200,
                top = 150,
                id = "female",
                label = "female",
                onEvent = handleButtonEvent,
                font = "Castellar",
                fontSize = 20
            }
        )

        local minusStrength =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 218,
                top = 280,
                id = "minusStrength",
                label = "-",
                onEvent = minStr,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addStrength =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 285,
                top = 280,
                id = "addStrength",
                label = "+",
                onEvent = addStr,
                font = "Castellar",
                fontSize = 30
            }
        )
        local minusAgility =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 218,
                top = 440,
                id = "minusAgility",
                label = "-",
                onEvent = minAgi,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addAgility =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 285,
                top = 440,
                id = "addAgility",
                label = "+",
                onEvent = addAgi,
                font = "Castellar",
                fontSize = 30
            }
        )
        local minusDexterity =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 218,
                top = 390,
                id = "minusDexterity",
                label = "-",
                onEvent = minDex,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addDexterity =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 285,
                top = 390,
                id = "addDexterity",
                label = "+",
                onEvent = addDex,
                font = "Castellar",
                fontSize = 30
            }
        )
        local minusCharisma =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 218,
                top = 330,
                id = "minusCharisma",
                label = "-",
                onEvent = minCha,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addCharisma =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                left = 285,
                top = 330,
                id = "addCharisma",
                label = "+",
                onEvent = addChr,
                font = "Castellar",
                fontSize = 30
            }
        )

        local nameInput

        local function textListener(event)
            if (event.phase == "began") then
                -- User begins editing "nameInput"
            elseif (event.phase == "ended" or event.phase == "submitted") then
                -- Output resulting text from "nameInput"
                print(event.target.text)
            elseif (event.phase == "editing") then
                print(event.newCharacters)
                print(event.oldText)
                print(event.startPosition)
                print(event.text)
            end
        end

        -- Create text box
        nameInput = native.newTextField(270, 120, 180, 40)
        nameInput.placeholder = "Your Name"
        nameInput.isEditable = true
        nameInput:addEventListener("userInput", textListener)
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

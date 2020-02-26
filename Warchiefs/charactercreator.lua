local composer = require("composer")
local scene = composer.newScene()
local player  = require("playerData")

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
        local widget = require("widget")
        local warningText = display.newText("", 1010, 95, native.systemFont, 35)

        -- Initialize variables, note that these should read from the SQL database

        local minimumStrength = player.strength

        -- Initialize variable labels
        local attributeLabel
        local strengthLabel
        local charismaLabel
        local dexterityLabel
        local agilityLabel

        -- Set background
        local background = display.newImageRect("images/charactercreator.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

        --Functions to make warning texts
        local function warningName()
            warningText.text = display.newText("You must pick a name", 1010, 120, native.systemFont, 35)
        end

        local function warningGender()
            warningText.text = display.newText("You must pick a gender", 1010, 120, native.systemFont, 35)
            warningText:setFillColor(1, 0, 0)
        end
        local function warningAttribute()
            warningText.text = display.newText("You must spend all attribute points", 1010, 120, native.systemFont, 35)
            warningText:setFillColor(1, 0, 0)
        end

        --Function to choose Male character
        local function chooseMale()
            player.gender = "Male"
        end

        --Function to choose Female character
        local function chooseFemale()
            player.gender = "Female"
        end

        -- Function to not allow attribute points go below zero
        local function attributePointsAvailable()
            if (player.attributePoints > 0) then
                return true
            else
                return false
            end
        end

        -- Function to increment strength variable
        local function addStr(event)
            if ("ended" == event.phase) then
                if (attributePointsAvailable()) then
                    player.strength = player.strength + 1
                    strengthLabel.text = player.strength
                    player.attributePoints = player.attributePoints - 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to decrement strength variable, note the minimum value should be read from the sql database
        local function minStr(event)
            if ("ended" == event.phase) then
                if (player.strength > minimumStrength) then
                    player.strength = player.strength - 1
                    strengthLabel.text = player.strength
                    player.attributePoints = player.attributePoints + 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to increment dexterity variable
        local function addDex(event)
            if ("ended" == event.phase) then
                if (attributePointsAvailable()) then
                    player.dexterity = player.dexterity + 1
                    dexterityLabel.text = player.dexterity
                    player.attributePoints = player.attributePoints - 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to decrement dexterity variable, note the minimum value should be read from the sql database
        local function minDex(event)
            if ("ended" == event.phase) then
                if (player.dexterity >= 1) then
                    player.dexterity = player.dexterity - 1
                    dexterityLabel.text = player.dexterity
                    player.attributePoints = player.attributePoints + 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to increment agility variable
        local function addAgi(event)
            if ("ended" == event.phase) then
                if (attributePointsAvailable()) then
                    player.agility = player.agility + 1
                    agilityLabel.text = player.agility
                    player.attributePoints = player.attributePoints - 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to decrement agility variable, note the minimum value should be read from the sql database
        local function minAgi(event)
            if ("ended" == event.phase) then
                if (player.agility >= 1) then
                    player.agility = player.agility - 1
                    agilityLabel.text = player.agility
                    player.attributePoints = player.attributePoints + 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to increment charisma variable
        local function addChr(event)
            if ("ended" == event.phase) then
                if (attributePointsAvailable()) then
                    player.charisma = player.charisma + 1
                    charismaLabel.text = player.charisma
                    player.attributePoints = player.attributePoints - 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- Function to decrement charisma variable, note the minimum value should be read from the sql database
        local function minCha(event)
            if ("ended" == event.phase) then
                if (player.charisma >= 1) then
                    player.charisma = player.charisma - 1
                    charismaLabel.text = player.charisma
                    player.attributePoints = player.attributePoints + 1
                    attributeLabel.text = player.attributePoints
                end
            end
        end

        -- create labels visable to the user for the variables
        attributeLabel = display.newText(player.attributePoints, 340, 245, "Castellar", 30)
        strengthLabel = display.newText(player.strength, 340, 300, "Castellar", 30)
        charismaLabel = display.newText(player.charisma, 340, 350, "Castellar", 30)
        dexterityLabel = display.newText(player.dexterity, 340, 410, "Castellar", 30)
        agilityLabel = display.newText(player.agility, 340, 460, "Castellar", 30)

        -- initalize nameInput
        local nameInput
        -- Function to go to the worldmap
        local function goToWorldMap(event)
            if ("ended" == event.phase) then
                if (player.name == "") then
                    print("you must pick a name")
                    warningName()
                    return
                elseif (player.gender == "") then
                    print("you must pick a gender")
                    warningGender()
                    return
                elseif (player.attributePoints > 0) then
                    print("you must spend attribute points")
                    warningAttribute()
                    return
                end
                nameInput:removeSelf()
                composer.gotoScene("worldmap")
            end
        end

        local startGame =
            widget.newButton(
            {
                labelColor = {default = {1, 1, 1}, over = {0, 0, 0, 0.5}},
                left = 900,
                top = 50,
                id = "startGame",
                label = "Start Game",
                onEvent = goToWorldMap,
                font = "Castellar",
                fontSize = 50
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
                onEvent = chooseMale,
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
                onEvent = chooseFemale,
                font = "Castellar",
                fontSize = 20
            }
        )

        local minusStrength =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 300,
                top = 275,
                id = "minusStrength",
                label = "<",
                onEvent = minStr,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addStrength =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 367,
                top = 275,
                id = "addStrength",
                label = ">",
                onEvent = addStr,
                font = "Castellar",
                fontSize = 30
            }
        )
        local minusAgility =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 300,
                top = 435,
                id = "minusAgility",
                label = "<",
                onEvent = minAgi,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addAgility =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 367,
                top = 435,
                id = "addAgility",
                label = ">",
                onEvent = addAgi,
                font = "Castellar",
                fontSize = 30
            }
        )
        local minusDexterity =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 300,
                top = 385,
                id = "minusDexterity",
                label = "<",
                onEvent = minDex,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addDexterity =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 367,
                top = 385,
                id = "addDexterity",
                label = ">",
                onEvent = addDex,
                font = "Castellar",
                fontSize = 30
            }
        )
        local minusCharisma =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 300,
                top = 325,
                id = "minusCharisma",
                label = "<",
                onEvent = minCha,
                font = "Castellar",
                fontSize = 30
            }
        )
        local addCharisma =
            widget.newButton(
            {
                labelColor = {default = {0, 0, 0}, over = {0, 0, 0, 0.5}},
                width = 10,
                left = 367,
                top = 325,
                id = "addCharisma",
                label = ">",
                onEvent = addChr,
                font = "Castellar",
                fontSize = 30
            }
        )

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
                player.name = event.text
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

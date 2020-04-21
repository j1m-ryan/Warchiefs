local composer = require("composer")
local player = require("playerData")
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
    composer.removeHidden()
    local phase = event.phase
    local background = display.newImageRect("images/skill.png", 1280, 720)
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
    local myName = display.newText(player.name, 1005, 67, native.systemFont, 35)
    local myClan = display.newText(player.clan, 1005, 103, native.systemFont, 35)

    local myStr = display.newText(player.strength, 1170, 255, native.systemFont, 35)
    myStr.anchorX = 0
    myStr:setFillColor(0, 0, 0)

    local myDxt = display.newText(player.dexterity, 1170, 330, native.systemFont, 35)
    myDxt.anchorX = 0
    myDxt:setFillColor(0, 0, 0)
    local myAgi = display.newText(player.agility, 1170, 390, native.systemFont, 35)
    myAgi.anchorX = 0
    myAgi:setFillColor(0, 0, 0)
    local myChr = display.newText(player.charisma, 1170, 460, native.systemFont, 35)
    myChr.anchorX = 0
    myChr:setFillColor(0, 0, 0)
    local myGold = display.newText(player.gold, 1100, 530, native.systemFont, 35)
    myGold.anchorX = 0
    myGold:setFillColor(.8, .6, .2)

    myName.anchorX = 0
    myClan.anchorX = 0

    -- Function to handle button events
    local function handleSharpen(event)
        if (event.phase == "ended" and player.gold >= 1000) then
            myGold:removeSelf()
            myStr:removeSelf()

            player.gold = player.gold - 1000
            player.strength = player.strength + 1
            myStr = display.newText(player.strength, 1170, 255, native.systemFont, 35)
            myStr.anchorX = 0
            myStr:setFillColor(0, 0, 0)
            myGold = display.newText(player.gold, 1100, 530, native.systemFont, 35)
            myGold.anchorX = 0
            myGold:setFillColor(.8, .6, .2)
            sceneGroup:insert(myStr)
            sceneGroup:insert(myGold)
        end
    end

    local function handleDrink(event)
        if (event.phase == "ended" and player.gold >= 1000) then
            myGold:removeSelf()
            myChr:removeSelf()

            player.gold = player.gold - 1000
            player.charisma = player.charisma + 1
            myChr = display.newText(player.charisma, 1170, 460, native.systemFont, 35)
            myChr.anchorX = 0
            myChr:setFillColor(0, 0, 0)
            myGold = display.newText(player.gold, 1100, 530, native.systemFont, 35)
            myGold.anchorX = 0
            myGold:setFillColor(.8, .6, .2)
            sceneGroup:insert(myChr)
            sceneGroup:insert(myGold)
        end
    end

    local function handleTrain(event)
        if (event.phase == "ended" and player.gold >= 1000) then
            myGold:removeSelf()
            myAgi:removeSelf()

            player.gold = player.gold - 1000
            player.agility = player.agility + 1
            myAgi.text = player.agility
            myGold = display.newText(player.gold, 1100, 530, native.systemFont, 35)
            myGold.anchorX = 0
            myGold:setFillColor(.8, .6, .2)

            sceneGroup:insert(myGold)
            sceneGroup:insert(myAgi)
        end
    end
    local function handleDex(event)
        if (event.phase == "ended" and player.gold >= 1000) then
            myGold:removeSelf()
            myDxt:removeSelf()

            player.gold = player.gold - 1000
            player.dexterity = player.dexterity + 1
            myDxt.text = player.dexterity
            myGold = display.newText(player.gold, 1100, 530, native.systemFont, 35)
            myGold.anchorX = 0
            myGold:setFillColor(.8, .6, .2)

            sceneGroup:insert(myGold)
            sceneGroup:insert(myDxt)
        end
    end

    local button1 =
        widget.newButton(
        {
            width = 240,
            height = 120,
            defaultFile = "images/sharpenDefault.png",
            overFile = "images/sharpenOver.png",
            onEvent = handleSharpen
        }
    )

    local button2 =
        widget.newButton(
        {
            width = 240,
            height = 120,
            defaultFile = "images/drinkDefault.png",
            overFile = "images/drinkOver.png",
            onEvent = handleDrink
        }
    )
    local button3 =
        widget.newButton(
        {
            width = 240,
            height = 120,
            defaultFile = "images/trainDefault.png",
            overFile = "images/trainOver.png",
            onEvent = handleTrain
        }
    )
    local button4 =
        widget.newButton(
        {
            width = 240,
            height = 120,
            defaultFile = "images/dexDefault.png",
            overFile = "images/dexOver.png",
            onEvent = handleDex
        }
    )

    button1.x = 200
    button1.y = 300
    button2.x = 600
    button2.y = 300
    button3.x = 200
    button3.y = 500
    button4.x = 600
    button4.y = 500

    myName:setFillColor(0, 0, 0)
    myClan:setFillColor(0, 0, 0)
    sceneGroup:insert(background)
    sceneGroup:insert(backBTN)
    sceneGroup:insert(myName)
    sceneGroup:insert(myStr)
    sceneGroup:insert(myDxt)
    sceneGroup:insert(myAgi)
    sceneGroup:insert(myChr)
    sceneGroup:insert(myClan)
    sceneGroup:insert(myGold)
    sceneGroup:insert(button1)
    sceneGroup:insert(button2)
    sceneGroup:insert(button3)
    sceneGroup:insert(button4)
end

-- show()
function scene:show(event)
    local sceneGroup = self.view

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

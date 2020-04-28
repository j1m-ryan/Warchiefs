local composer = require("composer")
local player = require("playerData")
local scene = composer.newScene()
composer.removeHidden()

function scene:create(event)
    local sceneGroup = self.view
    local phase = event.phase
    print(player.gold)
    local background = display.newImageRect("images/mage.png", 1280, 720)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    local widget = require("widget")
    goldlabel = display.newText(player.gold, 1100, 45, "Castellar", 50)
    largelabel = display.newText(player.largehealthPotions, 750, 150, "Castellar", 50)
    smalllabel = display.newText(player.smallhealthPotions, 750, 450, "Castellar", 50)
    local function goBack(event)
        if ("ended" == event.phase) then
            composer.hideOverlay("level")
            composer.gotoScene(player.location)
        end
    end
    local function buyLargePotion(event)
        if ("ended" == event.phase) then
           if player.largehealthPotions < 2 then
              if player.gold >= 1000 then
                  player.largehealthPotions = player.largehealthPotions + 1
                  player.gold = player.gold - 1000
                  goldlabel.text = player.gold
                  largelabel.text = player.largehealthPotions
                end
            end
        end
    end
    local function buySmallPotion(event)
        if ("ended" == event.phase) then
           if player.smallhealthPotions <4 then
               if player.gold >= 250 then
                  player.smallhealthPotions = player.smallhealthPotions + 1
                  player.gold = player.gold - 250
                  goldlabel.text = player.gold
                  smalllabel.text = player.smallhealthPotions
                end
            end
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
    local buyLarge =
        widget.newButton(
        {
            labelColor = {default = {.4, .6, .4}, over = {0, 0, 0, 0.5}},
            left = 370,
            top = 250,
            id = "buyLarge",
            label = "BUY",
            onEvent = buyLargePotion,
            font = "Castellar",
            fontSize = 40
        }
    )
    local buySmall =
        widget.newButton(
        {
            labelColor = {default = {.4, .6, .4}, over = {0, 0, 0, 0.5}},
            left = 370,
            top = 500,
            id = "buySmall",
            label = "BUY",
            onEvent = buySmallPotion,
            font = "Castellar",
            fontSize = 40
        }
    )
    sceneGroup:insert(background)
    sceneGroup:insert(buySmall)
    sceneGroup:insert(buyLarge)
    sceneGroup:insert(backBTN)
    sceneGroup:insert(goldlabel)
    sceneGroup:insert(largelabel)
    sceneGroup:insert(smalllabel)
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

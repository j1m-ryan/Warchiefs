--copy above

local composer = require("composer")

local scene = composer.newScene()
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX
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
    local obriensCastle = display.newText("O'Brien's Castle", 220, 190, "Castellar", 20)
    local ryanstown = display.newText("Ryanstown", 780, 130, "Castellar", 20)

    if (phase == "will") then
        local physics = require("physics")
        physics.start()
        physics.setGravity(0, 0)
        -- Create the widget
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local background = display.newImageRect("images/worldmap2.png", 1280, 720)
        background.x = display.contentCenterX
        background.y = display.contentCenterY
        local character = display.newImageRect("images/basicman.png", 100, 100)
        character.x = 100
        character.y = 100
        physics.addBody(character, {radius = 30, isSensor = true})
        physics.addBody(obriensCastle, {radius = 30, isSensor = true})
        physics.addBody(ryanstown, {radius = 30, isSensor = true})
        character.myName = _G.name
        obriensCastle.myName = "obriensCastle"
        ryanstown.myName = "ryanstown"

        local widget = require("widget")

        function onKeyEvent(event)
            if event.keyName == "a" then
                if event.phase == "down" then
                    transition.to(character, {time = 3000, x = character.x - (screenW / 2) - 10})
                elseif event.phase == "up" then
                    transition.cancel()
                end
            end
            if event.keyName == "w" then
                if event.phase == "down" then
                    transition.to(character, {time = 3000, y = character.y - (screenH / 2) - 10})
                elseif event.phase == "up" then
                    transition.cancel()
                end
            end
            if event.keyName == "s" then
                if event.phase == "down" then
                    transition.to(character, {time = 3000, y = character.y + (screenH / 2) - 10})
                elseif event.phase == "up" then
                    transition.cancel()
                end
            end
            if event.keyName == "d" then
                if event.phase == "down" then
                    transition.to(character, {time = 3000, x = character.x + (screenW / 2) + 10})
                elseif event.phase == "up" then
                    transition.cancel()
                end
            end
        end
        local function onLocalCollision(self, event)
            if (event.phase == "began") then
                print(self.myName .. ": collision began with " .. event.other.myName)
                if (event.other.myName == "obriensCastle") then
                    composer.gotoScene("obriensCastle")
                elseif  (event.other.myName == "ryanstown") then
                    composer.gotoScene("ryanstown")
                end

                
            elseif (event.phase == "ended") then
                print(self.myName .. ": collision ended with " .. event.other.myName)
            end
        end
        character.collision = onLocalCollision
        character:addEventListener("collision")

  
    elseif (phase == "did") then
        Runtime:addEventListener("key", onKeyEvent)
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

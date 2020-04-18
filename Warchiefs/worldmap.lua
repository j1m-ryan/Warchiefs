--copy above

local composer = require("composer")
local player = require("playerData")
local scene = composer.newScene()
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX
local mainMusic
local bgNoise
composer.removeHidden()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
    composer.removeHidden()

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --load music
    mainMusic = audio.loadStream("audio/mainmusic.wav")

    --load bg noise
    bgNoise = audio.loadStream("audio/bgnoise.wav")
    local phase = event.phase
    local obriensCastle = display.newImageRect("images/obriencity.png", 180, 180)
    obriensCastle.x = 300
    obriensCastle.y = 130

    --city 3

    local city3 = display.newImageRect("images/city3.png", 180, 180)
    city3.x = 400
    city3.y = 630

    --local ryanstown = display.newText("Ryanstown", 780, 130, "Castellar", 20)
    local ryanstown = display.newImageRect("images/ryancity.png", 180, 180)
    ryanstown.x = 970
    ryanstown.y = 200

    local physics = require("physics")
    physics.start()
    physics.setGravity(0, 0)
    -- Create the widget
    -- Code here runs when the scene is still off screen (but is about to come on screen)
    local background = display.newImageRect("images/worldmap.jpg", 1280, 720)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local character
    if player.gender == "Male" then
        character = display.newImageRect("images/hero1.png", 130, 130)
    else
        character = display.newImageRect("images/hero2.png", 130, 130)
    end

    local characterDirection = "right"
    character.x = player.x
    character.y = player.y
    physics.addBody(character, {radius = 30, isSensor = true})
    physics.addBody(obriensCastle, {radius = 30, isSensor = true})
    physics.addBody(ryanstown, {radius = 30, isSensor = true})
    physics.addBody(city3, {radius = 30, isSensor = true})
    character.myName = player.name
    obriensCastle.myName = "obriensCastle"
    ryanstown.myName = "ryanstown"
    city3.myName = "city3"

    local widget = require("widget")

    function onKeyEvent(event)
        if (character.x == nil or character.y == nil) then
            return
        end
        if character.x < 20 then
            character.x = 20
        end
        if character.x > 1260 then
            character.x = 1260
        end
        if character.y < 20 then
            character.y = 20
        end
        if character.y > 740 then
            character.y = 740
        end
        print("x")
        print(character.x)
        print("Y")
        print(character.y)
        if event.keyName == "a" then
            if characterDirection == "right" then
                characterDirection = "left"
                character.xScale = -1
            end
            if event.phase == "down" then
                if (character.x > 20) then
                    transition.to(character, {time = 3000, x = character.x - (screenW / 2) - 10})
                end
            elseif event.phase == "up" then
                transition.cancel()
            end
        end
        if event.keyName == "w" then
            if event.phase == "down" then
                if (character.y > 20) then
                    transition.to(character, {time = 3000, y = character.y - (screenH / 2) - 10})
                end
            elseif event.phase == "up" then
                transition.cancel()
            end
        end
        if event.keyName == "s" then
            if event.phase == "down" then
                if (character.y < 700) then
                    transition.to(character, {time = 3000, y = character.y + (screenH / 2) - 10})
                end
            elseif event.phase == "up" then
                transition.cancel()
            end
        end
        if event.keyName == "d" then
            if characterDirection == "left" then
                characterDirection = "right"
                character.xScale = 1
            end
            if event.phase == "down" then
                if (character.x < 1260) then
                    transition.to(character, {time = 3000, x = character.x + (screenW / 2) + 10})
                end
            elseif event.phase == "up" then
                transition.cancel()
            end
        end
    end
    local function onClick(event)
        local differenceInX = character.x - event.x
        local differenceInY = character.y - event.y
        local distanceOfWalk = math.sqrt((differenceInX * differenceInX) + (differenceInY * differenceInY))
        local timeForWalk = distanceOfWalk * 5

        if (event.phase == "ended") then
            if (event.x > character.x) then
                characterDirection = "right"
                character.xScale = 1
            else
                characterDirection = "right"
                character.xScale = -1
            end

            transition.to(character, {time = timeForWalk, x = event.x, y = event.y})
        end
    end
    local function onLocalCollision(self, event)
        if (event.phase == "began") then
            print(self.myName .. ": collision began with " .. event.other.myName)
            if (event.other.myName == "obriensCastle") then
                character:removeEventListener("collision", character)
                Runtime:removeEventListener("key", onKeyEvent)
                Runtime:removeEventListener("touch", onClick)
                player.x = 196
                player.y = 250
                composer.gotoScene("ryanstown")
            elseif (event.other.myName == "ryanstown") then
                character:removeEventListener("collision", character)
                Runtime:removeEventListener("key", onKeyEvent)
                Runtime:removeEventListener("touch", onClick)
                player.x = 774
                player.y = 190
                composer.gotoScene("city2")
            elseif (event.other.myName == "city3") then
                character:removeEventListener("collision", character)
                Runtime:removeEventListener("key", onKeyEvent)
                Runtime:removeEventListener("touch", onClick)
                player.x = 400
                player.y = 630
                composer.gotoScene("city3")
            end
        elseif (event.phase == "ended") then
            print(self.myName .. ": collision ended with " .. event.other.myName)
        end
    end
    character.collision = onLocalCollision
    character:addEventListener("collision")

    Runtime:addEventListener("key", onKeyEvent)
    Runtime:addEventListener("touch", onClick)

    -- Code here runs when the scene is entirely on screen

    --play music
    audio.play(mainMusic, {channel = 2, loops = -1})

    --play bg noise
    audio.play(bgNoise, {channel = 3, loops = -1})

    sceneGroup:insert(background)
    sceneGroup:insert(character)
    sceneGroup:insert(obriensCastle)
    sceneGroup:insert(ryanstown)
    sceneGroup:insert(city3)
end

-- show()
function scene:show(event)
    local sceneGroup = self.view
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

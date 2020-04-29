local composer = require("composer")
local enemy

local player = require("playerData")

if player.location == "ryanstown" then
    enemy = require("TestData2")
elseif player.location == "city2" then
    enemy = require("TestData3")
else
    enemy = require("TestData4")
end
local widget = require("widget")
local scene = composer.newScene()

function scene:create(event)
    composer.removeHidden()
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local phase = event.phase

    -- Code here runs when the scene is still off screen (but is about to come on screen)

    -- background castle view
    local background
    if player.location == "ryanstown" then
        background = display.newImageRect("images/combatback.png", 1280, 720)
    elseif player.location == "city2" then
        background = display.newImageRect("images/combatback2.png", 1280, 720)
    else
        background = display.newImageRect("images/combatback3.png", 1280, 720)
    end
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    --player and enemy

    local sheetOptionsEnemy = {
        width = 200,
        height = 400,
        numFrames = 6,
        sheetContentWidth = 1200,
        sheetContentHeight = 400
    }

    local attack_sheetEnemy
    if player.location == "ryanstown" then
        attack_sheetEnemy = graphics.newImageSheet("images/enemyanim.png", sheetOptionsEnemy)
    elseif player.location == "city2" then
        attack_sheetEnemy = graphics.newImageSheet("images/test.png", sheetOptionsEnemy)
    else
        attack_sheetEnemy = graphics.newImageSheet("images/test2.png", sheetOptionsEnemy)
    end
    local sequenceDataEnemy = {
        {name = "enemy", frames = {1, 2, 3, 4, 5, 6, 1}, time = 500, loopCount = 1, loopDirection = "reverse"}
    }

    local enemyAnimation = display.newSprite(attack_sheetEnemy, sequenceDataEnemy)

    enemyAnimation.x = 700

    enemyAnimation.y = 260
    enemyAnimation.anchorY = 0
    enemyAnimation.xScale = -1
    if player.location == "ryanstown" then
    elseif player.location == "city2" then
        enemyAnimation.xScale = enemyAnimation.xScale * 1.2
        enemyAnimation.yScale = enemyAnimation.yScale * 1.2
        enemyAnimation.y = 200
    else
        enemyAnimation.xScale = enemyAnimation.xScale * 1.5
        enemyAnimation.yScale = enemyAnimation.yScale * 1.5
        enemyAnimation.y = 100
    end
    --health bars

    local health_bar_outter = display.newImageRect("images/healthbar.png", 225, 35)
    health_bar_outter.x = 225
    health_bar_outter.y = 663

    local health_bar_outter2 = display.newImageRect("images/healthbar.png", 425, 35)
    health_bar_outter2.x = 995
    health_bar_outter2.y = 663

    local Bar = display.newRect(20, 160, 218, 22)
    Bar.x = 115
    Bar.y = 652
    Bar:setFillColor(250, 0, 0)
    Bar.anchorX = 0
    Bar.anchorY = 0

    local EnemyBar = display.newRect(20, 160, 400, 22)
    EnemyBar.x = 1187
    EnemyBar.y = 652
    EnemyBar:setFillColor(250, 0, 0)
    EnemyBar.anchorX = 1
    EnemyBar.anchorY = 0

    local enemyHealthBar = EnemyBar
    local playerHealthBar = Bar

    -- if player.location == "ryanstown" then
    --   enemyHealthBar = require("enemyHealthBar")
    -- playerHealthBar = require("healthBar")
    -- elseif player.location == "city2" then
    --   enemyHealthBar = require("enemyHealthBar2")
    -- playerHealthBar = require("healthBar2")
    --else
    --  enemyHealthBar = require("enemyHealthBar3")
    -- playerHealthBar = require("healthBar3")
    --end

    local health_bar_outter3 = display.newImageRect("images/heart.png", 55, 60)
    health_bar_outter3.x = 110
    health_bar_outter3.y = 660

    local health_bar_outter4 = display.newImageRect("images/heart.png", 55, 60)
    health_bar_outter4.x = 1200
    health_bar_outter4.y = 660

    --background fire animation intialize
    local sheetOptions3 = {
        width = 60.3,
        height = 60,
        numFrames = 3,
        sheetContentWidth = 182,
        sheetContentHeight = 60
    }

    local fire_sheet = graphics.newImageSheet("images/fire3.png", sheetOptions3)

    local sequenceData3 = {
        {name = "fire", frames = {1, 2, 3}, time = 500, loopCount = 0, loopDirection = "forward"}
    }

    --       local attack_animation = display.newSprite(attack_sheet, sequenceData )
    local fire = display.newSprite(fire_sheet, sequenceData3)
    fire.x = 545
    fire.y = 335
    fire.xScale = 1.4
    fire.yScale = 2
    fire:play()

    local sequenceData4 = {
        {name = "fire", frames = {3, 1, 2}, time = 500, loopCount = 0, loopDirection = "forward"}
    }

    local fire2 = display.newSprite(fire_sheet, sequenceData4)
    fire2.x = 830
    fire2.y = 335
    fire2.xScale = 1.4
    fire2.yScale = 2
    fire2:play()

    --Attack aniamtion
    local sheetOptions = {
        width = 300,
        height = 300,
        numFrames = 4,
        sheetContentWidth = 1200,
        sheetContentHeight = 300
    }
    local wasRecentlyClicked = false
    local function setRecentlyClickedFalse()
        wasRecentlyClicked = false
    end
    local function attackeButtonTimer()
        wasRecentlyClicked = true
        timer.performWithDelay(3000, setRecentlyClickedFalse)
    end

    local attack_sheet
    if player.level == 1 then
        if player.gender == "Female" then
            attack_sheet = graphics.newImageSheet("images/attackAnimation1f.png", sheetOptions)
        else
            attack_sheet = graphics.newImageSheet("images/attackAnimation1.png", sheetOptions)
        end
    elseif player.level == 2 then
        if player.gender == "Female" then
            attack_sheet = graphics.newImageSheet("images/attackAnimation2f.png", sheetOptions)
        else
            attack_sheet = graphics.newImageSheet("images/attackAnimation2.png", sheetOptions)
        end
    else
        attack_sheet = graphics.newImageSheet("images/attackAnimation3.png", sheetOptions)
    end

    local sequenceData = {
        {name = "attack", frames = {1, 2, 3, 1}, time = 800, loopCount = 1, loopDirection = "forward"}
    }

    --       local attack_animation = display.newSprite(attack_sheet, sequenceData )
    local attack_animation = display.newSprite(attack_sheet, sequenceData)
    attack_animation.x = 510
    attack_animation.y = 510
    attack_animation.xScale = .7
    attack_animation.yScale = .7

    --Health displayed in numbers
    playerHealthNum = display.newText("", 150, 620, native.systemFont, 40)
    playerHealthNum:setFillColor(1, 0, 0)
    playerHealthNum.text = player.health

    enemyHealthNum = display.newText("", 1150, 620, native.systemFont, 40)
    enemyHealthNum:setFillColor(1, 0, 0)
    enemyHealthNum.text = enemy.health

    --Health Potion displayed in numbers
    smallPotions = display.newText("", 470, 625, native.systemFont, 30)
    smallPotions:setFillColor(0, 1, 0)
    smallPotions.text = player.smallhealthPotions

    largePotions = display.newText("", 565, 625, native.systemFont, 30)
    largePotions:setFillColor(0, 1, 0)
    largePotions.text = player.largehealthPotions

    -- Condition for Attack function if false then do nothing
    local bothAlive = true

    --stopping multiple misses in rows
    local playerMissCount = 0
    local enemyMissCount = 0
    --if someone scores a hit then reset their counter
    local function resetMissCounter(id)
        if (id == "player") then
            print("hit so reset" .. id)
            playerMissCount = 0
        elseif (id == "enemy") then
            print("hit so reset" .. id)
            enemyMissCount = 0
        end
    end

    local function hitIfManyMissInRow(id)
        if (id == "player" and playerMissCount >= 3) then
            playerMissCount = 0
            return true
        elseif (id == "enemy" and enemyMissCount >= 3) then
            enemyMissCount = 0
            return true
        else
            return false
        end
    end

    -- getting max and min for probabilty of hit chance depending on player/enemy Level

    local function generateHitChance(level)
        local hitChance = 0
        if (level == 1) then
            hitChance = math.random(30, 60)
        elseif (level == 2) then
            hitChance = math.random(40, 70)
        elseif (level == 3) then
            hitChance = math.random(50, 80)
        else
            print("invalid operation")
        end

        return hitChance
    end

    local function hitOrMiss(id, hitChance)
        local hitRange = 0
        local hitRangeMax = 0
        local hitRangeMin = 0
        local hit = false
        hitRange = math.random(1, 3)
        if (hitRange == 1) then
            hitRangeMin = 0
            hitRangeMax = 30
        elseif (hitRange == 2) then
            hitRangeMin = 31
            hitRangeMax = 60
        elseif (hitRange == 3) then
            hitRangeMin = 61
            hitRangeMax = 100
        else
            print("hit range else")
        end
        if (hitChance >= hitRangeMin and hitChance <= hitRangeMax) then
            print("hit landed")
            hit = true
            return hit
        else
            if (id == "player") then
                playerMissCount = playerMissCount + 1
            elseif (id == "enemy") then
                enemyMissCount = enemyMissCount + 1
            end
            print("missed")
            return hit
        end
    end

    local function applyDamage(id, health, damage)
        --below decides whose health should be deducted by damage
        print("appkydamage" .. id)
        if (id == "enemy") then
            player.health = health - damage
            if player.health <= 0 then
                composer.gotoScene("loseBattle", {effect = "crossFade", time = 500})
            end
        elseif (id == "player") then
            enemy.health = health - damage
            if enemy.health <= 0 then
                if (player.location == "ryanstown") then
                    player.ownsRyansTown = true
                elseif player.location == "city3" then
                    player.ownsCity3 = true
                elseif player.location == "city2" then
                    player.ownsCity2 = true
                end

                timer.performWithDelay(3500, composer.gotoScene("winBattle", {effect = "crossFade", time = 500}))
            end
            print(enemy.health .. "enemy health")
        end
    end

    local function applyDamageHealthBar(id, damage)
        local health_bar_Scale
        local totalHealth
        if (id == "enemy") then
            health_bar_scale = playerHealthBar.xScale
            totalHealth = player.totalHealth
        elseif (id == "player") then
            health_bar_scale = enemyHealthBar.xScale
            totalHealth = enemy.totalHealth
        end

        if (health_bar_scale > 0.015) then -- do nothing, this code is here to stop crashing as if scaler cant be brought to zero
            local barDamage = damage / totalHealth

            local perdictedDamage = health_bar_scale - barDamage

            if (perdictedDamage >= 0.015) then -- its here to stop bar going - on scale
                if (id == "player") then
                    enemyHealthBar.xScale = perdictedDamage
                else
                    playerHealthBar.xScale = perdictedDamage
                end
            else
                if (id == "player") then
                    enemyHealthBar.xScale = 0.01
                else
                    playerHealthBar.xScale = 0.01
                end
            end
        end
    end

    --hit text boxes method
    local playerhit = display.newText("", 200, 200, native.systemFont, 40)
    local enemyhit = display.newText("", 1000, 200, native.systemFont, 40)
    local charismaTextPlayer = display.newText("", 200, 200, native.systemFont, 40)
    local charismaTextEnemy = display.newText("", 1000, 200, native.systemFont, 40)
    function leave()
        attackeButtonTimer()
        composer.gotoScene("worldmap")
    end

    function enemyTalk()
        attackeButtonTimer()
        print "enemy is talking"
        charismaTextEnemy = display.newText("", 1000, 200, native.systemFont, 40)

        charismaTextEnemy.text = "Ok " .. player.name .. ", nice to meet you!"
        transition.moveTo(charismaTextEnemy, {x = 1200, y = 400, time = 2000})
        transition.fadeOut(charismaTextEnemy, {time = 2300})
        timer.performWithDelay(2000, leave)
        player.health = player.totalHealth
        enemy.health = enemy.totalHealth
    end

    function enemyTalk2()
        attackeButtonTimer()
        print "enemy is talking"
        charismaTextEnemy = display.newText("", 1000, 200, native.systemFont, 40)

        charismaTextEnemy.text = "Pfft you do not charm me!"
        transition.moveTo(charismaTextEnemy, {x = 1200, y = 400, time = 2000})
        transition.fadeOut(charismaTextEnemy, {time = 2300})
    end

    function talk()
        attackeButtonTimer()
        print "hello"
        local requiredChar = 10
        if (player.level == 2) then
            requiredChar = 14
        elseif player.level == 3 then
            requiredChar = 16
        end
        if (player.charisma > requiredChar) then
            charismaTextPlayer = display.newText("", 200, 200, native.systemFont, 40)
            charismaTextPlayer.text = "Hey, lets be friends"
            transition.moveTo(charismaTextPlayer, {x = 300, y = 400, time = 2000})
            transition.fadeOut(charismaTextPlayer, {time = 2300})
            timer.performWithDelay(2000, enemyTalk)
        else
            charismaTextPlayer = display.newText("", 200, 200, native.systemFont, 40)
            charismaTextPlayer.text = "Erm, eh whats up man?"
            transition.moveTo(charismaTextPlayer, {x = 300, y = 400, time = 2000})
            transition.fadeOut(charismaTextPlayer, {time = 2300})

            timer.performWithDelay(2000, enemyTalk2)
        end
    end

    function hitText(id, damage, miss)
        if (id == "player") then
            attack_animation:play()
        end
        if (id == "player" and miss == false) then
            playerhit = display.newText("", 200, 200, native.systemFont, 40)
            playerhit:setFillColor(0, 1, 0)
            playerhit.text = "Player did " .. damage .. " damage"
            transition.moveTo(playerhit, {x = 300, y = 400, time = 2000})
            transition.fadeOut(playerhit, {time = 2300})
            enemyHealthNum.text = enemy.health
        elseif (id == "player" and miss == true) then
            -- initializing hit text boxes
            playerhit = display.newText("", 200, 200, native.systemFont, 40)
            playerhit:setFillColor(1, 0, 0)
            playerhit.text = "Player missed !"
            transition.moveTo(playerhit, {x = 300, y = 400, time = 2000})
            transition.fadeOut(playerhit, {time = 2300})
        end

        if (id == "enemy" and miss == false) then
            enemyhit:setFillColor(1, 0, 0)
            enemyhit.text = "enemy did " .. damage .. " damage"
            transition.moveTo(enemyhit, {x = 1200, y = 400, time = 2000})
            transition.fadeOut(enemyhit, {time = 2300})
            playerHealthNum.text = player.health
        elseif (id == "enemy" and miss == true) then
            enemyhit = display.newText("", 1000, 200, native.systemFont, 40)
            enemyhit:setFillColor(0, 0, 1)
            enemyhit.text = "Enemy missed !"
            transition.moveTo(enemyhit, {x = 1200, y = 400, time = 2000})
            transition.fadeOut(enemyhit, {time = 2300})
        end
    end --hitText end

    -- health potion method
    function healthPotionFunc(size, quantity)
        print("quanty is" .. quantity)
        if (quantity <= 0) then
            return
        end
        local healthPotionsQuantity = quantity
        local smallPotion = 25
        local largePotion = 45
        if (size == "large") then
            healthPotion = largePotion
        elseif (size == "small") then
            healthPotion = smallPotion
        end

        if (player.health > 0 and player.health < player.totalHealth) then
            local heath_bar_add = healthPotion / player.totalHealth
            local perdictedHealth = player.health + healthPotion
            if (perdictedHealth <= player.totalHealth) then
                print("this happened" .. quantity)
                if (healthPotionsQuantity > 0) then
                    player.health = player.health + healthPotion
                    playerHealthNum.text = player.health
                    playerHealthBar.xScale = playerHealthBar.xScale + heath_bar_add
                    if (size == "large") then
                        player.largehealthPotions = player.largehealthPotions - 1
                    elseif (size == "small") then
                        player.smallhealthPotions = player.smallhealthPotions - 1
                    end
                else
                    --do nothing
                end
            else
                print("other thing happened" .. quantity)
                player.health = player.totalHealth
                playerHealthNum.text = player.totalHealth
                playerHealthBar.xScale = 1

                if (size == "large") then
                    player.largehealthPotions = player.largehealthPotions - 1
                elseif (size == "small") then
                    player.smallhealthPotions = player.smallhealthPotions - 1
                end
            end
            largePotions.text = player.largehealthPotions
            smallPotions.text = player.smallhealthPotions
        end
    end
    -- end of health potion

    --Atack function
    local function AttackTurn(id, health, level, damage) --here enter whose health needs to be reduced
        if (player.health <= 0 or enemy.health <= 0) then
            bothAlive = false
        end

        if (bothAlive == true) then
            local hitChance = 0
            hitChance = generateHitChance(level)
            local hit = false
            hit = hitOrMiss(id, hitChance)

            --below we testing if its a hit then reset player or enemy misscounter
            if (hit == true) then
                resetMissCounter(id)
            end
            --check if id object have missCounter above or equal to 3 then make it a hit instead of miss// to break miss cycle
            if (hit == false) then
                local confirm = false
                confirm = hitIfManyMissInRow(id)
                print("player misses " .. playerMissCount)
                print("enemy misses " .. enemyMissCount)
                print(confirm)
                hit = confirm
            end
            if (hit == true) then
                applyDamage(id, health, damage)
                applyDamageHealthBar(id, damage)
                hitText(id, damage, false)
            elseif (hit == false) then
                hitText(id, 0, true)
                print("missed")
            end
        else
            --do nothing
        end
    end -- end of attack function

    --enemyAttack Event
    local function enemyTurn()
        enemyAnimation:play()
        AttackTurn(enemy.id, player.health, enemy.level, enemy.damage)
    end
    --playerAttack Event
    local function PlayerTurn(event)
        if (wasRecentlyClicked) then
            return
        end
        if event.phase == "ended" then
            AttackTurn(player.id, enemy.health, player.level, player.damage)
            attackeButtonTimer()
            if (enemy.health <= 0) then
                return
            end
            timer.performWithDelay(2000, enemyTurn)
        end
    end

    --small Health potion event
    local function smallHealthPotion(event)
        local small = "small"
        healthPotionFunc(small, player.smallhealthPotions)
    end

    --large Health potion event
    local function largeHealthPotion(event)
        healthPotionFunc("large", player.largehealthPotions)
    end

    --exit to world map func
    local function goToWorldMap(event)
        if ("ended" == event.phase) then
            composer.gotoScene("worldmap")
        end
    end

    -- Create attack button

    local options = {
        width = 150,
        height = 150,
        numFrames = 2,
        sheetContentWidth = 300,
        sheetContentHeight = 150
    }
    local buttonSheet = graphics.newImageSheet("images/attackbuttonAnimate.png", options)

    -- Create the widget
    local button1 =
        widget.newButton(
        {
            sheet = buttonSheet,
            defaultFrame = 1,
            overFrame = 2,
            onEvent = PlayerTurn,
            isEnabled = true
        }
    )

    -- Center the button
    button1.x = 390
    button1.y = 650
    button1.xScale = .7
    button1.yScale = .7

    -- Create Health potion button

    local options = {
        width = 150,
        height = 150,
        numFrames = 2,
        sheetContentWidth = 300,
        sheetContentHeight = 150
    }

    local buttonSheet2 = graphics.newImageSheet("images/smallhealthpotion.png", options)

    -- Create the widget
    local button2 =
        widget.newButton(
        {
            sheet = buttonSheet2,
            defaultFrame = 1,
            overFrame = 2,
            onRelease = smallHealthPotion
        }
    )

    -- Center the button
    button2.x = 490
    button2.y = 650
    button2.xScale = .7
    button2.yScale = .7

    -- Create Health potion button

    local buttonSheet3 = graphics.newImageSheet("images/bigHealthPotion.png", options)

    -- Create the widget
    local button3 =
        widget.newButton(
        {
            sheet = buttonSheet3,
            defaultFrame = 1,
            overFrame = 2,
            onRelease = largeHealthPotion
        }
    )

    -- Center the button
    button3.x = 590
    button3.y = 650
    button3.xScale = .7
    button3.yScale = .7

    -- Create Evade button
    local options = {
        width = 150,
        height = 150,
        numFrames = 2,
        sheetContentWidth = 300,
        sheetContentHeight = 150
    }
    local buttonSheet4 = graphics.newImageSheet("images/evadebutton.png", options)

    -- Create the widget
    local button4 =
        widget.newButton(
        {
            sheet = buttonSheet4,
            defaultFrame = 1,
            overFrame = 2,
            onRelease = talk
        }
    )

    -- Center the button
    button4.x = 690
    button4.y = 650
    button4.xScale = .7
    button4.yScale = .7

    sceneGroup:insert(background)

    sceneGroup:insert(health_bar_outter)
    sceneGroup:insert(health_bar_outter2)
    sceneGroup:insert(health_bar_outter3)
    sceneGroup:insert(health_bar_outter4)
    sceneGroup:insert(fire)
    sceneGroup:insert(fire2)

    sceneGroup:insert(enemyAnimation)
    sceneGroup:insert(button2)
    sceneGroup:insert(button3)
    sceneGroup:insert(button4)

    sceneGroup:insert(playerhit)
    sceneGroup:insert(enemyhit)
    sceneGroup:insert(attack_animation)
    sceneGroup:insert(button1)

    sceneGroup:insert(playerHealthBar)
    sceneGroup:insert(enemyHealthBar)
    sceneGroup:insert(charismaTextPlayer)
    sceneGroup:insert(charismaTextEnemy)
    sceneGroup:insert(playerHealthNum)
    sceneGroup:insert(enemyHealthNum)
    sceneGroup:insert(smallPotions)
    sceneGroup:insert(largePotions)
end

scene:addEventListener("create", scene)

return scene

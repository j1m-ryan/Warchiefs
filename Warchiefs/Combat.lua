    local composer = require("composer")
    local player = require("TestData")
    local enemy = require("TestData2")
    local player2 = require("playerData")
    local widget = require("widget")
    local scene = composer.newScene()
        
    -- background castle view
        local background = display.newImageRect("images/combatBackground.png", 1280, 620)
        background.x = display.contentCenterX
        background.y = display.contentCenterY

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
        elseif (phase == "did") then
        -- Code here runs when the scene is entirely on screen
        end
    end

        
        



        --player and enemy

        local player_pic = display.newImageRect("images/hero1.png", 180, 120)
        player_pic.x = 350
        player_pic.y = 518


        local enemy_pic = display.newImageRect("images/lvl3.png", 390, 290)
        enemy_pic.x = 1000
        enemy_pic.y = 470
        enemy_pic.xScale = -1

        --health bars

        local health_bar_outter = display.newImageRect("images/healthbar.png", 225, 35)
        health_bar_outter.x = 225      
        health_bar_outter.y = 663


        local health_bar_outter2 = display.newImageRect("images/healthbar.png", 425, 35)
        health_bar_outter2.x = 995      
        health_bar_outter2.y = 663

	    local enemy_health_Bar = require("enemyHealthBar")
   		local Bar = require("healthBar")
    
    	local health_bar_outter3 = display.newImageRect("images/heart.png", 55, 60)
        health_bar_outter3.x = 120   
        health_bar_outter3.y = 660


    	local health_bar_outter4 = display.newImageRect("images/heart.png", 55, 60)
        health_bar_outter4.x = 1200   
        health_bar_outter4.y = 660


    -- single attack is done on pressing attack button untill player or enemy is dead
    local turn_decider = 1
    

    function AttackTurn()
        
        if (player.health > 0 and enemy.health > 0) then
            local id
            local health 
            local level 
            local damage 
            local hitChance = 0

            local hitRange = 0
            local hitRangeMin = 0
            local hitRangeMax = 0
            if (math.mod(turn_decider,2)==0) then
                    id = player.id
                    health = player.health
                    level = player.level
                    damage = player.weapon
            else 
                    id = enemy.id
                    health = enemy.health
                    level = enemy.level
                    damage= enemy.weapon         
            end

                print(level)

            print(health)
            print(damage)
        -- getting max and min for probabilty of hit chance depending on player/enemy Level

            if(level==1)then
                    hitChance = math.random(30,60)
            elseif(level == 2)then
                    hitChance = math.random(40,70)
            elseif(level == 3)then
                    hitChance = math.random(50,80)
            else
              print("invalid operation")
            end

        -- Getting a random Hit range

            hitRange=math.random(1,3) 
            if(hitRange == 1) then
                    hitRangeMin = 0
                    hitRangeMax = 30
            elseif (hitRange == 2) then
                    hitRangeMin = 31
                    hitRangeMax = 60
            elseif (hitRange==3) then
                    hitRangeMin = 61
                    hitRangeMax = 100
            else
              print("hit range else")
            end

        -- Confirm if hit or miss

        print("below is hitRange")
        print(hitRange)

        print("below is hitChance")
        print(hitChance)



        print("below is hitRangeMin")
        print(hitRangeMin)

        print("below is hitRangeMax")
        print(hitRangeMax)
            if(hitChance >= hitRangeMin and hitChance <=hitRangeMax) then
                health = health - damage
                --below decides whose health should be deducted by damage
                if(id == "player")then
                    player.health = health
                    if (player.health == 0)then
                        local Died = display.newText("Game over", 610, 420, native.systemFont, 135)
                        Died:setFillColor(1, 0, 0)
                    end
                    if (Bar.xScale < 0.11)then
                        -- do nothing, this code is here to stop crashing as if scaler cant be brought to zero
                    else
                        Bar.xScale = Bar.xScale -0.09
                    end

                else
                    enemy.health = health
                    if (enemy.health == 0)then
                        local died = display.newText("Game over", 610, 420, native.systemFont, 135)
                        died:setFillColor(1, 0, 0)
                    end
                    if (enemy_health_Bar.xScale < 0.11)then
                        -- do nothing, this code is here to stop crashing as if scaler cant be brought to zero
                    else
                        enemy_health_Bar.xScale = enemy_health_Bar.xScale -0.009
                    end
                end
                
                print(id)
                print(health)
                print("hit ")
            else
                print("missed")

            end
        turn_decider = turn_decider + 1
    else
        print("Game over for now")

    end
    end


    -- Create attack button
    local button1 = widget.newButton(
        { labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },

            left = 500,
            top = 650,
            fontSize = 50,
            id = "button1",
            label = "Attack",
            onEvent = AttackTurn
        }
    )





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
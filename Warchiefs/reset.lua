local player = require("playerData")
local enemy1 = require("TestData2")
local enemy2 = require("TestData3")
local enemy3 = require("TestData4")

player.name = ""
player.clan = ""
player.gender = ""
player.id = "player"
player.strength = 6
player.charisma = 10
player.agility = 8
player.dexterity = 8
player.spirit = 5
player.attributePoints = 10
player.gold = 10000
player.largehealthPotions = 2
player.smallhealthPotions = 2
player.x = 30
player.y = 30
player.location = ""
player.health = 300 --default
player.damage = 5 * player.strength
player.level = 1
player.evade = 3
player.ownsRyansTown = false
player.ownsCity2 = false
player.ownsCity3 = false

player.totalHealth = 300

player.disableHealth = false

enemy1.health = 1000
enemy2.health = 1000
enemy3.health = 1000

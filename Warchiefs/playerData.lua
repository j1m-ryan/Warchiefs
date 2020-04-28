local player = {}

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
player.health = 100 --default
player.damage = 10 + (player.strength/10 + player.dexterity/10)
player.level = 1
player.evade = 3
player.ownsRyansTown = false
player.ownsCity2 = false
player.ownsCity3 = false

player.totalHealth = 100

player.disableHealth = false
return player

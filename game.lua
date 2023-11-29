-- load character module
Character = require("character")

-- create a new hero
gwen = Character:new("gwen")
gwen.strength = 10

-- create a new enemy
orc = Character:new("orc")

-- run game logic
gwen:attack(orc)
orc:attack(gwen)
gwen:attack(orc)

-- save to file
function save(level, health, lives)
    file = io.open("save.lua", "w")

    file:write("return { \n")
    file:write("\tlevel = ", level, ",", "\n")
    file:write("\thealth = ", health, ",", "\n")
    file:write("\tlives = ", lives, ",", "\n")
    file:write("}")

    file:close()
end

save(20, 10, 2)

-- reading from the file
gameData = dofile("save.lua")
print("Loaded: ")
print("\tlevel: " .. gameData.level) --etc

save(30, 30, 25)
gameData = dofile("save.lua")
print("Loaded: ")
print("\tlevel: " .. gameData.level)

-- the global table

-- explicit vars
-- five21 = 521

-- for i = 1, 1000 do
--     if i == five21 then
--         five2l = "Five Twenty One"
--         break
--     end
-- end

-- print(five21)

-- _G.declared = {}
-- setmetatable(_G, _G)

-- _G.Declare = function(k, v)
--     _G.declared[k] = true
-- end

-- _G.__index = function(t, k)
--     if not _G.declared[k] then
--         print("Can't read undeclared variable: " .. k)
--         return nil
--     end
--     return rawget(t, k)
-- end

-- _G.__newindex = function(t, k, v)
--     if not _G.declared[k] then
--         print("Cannot write undeclared var: " .. k)
--     else
--         rawset(t, k, v)
--     end
-- end

-- -- declare then use
-- Declare("x")
-- x = 20

-- -- not declared, will print the error
-- z = 30

-- local w = 19 -- local to the file (not the gloabl table), can be assigned

-- print(x)
-- print(w)

-- math

-- trig
-- math.acos(v): returns the inverse cosine of a number in radians
-- math.asin(v): returns the inverse sine of a number in radians
-- math.atan(v): returns the inverse tangent of a number in radians; v is assumed to be x / y
-- math.atan(x, y): returns the inverse tangent of a number in radians
-- math.cos(v): returns the cosine of a number in radians
-- math.sin(v): returns the sine of a number in radians
-- math.tan(v): returns the tangent of a number in radians

-- changing numbers
-- math.deg(v) converts a number from radians to degrees
-- math.rad(v) converts a number from degrees to radians
-- math.abs(v) returns the absolute value of the provided number
-- math.tointeger(v): if v is convertible to an integer, an integer is returned, otherwise nil

-- comparing numbers
-- math.max(x, y) returns the smaller number of x or y
-- math.min(x, y) returns the larger number of x or y
-- math.ult(x, y) returns true if x is less than y, where both x and y are treated as unsigned integers

-- randomness
-- math.randomseed(os.time()) -- generates a random seed

-- print(math.random())       -- between 0 and 1
-- print(math.random(20))     -- between 1 and max
-- print(math.random(1, 30))  -- between min and max

-- number = math.random(10, 100)

-- repeat
--     local guess = tonumber(io.read())

--     if guess ~= nil then
--         if guess == number then
--             print("You guessed the number.")
--             break
--         elseif guess < number then
--             print("Too low, guess again.")
--         elseif guess > number then
--             print("Too high, guess again.")
--         end
--     end
-- until false

-- constants
-- math.pi: the value of pi
-- math.huge: represents positive infinity
-- math.mininteger: represents the smallest integer (non-decimal) number
-- math.maxinteger: represents the largest integer (non-decimal) number

-- everything else
-- math.ceil(v): rounds v up to the nearest integer
-- math.floor(v): rounds v down to the nearest integer
-- math.fmod(x, y): returns the remainder of the division x / y
-- math.modf(v): returns two values, the integer part of v and the factoral part of v
-- math.sqrt(v): returns the square root of v
-- math.type(variable): returns the strings integer, float, or nil

-- File IO
-- file = io.open("text.txt", "w+")
-- print(file)

-- writing data
-- file = io.open("data.txt", "w")
-- file:write("foo\n")
-- file:write("bar")

-- function save_char_data(name, power, team)
--     file = io.open("data.txt", "w")
--     file:write("name " .. name .. "\n")
--     file:write("attack " .. power .. "\n")
--     file:write("team " .. team .. "\n")
-- end

-- save_char_data("Lloyd", 50, "Good guys")

-- reading line by line
-- f = io.open("data.txt")
-- lines = f:lines()

-- for line in lines do
--     print(line)
-- end

-- reading bits of data
-- hero = {}

-- f:read(5)            -- reads first 5 chars in line 1
-- hero.name = f:read() -- reads to end of line (starting where you left off)

-- f:read(7)
-- hero.health = f:read("*n") -- reads the next number

-- f:read(6)
-- hero.team = f:read("*l") -- same as no argument

-- print(hero.name)
-- print(hero.health)
-- print(hero.team)

-- closing file
-- f:close() -- closes the file

-- interfacing with operating system

-- working with time
-- print("Time: " .. os.clock())
-- for i = 1, 1000, 1 do
--     -- nothing
-- end
-- print("Time: " .. os.clock())

-- print("The time is: " .. os.date("%H:%M")) -- pass in format string

-- local start_time = os.time()               -- tutorial says to use os.clock(), but not working
-- for i = 1, 1000, 1 do
--     -- nothing
-- end
-- local end_time = os.time()
-- print(type(start_time))
-- print(type(end_time))

-- local total_time = os.difftime(start_time, end_time)
-- print(total_time)

-- interacting with shell
-- print(os.execute())
-- os.execute("git pull")
-- print(os.getenv("PATH"))

-- working with files
-- local file = io.open("new_file.txt", "a")
-- file:close()

-- os.rename("new_file.txt", "renamed.txt")
-- os.remove("renamed.txt")
-- os.execute("mkdir new_folder")

-- more strings
-- all string functions also work on the specific object
-- using the colon notation

-- searching for a substring
-- local sentence = "The quick brown fox"
-- local word = "quick"

-- local start = string.find(sentence, word) -- returns start index of substring
-- -- start = sentence:find(word)
-- print(start)

-- -- extracting a substring
-- start = start + #word + 1
-- local result = string.sub(sentence, start)
-- -- result = sentence:sub(start)
-- print(result)

-- case manipulation
local sentence = "A rose is a Rose is a ROSE"
print(sentence)

print(sentence:upper())
print(sentence:lower())

-- creating and loding modules

-- creating a module

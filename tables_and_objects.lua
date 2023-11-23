-- creating tables
tbl = {}
print("The type of a table is: " .. type(tbl))

-- storing values
tbl = {}
tbl["x"] = 20
i = "x"
tbl.y = 10

print(tbl["x"])
print(tbl["y"])
print(tbl[i])
print(tbl.x)
print(tbl.y)
print(tbl.z) -- assigned nil

-- table constructor
colors = {
    red = "#ff0000",
    green = "#0ff00",
    blue = "#0000ff"
}

print(colors.red)
print(colors["green"])
print(colors.blue)

colors = {
    r = "#ff0000",
    ["g"] = "#00ff00",
    [3] = "#0000ff"
}

print(colors.r)
print(colors.g)
print(colors[3])
print()

-- tables are references
a = {}
b = a -- referencers the SAME table

b.x = 10
a.y = 20
a.x = 30 -- also changes b.x

print(a.x)
print(b.x)

print(a.y)
print(b.y)

a = nil
b = nil -- nothing referencing the table, table is now eligible for garbage collection

-- arrays (begin at index 1 in Lua)
arr = {}

arr[1] = "x"
arr[2] = "y"
arr[3] = "z"

for i = 1, 3 do
    print(arr[i])
end

-- array constructor
arr = { "monday", "tuesday", "wednesday" }

for i = 1, 3 do
    print(arr[i])
end

-- sparce arrays
arr = {}

arr[1] = "x"
arr[2] = "y"
arr[5] = "z"
arr[6] = "w"

for i = 1, 6 do
    print(arr[i])
end

-- size of an array, this is considered unreliable
arr = { "a", "b", "c", "d", "e" }

length = #arr -- only counts from index 1, so if you use 0 it won't work
print("array length: " .. length)

-- #arr will consider an array over if it finds two nil values

for i = 1, #arr do
    print(arr[i])
end

-- Multidimensional arrays
num_rows = 4
num_cols = 4

values = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p' }

value = 1

matrix = {}        -- create new matrix
for i = 1, num_rows do
    matrix[i] = {} -- create a new row

    for j = 1, num_cols do
        matrix[i][j] = values[value] -- assign value to row i, column j

        value = value + 1
    end
end

print(matrix[3][4])

-- Iterating
days = { day1 = "monday", day2 = "tuesday", day3 = "wednesday" }

for i, day in pairs(days) do
    print(i)
    print(day)
end

-- understanding pairs, for tables
vector = { x = 34, y = 22, z = 56 }

for k, v in pairs(vector) do
    print("key: " .. k .. ", value: " .. v)
end

-- understanding ipairs, for arrays
days = { "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday" }

for i, v in ipairs(days) do
    print("index: " .. i .. ", value: " .. v)
end

-- closures
function NextNumber()
    -- local to the function
    local currentNumber = 0

    return function() -- anonymous function
        currentNumber = currentNumber + 1
        return currentNumber
    end
end

-- call the function, often called a "factory"
next = NextNumber()

-- can call the anonymous function here using next
print(next())
print(next())
print(next())

print(currentNumber) -- returns nil

-- iterator functions
days = { "monday", "tuesday", "wednesday", "thursday" }

function walk(array)
    local index = 0

    return function()
        index = index + 1

        return array[index]
    end
end

for day in walk(days) do
    print(day)
end

-- this doesn't work, need the interator function to return only the value
-- for day in days do
--     print(day)
-- end

-- Meta tables
meta = {}                          -- create table
meta.__add = function(left, right) -- adds meta method
    return left.value + right      -- left is assumed to be a table
end

container = {
    value = 5
}

-- result = container + 4 -- ERROR
-- print("result: " .. result)

setmetatable(container, meta)
result = container + 4
print(result)

-- setmetatable, getmetatable
x = {}
y = {}
z = {}

setmetatable(y, z)

print(getmetatable(x))
print(getmetatable(y))

-- __index
x = {
    foo = "bar"
}

y = {}

z = {
    hello = "world z",
    __index = function(table, key)
        return z[key]
    end
}

w = {
    __index = function(table, key)
        if key == "hello" then
            return "inline world"
        end
        return nil
    end
}

setmetatable(x, z)
setmetatable(y, w)

print(x.foo)
print(x.hello)

print(y.foo)
print(y.hello)

-- __newindex
x = {}

y = {}

z = {
    __index = function(table, key)
        return z[key]
    end,
    __newindex = function(table, key, value)
        z[key] = value
    end
}

setmetatable(x, z)
setmetatable(y, z)

x.foo = "bar"

print(x.foo) -- bar
print(y.foo) -- bar
print(z.foo) -- bar

-- rawget, rawset (directly set a key value pair)
x = {}

y = {}

z = {
    __index = function(table, key)
        return z[key]
    end,
    __newindex = function(table, key, value)
        z[key] = value
    end
}

setmetatable(x, z)
setmetatable(y, z)

x.foo = "bar"
rawset(x, "foo", "raw")
x.hello = 20

print(x.foo)   -- raw, lives in x
print(y.foo)   -- raw, lives in z
print(x.hello) -- 20

-- __call
tbl = {
    __call = function(table, val1, val2)
        return "Hello, from functor: " .. (val1 + val2)
    end
}

setmetatable(tbl, tbl)
message = tbl(2, 3);
print("message: " .. message)

-- operators
-- meta = {
--     __<method> = function(left, right)
--       -- Do stuff
--     end
--   }

-- __add: Addition, when writing "table + object" or "object + table"
-- __sub: Subtraction, when writing "table - object" or "object - table"
-- __mul: Multiplication, when writing "table * object" or "object * table"
-- __div: Division, when writing "table / object" or "object / table"
-- __mod: Modulo, when writing "table % object" or "object % table"
-- __pow: Involution, when writing "table ^ object" or "object ^ table"

-- classes

Enemy = {}
Enemy.health = 200
Enemy.attack = 4
Enemy.defense = 20

Enemy.new = function(self, object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

Enemy.hit = function(self, damage)
    damage = damage - self.defense

    if damage < 0 then
        damage = 0
    end

    self.health = self.health - damage
end

grunt = Enemy.new(Enemy)
miniBoss = Enemy.new(Enemy)
boss = Enemy.new(Enemy, { health = 500, defense = 100 })

miniBoss.health = 250 -- health now stored in miniboss

print("grunt health: " .. grunt.health)
print("miniBoss health: " .. miniBoss.health)
print("boss health: " .. boss.health)
print()

print("Hero attacks both boss and grunt")
Enemy.hit(grunt, 55)
Enemy.hit(boss, 50)

print("grunt health: " .. grunt.health)
print("boss health: " .. boss.health)

-- The : operator
-- these essentially allow you to call methods
-- on an object instead of it's class
-- it is syntactic sugar, but pretty awesome
Vector = {
    x = 0,
    y = 1,
    z = 0
}

Vector.new = function(self, object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

Vector.print = function(self)
    print("x:" .. self.x .. ", y:" .. self.y .. ", z:" .. self.z)
end

velocity = Vector:new() -- takes
momentum = Vector:new({ x = 20, z = 10 })

Vector.print(velocity)
Vector.print(momentum)

-- invoking like methods
-- dont have to pass in instance to the parent table to call it
-- auto passes in self
velocity:print()
momentum:print()

-- easier way to create these instances
grunt = Enemy:new()
boss = Enemy:new({ health = 500, defense = 100 })

-- easier way to invoke methods
boss:hit(50)
grunt:hit(55)


-- tables inside of objects
Character = {
    alive = true
}

Character.position = {
    x = 10, y = 20, z = 30
}

Character.new = function(self, object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

player1 = Character:new()
player2 = Character:new()

player1.position.x = 0
player2.position.y = 10

print(player1.position.x, player1.position.y)
print(player2.position.x, player2.position.y)

if player1.position == player2.position then
    print("They have the same position")
else
    print("They do not have the same position")
end

print(player1.position)
print(player2.position)

-- add the table in the constructor before the index method
Character.position = {
    x = 10, y = 20, z = 30
}

Character.new = function(self, object)
    object = object or {}

    object.position = {}
    object.position.x = Character.position.x
    object.position.y = Character.position.y
    object.position.z = Character.position.z

    setmetatable(object, self)
    self.__index = self
    return object
end

player1 = Character:new()
player2 = Character:new()

player1.position.x = 0
player2.position.y = 10

print(player1.position.x, player1.position.y)
print(player2.position.x, player2.position.y)

if player1.position == player2.position then
    print("They have the same position")
else
    print("They do not have the same position")
end

print(player1.position)
print(player2.position)

-- inheritance

-- single inheritance
Animal = {
    sound = ""
}

Animal.new = function(self, object)
    object = object or {}
    setmetatable(object, self)
    self.__index = self
    return object
end

Animal.MakeSound = function(self)
    print(self.sound)
end

-- These are going to be classes, NOT objects/instances
Dog = Animal:new()
Dog.sound = "woof"

Cat = Animal:new()
Cat.sound = "meow"
Cat.angry = false
Cat.MakeSound = function(self) -- new implementation of makesound for cats
    if self.angry then
        print("hiss")
    else
        print(self.sound)
    end
end

animals = { Cat:new(), Dog:new(), Cat:new() }
animals[1].angry = true


for i, v in pairs(animals) do
    v:MakeSound()
end

-- multiple inheritance
-- it gets messy, try not to use it!

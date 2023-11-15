foo = "bar"
print(foo)

color = "red"
print(color)
color = "blue"
print(color)
color = "green"
print(color)

-- this is a comment

print(hello) -- nil
print(foo) -- bar
foo = nil
print(foo) -- nil

-- another comment
foo = true
print("The value of foo is:")
print(foo)

result = 5 > 3
print("Is 5 greater than 3?")
print(result)

-- yet another comment

pi = 3.1415
three = math.floor(pi)
five = math.ceil(4.223)
print(pi)
print(three)
print(five)

five = 3 + 2
print(five)
print(2 + 2)
print(five + 1)

-- another one!?

var1 = true
var2 = 3.145
var3 = nil
var4 = type(var1) -- returs a string "boolean"
var5 = type(type(var2)) -- returns type string

-- and anotha one

print("Print a string literal")
message = "Print a variable"
print(message)

hello = "hello, world"
count_hash = #hello
count_func = string.len(hello)
print("The string:")
print(hello)
print("Has a length of: ")
print(count_hash)
print(count_func)
print(#"hello, world")
print(string.len("hello, world"))

-- woah woah, another one!? This is getting out of hand

name = "Mike"
color = "Blue"
print("Jill " .. "likes" .. " Red")
print("Jack dislikes " .. color)
print(name .. " likes " .. color)
print(name .. color)
message = name .. " likes " .. color -- returns a NEW string
print(message)

-- ... you know the drill

pi = 3.14
message = "The rounded value of pi is: " .. pi
print(message)
print("Nine: " .. 9)

eleven = "10" + 1
print(eleven)
print(1 + "01")

-- yeah, okay

message = "he said \"bye\" and \nleft"
print(message)

-- yep

print("Please enter your name:")
-- name = io.read()
print("hello " .. name)

-- chunk de chunk

-- file chunch
do
    -- local chunck
end

do
    -- another local chunk
end

-- chunk

foo = 7
local x = 10 -- local to the .lua file
do
    local bar = 8 -- local to the current block
    do
        local x = 9
    end
end

-- shadowing

message = "global-scope"
print(message)

do
    local message = "local-scope"
    print(message)
end

print(message)

-- functions

function PrintSomething()
    text1 = "hello"
    text2 = "world"
    print(text1 .. text2)
end

PrintSomething()

-- params

function AddAndPrint(x, y)
    local result = x + y
    print(result)
end

AddAndPrint(3, 2)
AddAndPrint(10, 15)
AddAndPrint(1, 1)

-- any number of arguments

AddAndPrint(1, 2, 3) -- prints 3
AddAndPrint(2, 50, 50, 2, 1) -- prints 52
-- AddAndPrint(1) -- error, omitted value is nil

print("h" .. tostring(nil)) -- throws an error if not converted to a string

-- returning values

function AddTwo(x)
    result = x + 2
    print( x .. " + 2 = " .. result)
    return result
end

AddTwo(3)
nine = 7 + AddTwo(5)
print(AddTwo(3))

function SquareIt(number)
    result = number * number
    print(result) -- will print
    do
        return result
    end
    print(result) -- will NOT print
end
four = SquareIt(2)
print(four)

-- returning multiple values
function SquareCube(x)
    squared = x * x
    cubed = x * x * x
    return squared, cubed
end

s, c = SquareCube(2)
print(s, c)

s, c, q = SquareCube(2) -- extra un-needed var will be assigned nil
print(s, c, q)

s = SquareCube(2) -- only first value returned, rest are discarded
print(s)

-- operators
x = -7 -- negation operator
x = 1 - 3 -- binary operator

-- arithmetic operators
x = 10 + 1 -- addition
x = 10 - 1 -- subtraction
x = 10 * 1 -- multiplication
x = 10 / 1 -- division
x = 10 % 1 -- modulus (returns remainder)
x = 10 ^ 1 -- exponent
x = -10    -- negation (only uniary one)

-- relational operators
x = 2 == 2 -- equality operator
x = 2 ~= 2 -- inequality operator
x = 2 > 3  -- greater than operator
x = 2 < 3  -- less than operator
x = 2 >= 3 -- greater or equal
x = 2 <= 3 -- less or equal

-- logical operators

-- and: if value 1 == true, return value 2, else return 1
x = true and false -- value is false
y = false and false -- value is false
z = true and true -- value is true
w = 7 and 1 -- value is 1

-- or: if value 1 ~= false, return it, else return 1
x = true or false -- value is true
y = false or false -- value is false
z = true or true -- value is true
w = 7 or 1 -- value is 1

-- and/or use shortcut evaluation

function TrueFunction()
    print("returning true")
    return true
end

function FalseFunction()
    print("returning false")
    return false
end

x = FalseFunction() and TrueFunction() -- prints false
print(x) -- value is false
x = TrueFunction() and FalseFunction() -- prints true AND false
print(x) -- value is false

-- not: reversers the state of operand
x = not true -- false
y = not true or false -- false
z = not not false -- false
w = not (7 + 1) -- false

-- misc operators
x = 3 -- assignment operator
string = "hello" .. "world" -- string concatenantion
word = #"hello world" -- length operator

-- operator precedance
-- ^
-- not # -
-- * / %
-- + -
-- ..
-- < > <= >= ~= ==
-- and
-- or

-- control structures
print("Enter your name")
name = io.read()

if #name <= 3 then
    print("That is a short name, " .. name)
elseif #name <= 6 then
    print(name .. " is an average length name")
else
    print("That's a long name, " .. name)
end

-- nested if statements
print("Enter a number")
x =  io.read()

if x == "6" then
    print("x is six!")

    print("Enter another number")
    local y = io.read()

    if y == "6" then
        print("y is also six!")
    elseif y == "5" then
        print("y is one less than x.")
    else
        print("x is 6, but y is not!")
    end
else
    print("x is not 6!" .. x)
end

-- loops: while, repeat, for

-- while
x = 10

while x > 0 do
    print("hello world")
    x = x - 1
end

-- breaking a loop
x = 0

while x < 10 do
    print ("x is " .. x)
    
    if x == 5 then
        break
    end

    x = x + 1
end

-- repeat until loop
x = 10
repeat
    print("repeat loop")
until x > 2

-- for loop
for i = 0, 10, 2 do
    print(i)
end

for i = 10, 1, -1 do
    print(i)
end

for i = 0, 10 do -- shorthand, Lua assumes step by one
    print(i)
end

-- nested loops
for i = 0, 10 do
    local j = 0
    while j < 10 do
        print(j)
        if j == 2 then
            print(j, i)
            break
        end
        j = j + 1
    end
end
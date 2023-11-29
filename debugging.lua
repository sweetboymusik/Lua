-- debugger.lua library
local debugger = require("debugger")

-- introspective information
function one()
    print("one")
end

function two()
    print("two")
end

function three()
    print("three")

    debug.getinfo(1) -- will inspect this function
end

-- local variables
function debug_locals()
    local info = debug.getinfo(2, "n")
    print("Local variables of: " .. info.name)

    local idx = 1
    while true do -- prints all local vars until nil returned
        local name, val = debug.getlocal(2, idx)
        if name == nil then
            break
        end

        print(" " .. name .. " = " .. tostring(val))
        idx = idx + 1
    end
end

function do_something(val1, val2)
    local sum = val1 + val2
    local diff = val1 - val2
    local result = sum * diff

    debug_locals();
    return result;
end

do_something(3, 4)
do_something(9, 3)

-- debug.sethook line
function vector_length(x, y, z)
    local dot = x * x + y * y + z * z
    if dot == 0 then
        return nil
    end

    return math.sqrt(dot)
end

function trace(event, line)
    print("event: " .. event)
    print("     executing: line " .. line)
end

debug.sethook(trace, "l")

local x = 3
local y = 5
local z = 1
local len = vector_length(x, y, z)
print("length: " .. len)

-- call "c"
function print_v(x, y, x)
    local out = "(" .. x .. ","
    out = out .. ", " .. y
    out = out .. ", " .. z .. ")"

    return out
end

function magnitude_sq(x, y, z)
    local mag_sq = x * x + y * y + z * z
    return mag_sq
end

function trace2(event)
    local info = debug.getinfo(2)

    if info.what == "Lua" then
        print("event: " .. event)
        print("  function: " .. info.name)
        print("  defined on: " .. info.linedefined)
    end
end

debug.sethook(trace2, "c")

local m_sq = magnitude_sq(9, 2, 6)
print("sqr mag: " .. m_sq)
print_v(9, 2, 6)

-- return "r"
function Normalize(x, y, z)
    local dot = x * x + y * y + z * z
    if dot == 0 then
        return nil
    end

    local len = math.sqrt(dot)
    return {
        x = x / len,
        y = y / len,
        z = z / len
    }
end

function trace3(event)
    local info = debug.getinfo(2)
    if info.what == "Lua" then
        print("event: " .. event)
        print("  function: " .. info.name)
        print("  defined on: " .. info.linedefined)
    end
end

debug.sethook(trace3, "r")

local norm = Normalize(9, 2, 6)

-- setting a counter
debug.sethook(trace3, "r", 1)

-- multiple hooks

function trace4(event, line)
    local info = debug.getinfo(2)
    if info.what == "Lua" then
        print("event: " .. event)
        print("  function: " .. info.name)
        print("  defined on: " .. info.linedefined)
        if line ~= nil then
            print("   called from:" .. line)
        end
    end
end

debug.sethook(trace4, "r c r", 1)

-- traceback
print(debug.traceback())

-- using debugger.lua
function buggy_addition_function(x1, x2)
    local sum = x1 * x2
    debugger()
    return sum
end

local add = buggy_addition_function(2, 3)
print(add)

-- error handling in lua
-- pcall and error

function Normalize2(x, y, z)
    local dot = x * x + y * y + z * z
    if dot == 0 then
        error("Can't normalize zero vector")
    end

    local len = math.sqrt(dot)
    return x / len, y / len, z / len
end

local ok, x, y, z = pcall(Normalize2, 0, 0, 0)
if not ok then
    print("Error occured normalizing vector.")
    print("Error message: " .. x)
else
    print("Vector normalized.")
end

-- assert
-- function Normalize3(x, y, z)
--     local dot = x * x + y * y + z * z
--     assert(dot ~= 0, "Can't normalize zero vector")
--     local len = math.sqrt(dot)
--     return x / len, y / len, z / len
-- end

-- local x, y, z = Normalize3(0, 0, 0)
-- print("normalized vector")

-- using the profile module
profiler = require("profiler")
profiler.start()

function Normalize4(x, y, z)
    local dot = x * x + y * y + z * z
    assert(dot ~= 0, "Can't normalize zero vector")
    local len = math.sqrt(dot)
    return x / len, y / len, z / len
end

local x, y, z = Normalize4(7, 8, 9)
print("normalized vector")
local x, y, z = Normalize4(6, 7, 4)
print("normalized vector")
local x, y, z = Normalize4(2, 9, 5)
print("normalized vector")

profiler.stop()
profiler.dump()
print(profiler.names[0])

-- environment
function SayHelloCustomEnv()
    local _ENV = { print = print }

    foo = "hello"
    local bar = "world"

    print(foo .. " " .. bar)
end

function SayHelloDefaultEnv()
    foo = "hello"
    local bar = "world"

    print(foo .. " " .. bar)
end

-- foo and bar are not in _G
SayHelloCustomEnv()
print(foo)
print(bar)

SayHelloDefaultEnv()
print(foo)
print(bar)

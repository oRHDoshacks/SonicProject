md5 = require('md5')
wordlist = require('LerWordlists')
text = {}


local a = md5.sumhexa("Clover")
local c = '89372f3d9321ae09c94488592084da29'

print("Digite a senha:")
local senha = io.read()

local b = md5.sumhexa(senha)


if a == b then
    print("Senha A B correta!")
else
    print("Senha A B incorreta!")
end
if a==c then
    print("Senha A C correta!")
else
    print("Senha A C incorreta!")
end

io.read()
os.execute("cls")
print("BrutForce\nQual valor maximo de caracteres da senha?")
local maximo = tonumber(io.read())
print("valor minimo de senha")
local minimo = tonumber(io.read())
for i = 1, maximo do
    text[i] = 0
end
for i = 1,minimo do
    text[i]=47
end


local function increment_text(text)
    local carry = 1
    for i = 1, #text do
        text[i] = text[i] + carry
        if text[i] > 126 then
            text[i] = 1
            carry = 1
        else
            carry = 0
        end
    end
end

local function text_to_string(text)
    local str = ""
    for i = 1, #text do
        str = str .. string.char(text[i])
    end
    return str
end


local cust = 0
while true do
   -- os.execute("cls")

    local guess = md5.sumhexa(text_to_string(text))

    if guess == a then
        print("Encontrado: " .. guess .." == "..text_to_string(text))
        io.read()
    else
        print("Tentativa " .. cust .. ": " .. guess .. " : ".. text_to_string(text))
        increment_text(text)
    end
	if text[maximo] > 126 then
		return
	end

    cust = cust + 1
end

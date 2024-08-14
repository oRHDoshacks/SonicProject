md5 = require('md5')
wordlist = require('LerWordlists')
text = {}
local conexao = require('sqlconect')
local servidor='127.0.0.1'
local dbs="passsword"
local usuario="root"
local senha=""
local desen=conexao.abrir(servidor,dbs,usuario,senha)


print("BrutForce Gerador")
print("Qual valor de caracteres na senha?")
local minimo = tonumber(io.read())
local maximo=minimo
for i = 1,minimo do
    text[i]=48
end


local function increment_text(text)
    local carry = 1
    for i = 1, #text do
        if text[i]<48 then
            text[i]=48
        else
            text[i] = text[i] + carry
        end
        if text[i] > 126 then
            text[i] = 48
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
    local guess = md5.sumhexa(text_to_string(text))
		query = string.format("INSERT INTO `passsword`.`md5` (`Senha`, `MD5Cript`,`Tag`) VALUES ('%s','%s','%s')", text_to_string(text), guess,"pass"..maximo)
        desen:execute(query)
        print("Tentativa " .. cust .. ": " .. guess .. " : ".. text_to_string(text))
        increment_text(text)

	if text[maximo] > 125 then
		conexao.fechar(desen,desen)
		return
	end
    cust = cust + 1
end

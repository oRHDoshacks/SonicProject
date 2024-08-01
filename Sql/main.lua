local conexao = require('sqlconect')
local servidor='127.0.0.1'
local dbs="clientes"
local usuario="root"
local senha="Senha"
local desen=conexao.abrir(servidor,dbs,usuario,senha)


print(desen)
conexao.fechar(desen,desen)
print(desen)

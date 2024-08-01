local conexao = require('sqlconect')
servidor='127.0.0.1'
dbs="clientes"
usuario="root"
senha="Senha"
desen=conexao.abrir(server,dbs,usuario,senha)


print(desen)
conexao.fechar(desen,desen)
print(desen)

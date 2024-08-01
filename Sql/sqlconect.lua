local mysql = require "luasql.mysql" --biblioteca MySql
local sqlconect={}

function sqlconect.abrir(server,dbs,usuario,senha)
    local env = assert(luasql.mysql())
    local con = assert(env:connect(dbs, usuario, senha, server))
    return con
end

function sqlconect.fechar(con,env)
    con:close()
    env:close()
end
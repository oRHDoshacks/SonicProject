local socket = require("socket")


local client = assert(socket.tcp())

client:connect("localhost", 8085)
print("Conectado ao servidor.")

while true do
   
    io.write("Digite sua mensagem (ou 'sair' para desconectar): ")
    local message = io.read()
    
    if message == "altf4" then
        break 
    end

    
    client:send(message .. "\n")
    
    local response, err = client:receive()
    if not err then
        print("Resposta do servidor: " .. response)
    else
        print("Erro ao receber: " .. err)
        break
    end
end

-- Fecha a conexão
client:close()
print("Desconectado do servidor.")

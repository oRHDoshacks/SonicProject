local socket = require("socket")

-- Variável compartilhada
local sharedData = {}

local function handleClient(client)
    client:settimeout(10)
    while true do
        local line, err = client:receive()
        if not err then
            print("Recebido do cliente: " .. line)
            sharedData[#sharedData + 1] = line  -- Armazena a mensagem recebida
            client:send("Você disse: " .. line .. "\n")
        else
            print("Erro ou desconexão: " .. err)
            break
        end
    end
    client:close()
end

-- Função para processar mensagens recebidas
local function processMessages()
    while true do
        if #sharedData > 0 then
            local message = table.remove(sharedData, 1)
            print("Processando mensagem: " .. message)
        end
        coroutine.yield()  -- Pausa a corrotina para permitir que outras sejam executadas
    end
end

-- Cria corrotinas
local coClient = coroutine.create(function() handleClient(client) end)
local coProcessor = coroutine.create(processMessages)

-- Loop do servidor
while true do
    -- A cada iteração, executa as corrotinas
    coroutine.resume(coProcessor)
    coroutine.resume(coClient)
    
    -- Adiciona uma pausa para evitar uso excessivo da CPU
    socket.sleep(0.1)
end

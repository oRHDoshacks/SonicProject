
local leitura = {}
function leitura:ver()
    local linhas = {}
    local arquivo = assert(io.open(tostring(io.read(print('Digite o nome do arquivo'))), "r"))


    for linha in arquivo:lines() do
        for valor in linha:gmatch("[^,]+") do
            table.insert(linhas, valor)
        end
    end
    arquivo:close()

    return linhas
end



--[[for _, linha in ipairs(tabela) do
    for _, valor in ipairs(linha) do
        io.write(valor, "--")
    end
    io.write("\n")
end]]


return leitura

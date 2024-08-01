local socket = require("socket")
local scans= assert(socket.tcp())

function fullscan(server,port,port2)
    for i=port,port2 do
        if scans:connect(server, i) then
            print(i .. " foi")
            scans:close()
        else
            print(i.. " nao foi")
            scans:close()
        end
    end
end



print("Coloque o ip do servidor")
ipserve=io.read()
print("coloque a porta inicial")
port0=tonumber(io.read())
print("coloque a porta final")
port1=tonumber(io.read())
os.execute("cls")
if port1<=65535 and port1>=port0 then
    fullscan(ipserve,port0,port1)
end

io.read()
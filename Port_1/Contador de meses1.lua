local mes={"jan","fev","mar","abr","mai","jun","jul","ago","set","out","nov","dez"}

print("coloque a quantidade de messes")
local mesesat=tonumber(io.read())
os.execute("cls")

print("Coloque o ano atual")
local anoat=tonumber(io.read())

os.execute("cls")
print("coloque o valor numerico do mes atual\nEx:Maio=5,Dezembro=12")
local mesat=tonumber(io.read())

os.execute("cls")
print("Valores de confirma��o\nMeses = "..mesesat.."\nAno de inicio = ".. anoat .. "\nMes de inicio = ".. mesat)
local cofr=io.read()

for i=1,mesesat do
	if mesat<12 then
		mesat=mesat+1
	elseif mesat==12 then
		mesat=1
		anoat=anoat+1
	end
end

print("Valores finais\nAno="..anoat.."\nmes="..mes[mesat])

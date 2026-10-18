program ej5;
const
  MaxClientes = 5;
type
  TV = array[1..MaxClientes] of word;
  TM = array[1..MaxClientes,1..4] of real;
procedure Inicializar(var Compras:TM);
var
  i,j:byte;
begin
  for i:=1 to MaxClientes do
      for j:=1 to 4 do
          Compras[i,j]:=0;
end;
function IndiceCli(NroCli:TV;nro:word):byte;
var
  i:byte;
begin
  i:=1;
  while (i<MaxClientes)and(NroCli[i]<>nro) do
    i:=i+1;
  if NroCli[i]=nro then
    IndiceCli:=i
  else
    IndiceCli:=0;
end;
procedure LeerDatos(var NroCli:TV;var Compras:TM;var N:byte);
var
  arch:text;
  cliente:word;
  monto:real;
  tCompra,indice:byte;
begin
  N:=0;
  assign(arch,'ej5.txt'); reset(arch);
  while not eof(arch) do
    begin
      readln(arch,cliente,tCompra,monto);
      indice:=IndiceCli(nroCli,cliente);
      if indice=0 then
        begin
          n:=n+1;
          Compras[n,tcompra]:=monto;
          NroCli[n]:=cliente;
        end
      else
        begin
          Compras[indice,tcompra]:=Compras[indice,tcompra]+monto;
        end;
    end;
  close(arch);
end;
function ImporteTot(Compras:TM;N,Rubro:byte):real;
var
  i:byte;
  aux:real;
begin
  aux:=0;
  for i:=1 to N do
      aux:=aux+compras[i,rubro];
  importeTot:=aux;
end;
procedure B(NroCli:TV;Compras:TM;N:byte);
var
  i:byte;
begin
  writeln('Listado de clientes en los cuales el monto en Supermercado supero al de Indumentaria');
  for i:=1 to N do
      begin
        if compras[i,1]>compras[i,3] then
          writeln('Cliente numero ',nrocli[i]);
      end;
end;
procedure C(NroCli:TV;Compras:TM;N:byte);
var
  i,j:byte;
  tot:real;
begin
  for i:=1 to N do
    begin
      tot:=0;
      for j:=1 to 4 do
        tot:=compras[i,j]+tot;
      writeln('El importe promedio del cliente numero ',NroCli[i],' es: ',tot/4:6:2);
    end;
end;
function masGasto(nroCli:TV;Compras:TM;N:byte):word;
var
  i,j,max:byte;
  maxTot,tot:real;
begin
  max:=1; maxTot:=Compras[1,1]+Compras[1,2]+Compras[1,3]+Compras[1,4];
  for i:=2 to N do
    begin
      tot:=0;
      for j:=1 to 4 do
        tot:=tot+compras[i,j];
      if tot>maxTot then
        begin
          max:=i;
          maxTot:=tot;
        end;
    end;
  masGasto:=nroCli[max];
end;
Function E(compras:TM;N:byte):byte;
var
  i,j,aux:byte;
  cuenta:boolean;
begin
  aux:=0;
  for i:=1 to N do
    begin
      cuenta:=false;
      for j:=1 to 4 do
         if compras[i,j]=0 then
           cuenta:=true;
      if cuenta then
        aux:=aux+1;
    end;
  E:=aux;
end;
var
  Compras:TM;
  NroCli:TV;
  N,i:byte;
begin
  inicializar(compras);
  LeerDatos(nrocli,compras,n);
  writeln('Importe total del rubro Supermercado: ',Importetot(compras,n,1):6:2);
  writeln('Importe total del rubro Combustible: ',Importetot(compras,n,2):6:2);
  writeln('Importe total del rubro Indumentaria: ',Importetot(compras,n,3):6:2);
  writeln('Importe total del rubro Otros: ',Importetot(compras,n,4):6:2);
  writeln;
  B(nrocli,compras,n);
  writeln;
  C(nrocli,compras,n);
  writeln;
  writeln('El cliente que mas gasto fue el cliente numero: ',masGasto(nrocli,compras,n));
  writeln;
  writeln(E(compras,n),' clientes no registraron compras en algun rubro');
  readln();
end.



program alquileres;
const
  pasillos = 5;
type
  TAW = array[1..pasillos] of  word;
  TAR = array[1..pasillos] of real;
  TAB = array[1..pasillos] of byte;
procedure Inicializar(var ADias:TAW;var Aimp:TAR;var cantc,cantV:TAB);
var
  i:byte;
begin
for i:=1 to pasillos do
    begin
    Adias[i]:=0;
    Aimp[i]:=0;
    cantc[i]:=0;
    cantv[i]:=0;
    end;
end;
function imp(precio:real;dias:byte;tcliente:char):real;
var
  importe:real;
begin
importe:=precio*dias;
if dias=120 then
   importe:=importe*0.7
else
  if dias>60 then
     importe:=importe*0.85
  else
    if dias>30 then
       importe:=importe*0.9;
case tCliente of
     'P':importe:=importe*0.9;
     'V':importe:=importe*0.8;
end;
imp:=importe;
end;
procedure Alquileres(var Adias:TAW;var Aimp:TAR;var cantc,cantv:TAB;var precio:real);
var
  pasillo,dias:byte;
  carpa:word;
  tcliente:char;
  arch:text;
begin
  Assign(arch,'Alquileres.txt'); Reset(arch);
  readln(arch,precio);
  while not eof(arch) do
     begin
       readln(arch,carpa,dias,tcliente,tcliente);
       pasillo:=carpa div 100;
       Adias[pasillo]:=Adias[pasillo]+dias;
       aimp[pasillo]:=aimp[pasillo]+imp(precio,dias,tcliente);
       cantc[pasillo]:=cantc[pasillo]+1;
       if tcliente='V' then
          cantv[pasillo]:=cantv[pasillo]+1;
     end;
  close(arch);
end;
procedure vips(cantc,cantv:TAB;var pvip:tar);
var
  i:byte;
begin
  for i:=1 to pasillos do
      if cantc[i]>0 then
        pvip[i]:=cantV[i]/cantc[i]*100;
end;
function A(adias:TAW;Aimp:TAR):byte;
var
  i,indice:byte;
  unico:boolean;
begin
  unico:=true; indice:=1;
  for i:=2 to pasillos do
      begin
        if Adias[i]=adias[indice] then
           unico:=false;
        if adias[i]<adias[indice] then
           begin
             unico:=true;
             indice:=i;
           end;
      end;
  if not unico then
     begin
       indice:=1;
       for i:=2 to pasillos do
           if Aimp[i]<=Aimp[indice] then
              indice:=i;
     end;
  A:=indice;
end;
Procedure B(adias:TAW;Aimp:TAR;pvip:tar;x:real);
var
  i:byte;
begin
  for i:=1 to pasillos do
      if pvip[i]>x then
         writeln('El pasillo ',i,' recaudo un promedio de ',aimp[i]/adias[i]:8:2,' por dia')
      else
        writeln('El pasillo ',i,' no supera el promedio de vips ingresado');
end;
function c(pvip:TAR):byte;
var
  i:byte;
begin
  i:=1;
  while (i<pasillos)and(pvip[i]<=30) do
     i:=i+1;
  if pvip[i]>30 then
     c:=i
  else
    c:=0;
end;
var
  x,precio:real;
  adias:TAW;
  Aimp,Pvip:TAR;
  cantc,cantv:TAB;
begin
  inicializar(adias,aimp,cantc,cantv);
  alquileres(adias,aimp,cantc,cantv,precio);
  vips(cantc,cantv,pvip);
  writeln('Inciso A:',A(Adias,Aimp));
  writeln('Ingrese X para el inciso B: '); readln(x);
  B(Adias,aimp,pvip,x);
  if c(pvip)>0 then
     writeln('Inciso C:',c(pvip))
  else
    writeln('Ningun pasillo cumple con el 30% de clientes vip');
  readln();
end.


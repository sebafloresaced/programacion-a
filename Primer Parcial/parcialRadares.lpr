program parcialRadares;
const
  max = 20;
  motos = 1000;
  autos = 2000;
  camiones = 5000;
type
  st3 = string[3];
  st7 = string[7];
  TAS3 = array[1..max] of st3;
  TAS7 = array[1..max] of st7;
  TAR = array[1..max] of real;
  TAB = array[1..max] of byte;
procedure LeerFactores(var zonas:TAS3;var factores:TAR;var k:byte);
var
  fact:real;
  zona:st3;
  arch:text;
begin
  k:=0; Assign(Arch,'Zonas.txt'); Reset(arch);
  while not eof(arch) do
  begin
    readln(arch,zona,fact);
    k:=k+1;
    zonas[k]:=zona; factores[k]:=fact;
  end;
  close(arch);
end;
function InicializarCant(cantMultas:TAB;k:byte):TAB;
var
  i:byte;
begin
  for i:=1 to k do
      cantMultas[i]:=0;
end;
function InicializarMax(MaxMultas:TAR;k:byte):TAR;
var
  i:byte;
begin
  for i:=1 to k do
      MaxMultas[i]:=0;
end;
function BuscarZona(zonas:TAS3;k:byte;zona:st3):byte;
var
  i:byte;
begin
  i:=1;
  while (Zonas[i]<>zona)and(i<k) do
    i:=i+1;
  if zonas[i]=zona then
     BuscarZona:=i
  else
    BuscarZona:=0;
end;
procedure Radar(var cantmultas:TAB;var MaxMulta:TAR; var MaxPatente:TAS7; Zonas:TAS3;Factores:TAR;var ContNo:byte;k:byte);
var
  arch:text;
  aux,tipo:char;
  indice,KmxH:byte;
  zona:st3;
  patente:st7;
  multa:real;
begin
  Assign(arch,'Radar.txt'); Reset(arch); contNo:=0;
  while not eof(arch) do
  begin
    multa:=0;
    readln(arch,tipo,kmxh,aux,zona,aux,patente);
    indice:=BuscarZona(Zonas,k,zona);
    cantMultas[indice]:= cantMultas[indice]+1;
    case tipo of
    '1': if kmxh>100 then
            multa:=motos*factores[indice]
         else
           contNo:=contNo+1;
    '2': if kmxh>110 then
            multa:=autos*factores[indice]
         else
           contNo:=ContNo+1;
    '3': if kmxh>90 then
            multa:=camiones*factores[indice]
         else
            contNo:=contNo+1;
    end;
    if multa>MaxMulta[indice] then
       begin
         MaxMulta[indice] := multa;
         MaxPatente[indice]  := patente;
       end;
  end;
  close(arch);
end;
var
  Zonas:TAS3;
  Factores,MaxMulta:TAR;
  MaxPatente:TAS7;
  ContMultas:TAB;
  i,contNo,k:byte;
  zona:st3;
begin
  LeerFactores(Zonas,factores,k);
  contMultas:=InicializarCant(contmultas,k);
  maxMulta:=InicializarMax(maxMulta,k);
  Radar(contmultas,maxmulta,maxpatente,zonas,factores,contno,k);
  writeln(Contno,' no corresponden a infracciones');
  for i:=1 to k do
      writeln('Para zona:',zonas[i],', Patente:',maxpatente[i]);
  writeln('Ingrese una zona'); readln(zona);
  i:=BuscarZona(zonas,k,zona);
  if i>0 then
     writeln('Para zona:',Zonas[i],', cantidad de multas:',contmultas[i]);
  readln();
end.


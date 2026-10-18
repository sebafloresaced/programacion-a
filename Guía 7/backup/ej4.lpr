program ej4;
const
  maxEquipos = 20;
  maxPartidos = 20;
type
  TVC = array[1..maxPartidos] of char;
  TR = record
    nombre:string;
    cantP:byte;
    resultados:TVC;
    puntaje:byte;
  end;
  TVE = array[1..maxEquipos] of TR;
procedure LeerDatos(var Equipos:TVE;var N:byte);
var
  arch:text;
  Club:string[10];
  Partidos,i:byte;
  resultado,aux:char;
begin
  n:=0; assign(arch,'ej4.txt'); reset(arch);
  while not eof(arch) do
    begin
       n:=n+1;
       readln(arch,club);
       readln(arch,partidos);
       equipos[n].nombre:=club;
       equipos[n].cantP:=partidos;
       for i:=1 to partidos do
           begin
              read(arch,resultado,aux);
              equipos[n].resultados[i]:=resultado;
           end;
       readln(arch);
    end;
  close(arch);
end;
procedure CalcPuntajes(var Equipos:TVE; n:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
      equipos[i].puntaje:=0;
  for i:=1 to N do
      for j:=1 to equipos[i].cantP do
        case equipos[i].resultados[j] of
          'G': equipos[i].puntaje:=equipos[i].puntaje+3;
          'E': equipos[i].puntaje:=equipos[i].puntaje+1;
        end;
end;
procedure A(equipos:tve;n:byte);
var
  i:byte;
begin
  for i:=1 to N do
    writeln(equipos[i].nombre,': ', equipos[i].puntaje,' puntos');
end;
function MaxPuntaje(equipos:tve;n:byte):byte;
var
  i,max:byte;
begin
  max:=equipos[1].puntaje;
  for i:=2 to N do
    if equipos[i].puntaje>max then
      max:=equipos[i].puntaje;
  maxpuntaje:=max;
end;
procedure B(equipos:tve;n:byte);
var
  i,maxPuntos:byte;
begin
  maxPuntos:=maxPuntaje(equipos,n);
  writeln('Puntero/s:');
  for i:=1 to N do
    if equipos[i].puntaje = maxPuntos then
      writeln(equipos[i].nombre);
end;
function C(equipos:tve;n:byte):real;
var
  i,j,cont:byte;
  cumple:boolean;
begin
  cont:=0;
  for i:=1 to N do
    begin
       cumple:=true;
       j:=1;
       while (j<n)and(equipos[i].resultados[j]<>'P') do
         j:=j+1;
       if equipos[i].resultados[j]='P' then
         cumple:=false;
       if cumple then
         cont:=cont+1;
    end;
  C:=cont/n;
end;
var
  equipos:tve;
  n:byte;
begin
  leerDatos(equipos,n);
  calcPuntajes(equipos,n);
  A(equipos,n);
  writeln;
  B(equipos,n);
  writeln;
  writeln('Un ',C(equipos,n)*100, '% de los clubes no perdieron ningun partido');
  readln;
end.


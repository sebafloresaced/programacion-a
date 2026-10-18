program ej7;
type
  TM = array[1..10,1..10] of byte;
procedure LeerDatos(var Suben,Bajan:TM;var N,M:byte);
var
  arch:text;
  Parada,Linea,Ascienden,Descienden:byte;
begin
  n:=0; m:=0;
  assign(arch,'ej7.txt'); reset(Arch);
  while not eof(arch) do
    begin
      readln(arch,parada,linea,ascienden,descienden);
      if n<parada then
         n:=parada;
      if m<linea then
         m:=linea;
      Suben[parada,linea]:=ascienden;
      Bajan[parada,linea]:=descienden;
    end;
  close(arch);
end;
function A(bajan:TM;N,M:byte):byte;
var
  i,j,mayor:byte;
  cant,mayorcant:word;
begin
  Mayorcant:=0;
  for j:=1 to M do
      Mayorcant:=Mayorcant+bajan[1,j];
  mayor:=1;
  for i:=2 to N do
      begin
        cant:=0;
        for j:=1 to M do
            cant:=cant+bajan[i,j];
        if mayorCant<cant then
           begin
             mayorCant:=cant; mayor:=i;
           end;
      end;
  A:=mayor;
end;
function B(suben:TM;N,M:byte):byte;
var
  i,j,menor:byte;
  cant,menorCant:word;
begin
  menorcant:=0;
  for i:=1 to N do
      menorCant:=menorcant+suben[i,1];
  menor:=1;
  for j:=2 to M do
      begin
        cant:=0;
        for i:=1 to N do
            cant:=cant+suben[i,j];
        if menorcant>cant then
           begin
             menorcant:=cant; menor:=i;
           end;
      end;
  B:=menor;
end;
function C(subieron,bajaron:TM;N,M:byte):byte;
var
  i,j,aux:byte;
  totSubieron,totBajaron:word;
begin
  aux:=0;
  for i:=1 to N do
    begin
      totSubieron:=0; totBajaron:=0;
      for j:=1 to M do
        begin
          totSubieron:=totSubieron+Subieron[i,j];
          totBajaron:=totBajaron+Bajaron[i,j];
        end;
      if totSubieron<totBajaron*0.4 then
         aux:=aux+1;
    end;
  C:=aux;
end;
function D(subieron,bajaron:tm;n,m:byte):byte;
var
  i,j,aux:byte;
  cumple:boolean;
begin
  aux:=0;
  for j:=1 to M do
    begin
      cumple:=false;
      for i:=1 to N do
        if (subieron[i,j]=0)or(bajaron[i,j]=0) then
           cumple:=true;
      if cumple then
         aux:=aux+1;
    end;
  D:=aux;
end;
var
  subieron,bajaron:TM;
  n,m:byte;
begin
  leerDatos(subieron,bajaron,n,m);
  writeln('Parada con mayor cant de pasajeros que bajaron: ',A(bajaron,n,m));
  writeln('Linea con menor cant de pasajeros que subieron: ',B(subieron,n,m));
  writeln('En ',C(subieron,bajaron,n,m),' paradas el total de personas que subieron fue menor al 40% de las que bajaron');
  writeln(D(subieron,bajaron,n,m),' lineas no registraron subida o bajada de pasajeros en alguna parada');
  readln();
end.


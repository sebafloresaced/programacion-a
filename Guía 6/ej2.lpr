program ej2;
const
  MaxAlumnos = 5;
  MaxNotas = 5;
  NotaAprobar = 5;
type
  TM = array[1..MaxNotas,1..MaxAlumnos] of byte;
  TV = array[1..MaxAlumnos] of string;
procedure LeerDatos(var Notas:TM;var Nbre:TV;var Alumnos,K:byte);
var
  arch:text;
  car:char;
  nota:byte;
begin
  alumnos:=0; k:=0;
  assign(arch,'ej2.txt'); reset(arch);
  while not eof(arch) do
    begin
      alumnos:=alumnos+1; k:=0;
      read(arch,car);
      Nbre[alumnos]:=car;
      while car<>' ' do
        begin
          read(arch,car);
          Nbre[alumnos]:=Nbre[alumnos]+car;
        end;
      while not eoln(arch) do
        begin
          read(arch,nota);
          k:=k+1;
          Notas[k,alumnos]:=nota;
        end;
      readln(arch);
    end;
  close(arch);
end;
procedure Aprobados(Notas:TM;Nbre:TV;Alumnos,k:byte);
var
  i,j:byte;
  aprobado:boolean;
begin
  writeln('Listado de alumnos que aprobaron todos los parciales:');
  for i:=1 to alumnos do
    begin
      aprobado:=true;
      for j:=1 to k do
        if notas[j,i]<NotaAprobar then
           aprobado:=false;
      if aprobado then
         writeln(Nbre[i]);
    end;
end;
function Situacion(Notas:TM;Alumno,k:byte):string;
var
  i,acum:byte;
begin
  acum:=0;
  for i:=1 to k do
    acum:=acum+notas[i,alumno];
  if acum/k>=7 then
     situacion:='Promociona'
  else
    if (acum/k>=5)and(notas[i,k]>=5) then
       situacion:='Habilita'
    else
      situacion:='Desaprobado';
end;
procedure Promocionados(var Prom:TV;var P:byte;Notas:TM;Nbre:TV;Alumnos,k:byte);
var
  i:byte;
begin
  p:=0;
  for i:=1 to Alumnos do
    begin
      if situacion(notas,i,k)='Promociona' then
         begin
           p:=p+1; prom[p]:=Nbre[i];
         end;
    end;
  writeln('Lista de promocionados:');
  for i:=1 to p do
    writeln(prom[i]);
end;
var
  Prom,Nbre:TV;
  Notas:TM;
  Alumnos,p,k:byte;
begin
  leerdatos(notas,nbre,alumnos,k);
  aprobados(notas,nbre,alumnos,k);
  writeln;
  promocionados(prom,p,notas,nbre,alumnos,k);
  readln();
end.


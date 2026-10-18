program p2025;
type
  Treg1 = record
    Materia:string[20];
    nota:real;
  end;
  TM = array[1..10,1..10] of Treg1;
  Treg2 = record
    Cuatrimestre:byte;
    promedio:real;
  end;
  TV = array[1..10] of Treg2;
function Aprobar2NotaT(Mat:TM;A,M:byte;T:real):boolean;
var
  cont,i,j:byte;
begin
  cont:=0;
  for i:=2*A - 1 to 2*a do
      for j:=1 to M do
        begin
          if Mat[i,j].nota>T then
             cont:=cont+1;
          if cont>=2 then
             Aprobar2NotaT:=true;
        end;
  Aprobar2NotaT:=false;
end;
function AproboMasMitad(Mat:TM;C,M:byte;NotaAprobar:real):boolean;
var
  i,cont:byte;
begin
  cont:=0;
  for i:=1 to M do
    if Mat[C,i].nota>=NotaAprobar then
       cont:=cont+1;
    if cont>= (M+1) div 2 then
       AproboMasMitad:=true;
  AproboMasMitad:=false;
end;
function PromedioCuatri(Mat:TM;C,M:byte):real;
var
  i:byte;
  acum:real;
begin
  acum:=0;
  for i:=1 to M do
    acum:= acum + Mat[C,i].nota;
  PromedioCuatri:=acum/M;
end;
procedure PromCuat(Mat:tm;N,M:byte;NotaAprobar:real;var PromCuatris:TV; var N2:byte);
var
  i:byte;
begin
  n2:=0;
  for i:=1 to N do
      if AproboMasMitad(mat,i,m,notaAprobar) then
      begin
         N:=N+1;
         PromCuatris[n].cuatrimestre:=i;
         PromCuatris[n].promedio:=PromedioCuatri(mat,i,m);
      end;
end;
procedure MostrarArray(PromCuatris:TV;N2:byte);
var
  i:byte;
begin
  for i:=1 to N2 do
    write(PromCuatris[i].promedio:6:2);
end;
function AprobadasAnual(Mat:tm;anio,M:byte;NotaAprobar:real):byte;
var
  i,j,cont:byte;
begin
  cont:=0;
  for i:=2*anio - 1 to 2*anio do
    for j:=1 to M do
          if Mat[i,j].nota>NotaAprobar then
             cont:=cont+1;
  AprobadasAnual:=cont;
end;
function PromedioAnual(Mat:tm;anio,M:byte):real;
var
  i,j,cont:byte;
  total:real;
begin
  cont:=0; total:=0;
  for i:=2*anio - 1 to 2*anio do
    for j:=1 to M do
      begin
        cont:=cont+1;
        total:=total+1;
      end;
  PromedioAnual:=total/cont;
end;
function MejorAnio(Mat:tm;N,M:byte;NotaAprobar:real):byte;
var
  anio,mejor,aprobadas,mejorAprobadas:byte;
  prom,mejorProm:real;
begin
  mejor:=1; mejorAprobadas:=AprobadasAnual(mat,mejor,m,notaAprobar); mejorProm:=PromedioAnual(mat,mejor,m);
  for anio:=2 to (N+1) div 2 do
    begin
      aprobadas:=AprobadasAnual(mat,anio,m,notaAprobar);
      if aprobadas>mejorAprobadas then
      begin
           mejor:=anio;
           mejorAprobadas:=aprobadas;
           mejorprom:=PromedioAnual(mat,anio,m);
      end
      else
          if aprobadas = mejorAprobadas then
             begin
               prom:=promedioAnual(mat,anio,m);
               if prom>mejorProm then
                 begin
                 mejor:=anio;
                 mejorAprobadas:=aprobadas;
                 mejorprom:=prom;
                 end
               else
                 if prom=mejorProm then
                    if anio>mejor then
                       begin
                         mejor:=anio;
                         mejorAprobadas:=aprobadas;
                         mejorprom:=prom;
                       end;
             end;
    end;
  MejorAnio:=mejor;
end;

begin

end.


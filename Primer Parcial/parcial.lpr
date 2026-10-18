program parcial;
type
  TA= array[1..100] of real;
procedure GuardarRinde(var A:TA;var IndiceA:byte;has,totTons:real);
  begin
     indiceA:=indiceA+1;
     A[indiceA]:=has/totTons;
  end;
procedure AnalizarRinde(A:TA;IndiceA:byte);
  var
    i:byte;
    x:real;
    todosCumplen:boolean;
  begin
     writeln('Ingrese el rinde a analizar'); readln(x);
     todosCumplen:=true;
     for i:=1 to IndiceA do
         if A[i]<x then
            todosCumplen:=false;
     if todosCumplen=true then
        writeln('Todos superan el rinde ingresado')
     else
        writeln('No todos superan el rinde ingresado');
  end;
var
  DNI:string[8];
  parcelas,indiceA,contUnicoTipo,i:byte;
  tipoCereal:char;
  has,tons,totHas,acumT,acumA,acumC:real;
  tipoT,tipoA,tipoC:boolean;
  Rinde:TA;
begin
  indiceA:=0; contUnicoTipo:=0;
  writeln('Ingresa el DNI'); readln(DNI);
  while dni<>'999' do
    begin
      tothas:=0; acumT:=0; acumA:=0; acumC:=0; tipoT:=false; tipoA:=false; tipoC:=false;
      writeln('Ingresa la cantidad de parcelas que desea informar'); readln(parcelas);
      for i:=1 to parcelas do
          begin
            writeln('Ingrese el total de hectareas sembradas en la parcela ',i); readln(has);
            if has>0 then
               begin
                 repeat
                    writeln('Ingrese el tipo de cereal (A,C,T)'); readln(tipoCereal); tipoCereal:=upcase(tipoCereal);
                 until tipoCereal in ['A','C','T'];
                 writeln('Ingrese el total de toneladas cosechadas'); readln(tons);
                 totHas:=totHas+has;
                 case tipoCereal of
                   'A': begin
                          AcumA:=AcumA+tons;
                          tipoA:=true;
                        end;
                   'C': begin
                          AcumC:=AcumC+tons;
                          tipoC:=true;
                        end;
                   'T': begin
                          AcumT:=AcumT+tons;
                          tipoT:=true;
                        end;
                 end;
               end;
          end;
      if (tipoA=true)and(tipoC=true)and(tipoT=true) then
         guardarRinde(Rinde,IndiceA,has,AcumA+AcumC+AcumT);
      if ((tipoA=true)and(tipoC=false)and(tipoT=false))or((tipoA=false)and(tipoC=true)and(tipoT=false))or((tipoA=false)and(tipoC=false)and(tipoT=true)) then
         contUnicoTipo:=contUnicoTipo+1;
      writeln();
      writeln('Ingresa el DNI'); readln(DNI);
    end;
  writeln('La cantidad de productores que solo cosecharon un tipo de cereal es: ',contUnicoTipo);
  AnalizarRinde(Rinde,IndiceA);
  readln();
end.


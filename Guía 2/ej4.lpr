program ej4;
var
  mes1,mes2,anio1,anio2,dia1,dia2,antigua: byte;
begin
  writeln('Ingresa el dia, mes y anio de la primer fecha');
  readln(dia1,mes1,anio1);
  writeln('Ingresa el dia, mes y anio de la segunda fecha');
  readln(dia2,mes2,anio2);
  if anio1<anio2 then
     antigua:=1
  else
      if anio1>anio2 then
         antigua:=2
      else
          if mes1<mes2 then
             antigua:=1
          else
              if mes1>mes2 then
                 antigua:=2
              else
                  if dia1<dia2 then
                     antigua:=1
                  else
                      if dia1>dia2 then
                         antigua:=2
                      else
                          writeln('Las dos fechas son iguales');
  case antigua of
       1: Begin
               writeln('La primer fecha es mas antigua');
               case mes1 of
                    1..3: writeln('El mes pertenece al primer trimestre');
                    4..6: writeln('El mes pertenece al segundo trimestre');
                    7..9: writeln('El mes pertenece al tercer trimestre');
                    10..12: writeln('El mes pertenece al cuarto trimestre');
               End;
          end;
       2: Begin
               writeln('La segunda fecha es mas antigua');
               case mes2 of
                    1..3: writeln('El mes pertenece al primer trimestre');
                    4..6: writeln('El mes pertenece al segundo trimestre');
                    7..9: writeln('El mes pertenece al tercer trimestre');
                    10..12: writeln('El mes pertenece al cuarto trimestre');
               End;
          end;
  end;
  readln(mes1);
end.


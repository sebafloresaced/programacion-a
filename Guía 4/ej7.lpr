program ej7;
function Impuesto(monto:real;rInscripto:char):real;
  begin
   if rInscripto='S' then
      Impuesto:=monto*0.21
   else
      Impuesto:=monto*0.21+monto*0.79*0.1;
  end;
var
  Nombre,minNombre:string;
  rInscripto,Repetir:char;
  meses,i:byte;
  totalIVA,total,monto,minFacturado:real;
begin
  repeat
    totalIva:=0; total:=0; minFacturado:=10000000;
    writeln('Ingrese el nombre del comercio'); readln(nombre);
    writeln('Es Responsable Inscripto?');
    repeat
      readln(rInscripto); rInscripto:=upcase(rInscripto);
    until (rInscripto='S') or (rInscripto='N');
    writeln('Ingrese la cantidad de meses'); readln(meses);
    for i:=1 to meses do
      begin
        writeln('Ingrese el monto facturado en el mes ', i, ' sin contar IVA');
        repeat
          readln(monto);
        until monto>0;
        total:=total+monto;
        totalIva:= totalIva+Impuesto(monto,rInscripto);
        if (rInscripto='S') and (totalIva<minFacturado) then
           begin
             minFacturado:=totalIva;
             minNombre:=Nombre;
           end;
      end;
    writeln();
    writeln('Nombre: ',Nombre); writeln('Responsable Inscripto: ',rInscripto); writeln('Total pagado de IVA: ',totalIva:6:2);
    writeln(); writeln('Queres ingresar otro comercio?'); writeln(); readln(repetir);
  until repetir='N';
  writeln(); writeln('El comercio Responsable Inscripto que menos facturo fue: ',minNombre);
  readln();
end.


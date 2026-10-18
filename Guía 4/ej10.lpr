program ej10;
function simetria(a,b:real):real;
  begin
   simetria:= -b/2*a;
  end;
function discriminante(a,b,c:real):real;
  begin
   discriminante:=b*b-4*a*c;
  end;
procedure raices(a,b,c:real;var x1,x2:real);
  begin
    x1:=(-b+sqrt(discriminante(a,b,c)))/2*a;
    x2:=(-b-sqrt(discriminante(a,b,c)))/2*a;
  end;
var
   a,b,c,x1,x2,ejeSim,x:real;
   R:char;
begin
   writeln('Ingrese los coeficientes a,b y c, de la funcion y = ax^2 + bx + c');
   read(a); read(b); readln(c);
   if a=0 then
      writeln('El coeficiente "a" no puede ser 0')
   else
       begin
         ejeSim:=simetria(a,b);
         writeln('El eje de simetria esta en x=',ejeSim:4:1);
         if a>0 then
            begin
              writeln('Se presenta un minimo en el eje de simetria');
              writeln('La parabola se abre hacia arriba');
            end
         else
             begin
              writeln('Se presenta un maximo en el eje de simetria');
              writeln('La parabola se abre hacia abajo');
             end;
         if discriminante(a,b,c)<0 then
            writeln('El discriminante es menor a cero, por lo tanto, no existen raices reales')
         else
             begin
               raices(a,b,c,x1,x2);
               if discriminante(a,b,c)=0 then
                 begin
                  writeln('El discriminante es cero, por lo tanto, existe una raiz real');
                  writeln('La raiz es x=',x1:4:1);
                 end
               else
                 begin
                  writeln('El discriminante es mayor a cero, por lo tanto, existen dos raices reales');
                  raices(a,b,c,x1,x2);
                  writeln('Las raices son x=',x1:4:1,' y x=',x2:4:1);
                 end;
             end;
         writeln('Queres saber la imagen de un punto de x? (S/N)');
         readln(r); r:=upcase(r);
         while r='S' do
           begin
            writeln('Ingrese un valor de x'); readln(x);
            writeln('La imagen en x=',x:4:1,' es ',a*sqr(x)+b*x+c:4:1);
            writeln('Queres saber la imagen de otro punto de x? (S/N)');
            readln(r); r:=upcase(r);
           end;
       end;
   readln(x);
end.


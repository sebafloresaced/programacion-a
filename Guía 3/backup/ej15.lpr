program ej15;
var
  Arch:text;
  car1,car2,N:char;
  cont:integer;
begin
   Assign(Arch,'ej15.txt'); Reset(Arch);
   cont:=0;
   writeln('Ingrese un caracter');
   Readln(N); N:= Upcase(N);
   car1:= ' ';
   while car1<>'.' do
         begin
           read(Arch,car2); car2:= Upcase(car2);
           if (car1=' ') and (car2=N) then
              cont:= cont+1;
           car1:=car2;
         end;
   close(arch);
   writeln('El total de palabras que empiezan con la letra ', N, ' es ', cont);
   read(n);
end.


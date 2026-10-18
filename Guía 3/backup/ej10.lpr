program ej10;
var
  Arch:text;
  num1,num2:byte;
  cont:integer;
begin
   assign(Arch,'ej10.txt'); reset(arch);
   cont:=1;
   read(arch,num1);
   while not eof(Arch) do
      begin
        read(arch,num2);
        if num1=num2 then
           cont:= cont+1
        else
            begin
              writeln('La frecuencia del numero ',num1,' es ',cont);
              cont:=1;
            end;
        num1:=num2;
      end;
   close(arch);
   writeln('La frecuencia del numero ',num1,' es ',cont);
   read(num1);
end.


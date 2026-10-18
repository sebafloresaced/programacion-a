program ej20;
var
  arch:text;
  total, num, contnum:shortint;
  primerIntervalo:boolean;
begin
  assign(arch,'ej20.txt'); reset(arch);
  primerIntervalo:=false; total:=0; contnum:=0;
  while not eof(arch) do
    begin
       read(arch,num); contnum:= contnum + 1;
       if num<0 then
         primerIntervalo:=true;
       if primerIntervalo then
         if num>=0 then
         begin
         while num>0 do
           begin
           total:=total+num;
           read(arch,num); contnum:= contnum + 1;
           end;
         write(total/contnum:4:2, ' ');
         end
    end;
  close(arch);
  readln;
end.

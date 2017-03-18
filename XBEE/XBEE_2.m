%ABRIR el puerto COM6 SerXbee
delete(instrfind({'Port'},{'COM5'})); %ajustar puerto serie

clc; disp('BEGIN')
SerXbee = serial('COM5');
set(SerXbee,'BaudRate',9600);
set(SerXbee,'DataBits',8);
set(SerXbee,'Parity','none');
set(SerXbee,'StopBits',1);
set(SerXbee,'FlowControl','none');
fopen(SerXbee);
%*-*-*-*-*-*-

a=zeros()
while(1)
    

fwrite(SerXbee,'S','char');
fwrite(SerXbee,40,'uint8');
fwrite(SerXbee,41,'uint8');
fwrite(SerXbee,42,'uint8');
fwrite(SerXbee,43,'uint8');
fwrite(SerXbee,44,'uint8');
fwrite(SerXbee,45,'uint8');
fwrite(SerXbee,46,'uint8');
fwrite(SerXbee,47,'uint8');
fwrite(SerXbee,48,'uint8');


a = fread(SerXbee,9,'uint8');

x1=a(1);
x2=a(2);
x3=a(3);
x4=a(4);
x5=a(5);
x6=a(6);
x7=a(7);
x8=a(8);
x9=a(9);

disp('x1');
disp(x1);
disp('x2');
disp(x2);
disp('x3');
disp(x3);
disp('x4');
disp(x4);
disp('x5');
disp(x5);
disp('x6');
disp(x6);
disp('x7');
disp(x7);
disp('x8');
disp(x8);
disp('x9');
disp(x9);


pause(0.05);

end

fclose(SerXbee);
delete(SerXbee)
clear SerXbee
disp('STOP')
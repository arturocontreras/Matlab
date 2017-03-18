%ABRIR el puerto COM6 SerXbee
delete(instrfind({'Port'},{'COM14'})); %ajustar puerto serie

clc; disp('BEGIN')
SerXbee = serial('COM14');
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

a = fread(SerXbee,1,'uint8');

x1=a(1);

disp(x1);

pause(0.05);

end

fclose(SerXbee);
delete(SerXbee)
clear SerXbee
disp('STOP')
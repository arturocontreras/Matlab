%Create Serial Port Object
s = serial('COM4','BaudRate',9600);
fopen(s)
fprintf(s,'Embedded Laboratory Serial Communication Tutorial');
while(1)
    msg = fgetl(s);    %get data from serial port
    disp(msg)  
    fprintf(s,msg)    
end
fclose(s)
delete(s)
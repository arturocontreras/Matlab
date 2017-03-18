
delete(instrfind({'Port'},{'COM2'})); %ajustar puerto serie!


SerPIC = serial('COM7');
set(SerPIC,'BaudRate',2400);
set(SerPIC,'DataBits',8);
set(SerPIC,'Parity','none');
set(SerPIC,'StopBits',1);
set(SerPIC,'FlowControl','none');

fopen(SerPIC);

fprintf(SerPIC,'%s',['#0P' int2str(1500) 'T' int2str(2000) 13]);

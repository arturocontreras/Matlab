function varargout = interfaz(varargin)
% INTERFAZ M-file for interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on INTERFAZ's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: INTERFAZ, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz

% Last Modified by INTERFAZ v2.5 24-Nov-2012 21:03:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interfaz is made visible.
function interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz (see VARARGIN)

% Choose default command line output for interfaz

background = imread('brazo1.jpg'); %Leer imagen
axes(handles.brazo);              %Carga la imagen en background

axis off;
imshow(background); 

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function q1a_Callback(hObject, eventdata, handles)

% hObject    handle to q1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q1a as text
%        str2double(get(hObject,'String')) returns contents of q1a as a double


% --- Executes during object creation, after setting all properties.
function q1a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q2a_Callback(hObject, eventdata, handles)
% hObject    handle to q2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q2a as text
%        str2double(get(hObject,'String')) returns contents of q2a as a double


% --- Executes during object creation, after setting all properties.
function q2a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3a_Callback(hObject, eventdata, handles)
% hObject    handle to q3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3a as text
%        str2double(get(hObject,'String')) returns contents of q3a as a double


% --- Executes during object creation, after setting all properties.
function q3a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q4a_Callback(hObject, eventdata, handles)
% hObject    handle to q4a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q4a as text
%        str2double(get(hObject,'String')) returns contents of q4a as a double


% --- Executes during object creation, after setting all properties.
function q4a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q4a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q5a_Callback(hObject, eventdata, handles)
% hObject    handle to q5a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q5a as text
%        str2double(get(hObject,'String')) returns contents of q5a as a double


% --- Executes during object creation, after setting all properties.
function q5a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q5a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q1t_Callback(hObject, eventdata, handles)
% hObject    handle to q1t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q1t as text
%        str2double(get(hObject,'String')) returns contents of q1t as a double


% --- Executes during object creation, after setting all properties.
function q1t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q2t_Callback(hObject, eventdata, handles)
% hObject    handle to q2t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q2t as text
%        str2double(get(hObject,'String')) returns contents of q2t as a double


% --- Executes during object creation, after setting all properties.
function q2t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3t_Callback(hObject, eventdata, handles)
% hObject    handle to q3t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3t as text
%        str2double(get(hObject,'String')) returns contents of q3t as a double


% --- Executes during object creation, after setting all properties.
function q3t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q4t_Callback(hObject, eventdata, handles)
% hObject    handle to q4t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q4t as text
%        str2double(get(hObject,'String')) returns contents of q4t as a double


% --- Executes during object creation, after setting all properties.
function q4t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q4t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q5t_Callback(hObject, eventdata, handles)
% hObject    handle to q5t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q5t as text
%        str2double(get(hObject,'String')) returns contents of q5t as a double


% --- Executes during object creation, after setting all properties.
function q5t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q5t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sq1_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==2

v=get(handles.sq1,'value');
p1=1500+1000*v;
%fprintf(SerPIC,'%s',['#0P' int2str(p1) 'T' int2str(100) 13]);%con 100ms

set(handles.mostrar1,'string',int2str(90*v));

fprintf(SerPIC,'%s',['#0P' int2str(p1) 'T' 2000 13]);

end
% hObject    handle to sq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sq1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sq2_Callback(hObject, eventdata, handles)
fun =get(handles.MODO,'Value');

if fun==2

v=get(handles.sq2,'value');
p2a=1500+1000*v;
p2b=3000-p2a;
set(handles.mostrar2,'string',int2str(90*v));

fprintf(SerPIC,'%s',['#1P' int2str(p2a) 'T' 2000 13]);

fprintf(SerPIC,'%s',['#2P' int2str(p2b) 'T' 2000 13]);

end
%fprintf(SerPIC,'%s',['#1P' int2str(p2a) 'T' int2str(100) 13]);%con 100ms
%fprintf(SerPIC,'%s',['#2P' int2str(p2b) 'T' int2str(100) 13]);%con 100ms
% hObject    handle to sq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sq3_Callback(hObject, eventdata, handles)
fun =get(handles.MODO,'Value');

if fun==2

v=get(handles.sq3,'value');
p3=1500+1000*v;
set(handles.mostrar3,'string',int2str(90*v));

fprintf(SerPIC,'%s',['#3P' int2str(p3) 'T' 2000 13]);

end
%fprintf(SerPIC,'%s',['#3P' int2str(p3) 'T' int2str(100) 13]);%con 100ms
% hObject    handle to sq3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sq3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sq4_Callback(hObject, eventdata, handles)
fun =get(handles.MODO,'Value');

if fun==2

v=get(handles.sq4,'value');
p4=1500+1000*v;
set(handles.mostrar4,'string',int2str(90*v));

fprintf(SerPIC,'%s',['#4P' int2str(p4) 'T' 2000 13]);

end
%fprintf(SerPIC,'%s',['#4P' int2str(p4) 'T' int2str(100) 13]);%con 100ms
% hObject    handle to sq4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sq4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sq5_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==2

v=get(handles.sq5,'value');
p5=1500+1000*v;
set(handles.mostrar5,'string',int2str(90*v));

fprintf(SerPIC,'%s',['#5P' int2str(p5) 'T' 2000 13]);

end
%fprintf(SerPIC,'%s',['#0P' int2str(p5) 'T' int2str(100) 13]);%con 100ms

% hObject    handle to sq5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sq5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sq5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in MODO.
function MODO_Callback(hObject, eventdata, handles)


     
% hObject    handle to MODO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MODO contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MODO


% --- Executes during object creation, after setting all properties.
function MODO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MODO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==3

time=get(handles.tiempo,'string');

pxf= eval(get(handles.xf,'string'));

pyf= eval(get(handles.yf,'string'));

pzf= eval(get(handles.zf,'string'));

%Pf=[35;12;10];
%Q=;

Pf=[pxf;pyf;pzf];
L1=8;
L2=20;
L3=12;
L4=10;
Q=[0.1;0.3;0.4;0.8]%en radianes
q1=Q(1,1);
q2=Q(2,1);
q3=Q(3,1);
q4=Q(4,1);

Px=(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*cos(q1);
Py=(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*sin(q1);
Pz=L1+L2*sin(q2)+L3*sin(q2+q3)+L4*sin(q2+q3+q4);

P=[Px;Py;Pz]

a=-(L2*sin(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*sin(q1);
b=-L2*cos(q1)*sin(q2)-L3*cos(q1)*sin(q2+q3)-L4*cos(q1)*sin(q2+q3+q4);
c=-L3*cos(q1)*sin(q1+q3)-L4*cos(q1)*sin(q2+q3+q4);
d=-L4*cos(q1)*sin(q2+q3+q4);

e=(L2*sin(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*cos(q1);
f=-L2*sin(q1)*sin(q2)-L3*sin(q1)*sin(q2+q3)-L4*sin(q1)*sin(q2+q3+q4);
g=-L3*sin(q1)*sin(q1+q3)-L4*sin(q1)*sin(q2+q3+q4);
h=-L4*sin(q1)*sin(q2+q3+q4);

i=0;
j=L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4);
k=L3*cos(q2+q3)+L4*cos(q2+q3+q4);
l=L4*cos(q2+q3+q4);


J=[a b c d;e f g h;i j k l]

%matriz para la pseudoinversa

M=J'*J

Qf=Q+inv(M)*J'*(Pf-P)

Qfsexag=Qf*180/pi

%%%%%%%%%%%%%%%%%%%%%%%5

%GRAFICAR
%puntos de cada union de eslabones para poder graficar los vectores 

q1=Qf(1,1);
q2=Qf(2,1);
q3=Qf(3,1);
q4=Qf(4,1);

P0=[0,0,0];
P1=[0,0,L1];
P2=[L2*cos(q2)*cos(q1),L2*cos(q2)*sin(q1),L1+L2*sin(q2)];
P3=[(L2*cos(q2)+L3*cos(q2+q3))*cos(q1),(L2*cos(q2)+L3*cos(q2+q3))*sin(q1),L1+L2+sin(q2)+L3*sin(q2+q3)];
P4=[(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*cos(q1),(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*sin(q1),L1+L2*sin(q2)+L3*sin(q2+q3)+L4*sin(q2+q3+q4)]

x1=P0(1):0.01:P1(1);
y1=P0(2):0.01:P1(2);
z1=P0(3):0.01:P1(3);

x2=P1(1):(P2(1)-P1(1))/10:P2(1);
y2=P1(2):(P2(2)-P1(2))/10:P2(2);
z2=P1(3):(P2(3)-P1(3))/10:P2(3);

x3=P2(1):(P3(1)-P2(1))/10:P3(1);
y3=P2(2):(P3(2)-P2(2))/10:P3(2);
z3=P2(3):(P3(3)-P2(3))/10:P3(3);

x4=P3(1):(P4(1)-P3(1))/10:P4(1);
y4=P3(2):(P4(2)-P3(2))/10:P4(2);
z4=P3(3):(P4(3)-P3(3))/10:P4(3);

figure(1)

hold on

plot3(x1,y1,z1,'d')
plot3(x2,y2,z2,'g')
plot3(x3,y3,z3,'b')
plot3(x4,y4,z4,'m')

hold off
grid on

axes(handles.axes2);

hold on

plot3(x1,y1,z1,'d')
plot3(x2,y2,z2,'g')
plot3(x3,y3,z3,'b')
plot3(x4,y4,z4,'m')

hold off
grid on

%envio de angulos por serial

Qfs=(180/pi)*Qf;%convirtiendo a sexagesimal

Tetha=[1 0 0 0;0 -1 0 0;0 0 -1 0;0 0 0 1]*Qfs+[90;180;31.5;135];%convirtiendo a angulo del servo

P=Tetha*(100/9)+500*[1;1;1;1];%convirtiendo a ancho de pulso

p1=P(1,1);
p2a=P(2,1);
p2b=3000-p2a;
p3=P(3,1);
p4=P(4,1);
%p5=1500;

fprintf(SerPIC,'%s',['#0P' int2str(p1) 'T' time 13]);

fprintf(SerPIC,'%s',['#1P' int2str(p2a) 'T' time 13]);
fprintf(SerPIC,'%s',['#2P' int2str(p2b) 'T' time 13]);

fprintf(SerPIC,'%s',['#3P' int2str(p3) 'T' time 13]);

fprintf(SerPIC,'%s',['#4P' int2str(p4) 'T' time 13]);

%fprintf(SerPIC,'%s',['#5P' int2str(p5) 'T' t5 13]);


end



% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

%handles.sq1=0.5;

p1=1500;
fprintf(SerPIC,'%s',['#0P' int2str(p1) 'T' t1 13]);

%

p2a=1000;%servo derecho
p2b=2000;%servo 
fprintf(SerPIC,'%s',['#1P' int2str(p2a) 'T' t2 13]);
fprintf(SerPIC,'%s',['#2P' int2str(p2b) 'T' t2 13]);

%

p3=1200;
fprintf(SerPIC,'%s',['#3P' int2str(p3) 'T' t3 13]);

%

p4=2000;
fprintf(SerPIC,'%s',['#4P' int2str(p4) 'T' t4 13]);
%

p5=1500;
fprintf(SerPIC,'%s',['#5P' int2str(p5) 'T' t5 13]);




% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in PUERTO.
function PUERTO_Callback(hObject, eventdata, handles)


% hObject    handle to PUERTO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PUERTO contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PUERTO


% --- Executes during object creation, after setting all properties.
function PUERTO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PUERTO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==1

q1= eval(get(handles.q1a,'string')); % solo cintura
t1= eval(get(handles.q1t,'string')); % tiempo
p1=500+100*q1/9;
fprintf(SerPIC,'%s',['#0P' int2str(p1) 'T' t1 13]);

%
q2= eval(get(handles.q2a,'string')); % solo  hombro
t2= eval(get(handles.q2t,'string')); % tiempo
p2a=500+100*q2/9;%servo derecho
p2b=3000-p2a;%servo derecho
fprintf(SerPIC,'%s',['#1P' int2str(p2a) 'T' t2 13]);
fprintf(SerPIC,'%s',['#2P' int2str(p2b) 'T' t2 13]);

%

q3= eval(get(handles.q3a,'string')); % solo codo
t3= eval(get(handles.q3t,'string')); % tiempo
p3=500+100*q3/9;
fprintf(SerPIC,'%s',['#3P' int2str(p3) 'T' t3 13]);

%

q4= eval(get(handles.q4a,'string')); % solo muñeca
t4= eval(get(handles.q4t,'string')); % tiempo
p4=500+100*q4/9;
fprintf(SerPIC,'%s',['#4P' int2str(p4) 'T' t4 13]);
%

q5= eval(get(handles.q5a,'string')); % solo gripper
t5= eval(get(handles.q5t,'string')); % tiempo
p5=500+100*q5/9;
fprintf(SerPIC,'%s',['#5P' int2str(p5) 'T' t5 13]);

end

%%%set(handles.pantalla,'string',suma);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

vel =get(handles.BAUDIOS,'Value');
puerto=get(handles.PUERTO,'Value');

delete(instrfind({'Port'},{'COM1'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM2'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM3'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM4'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM5'})); %ajustar puerto serie!

if puerto==1

SerPIC = serial('COM1');

 switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 
end

if puerto==2

SerPIC = serial('COM2');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 

end

if puerto==3

SerPIC = serial('COM3');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 

end

if puerto==4

SerPIC = serial('COM4');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
end 
end

if puerto==5

SerPIC = serial('COM5');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
end 
end

set(SerPIC,'DataBits',8);
set(SerPIC,'Parity','none');
set(SerPIC,'StopBits',1);
set(SerPIC,'FlowControl','none');

fopen(SerPIC);



fun =get(handles.MODO,'Value');

if fun==4

 a=1700;
 
 fprintf(SerPIC,'%s',['#0P' int2str(500) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#3P' int2str(1500) 'T' int2str(1500) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(2000) 'T' int2str(1000) 13]);
 fprintf(SerPIC,'%s',['#5P' int2str(1000) 'T' int2str(1000) 13]);
 
 b=2050;
 pause(5);
 
 fprintf(SerPIC,'%s',['#0P' int2str(2000) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(b) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-b) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#3P' int2str(1500) 'T' int2str(3000) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(1500) 'T' int2str(1000) 13]);
 
 pause(3);
 fprintf(SerPIC,'%s',['#5P' int2str(1600) 'T' int2str(3000) 13]);
 
 pause(5);
 
 a=1500;
 fprintf(SerPIC,'%s',['#0P' int2str(500) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#3P' int2str(1700) 'T' int2str(3000) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(2000) 'T' int2str(1000) 13]);
 
 pause(3);
 fprintf(SerPIC,'%s',['#5P' int2str(1400) 'T' int2str(3000) 13]);
  
pause(5);
 
 a=1500;
 
 fprintf(SerPIC,'%s',['#0P' int2str(500) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#3P' int2str(1700) 'T' int2str(3000) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(2000) 'T' int2str(1000) 13]);
 
 pause(3);
 fprintf(SerPIC,'%s',['#5P' int2str(700) 'T' int2str(3000) 13]);


end    
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)


vel =get(handles.BAUDIOS,'Value');
puerto=get(handles.PUERTO,'Value');

delete(instrfind({'Port'},{'COM1'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM2'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM3'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM4'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM5'})); %ajustar puerto serie!

if puerto==1

SerPIC = serial('COM1');

 switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 
end

if puerto==2

SerPIC = serial('COM2');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 

end

if puerto==3

SerPIC = serial('COM3');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 

end

if puerto==4

SerPIC = serial('COM4');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
end 
end

if puerto==5

SerPIC = serial('COM5');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
end 
end

set(SerPIC,'DataBits',8);
set(SerPIC,'Parity','none');
set(SerPIC,'StopBits',1);
set(SerPIC,'FlowControl','none');

fopen(SerPIC);



fun =get(handles.MODO,'Value');

if fun==4

 a=1500;
 
 fprintf(SerPIC,'%s',['#0P' int2str(500) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#3P' int2str(1500) 'T' int2str(1500) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(500) 'T' int2str(1000) 13]);
 fprintf(SerPIC,'%s',['#5P' int2str(1500) 'T' int2str(1000) 13]);
 
 b=2000;
 pause(5);
 
 fprintf(SerPIC,'%s',['#0P' int2str(2000) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(b) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-b) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#3P' int2str(1700) 'T' int2str(3000) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(1000) 'T' int2str(1000) 13]);
 pause(3);
 fprintf(SerPIC,'%s',['#5P' int2str(1500) 'T' int2str(3000) 13]);
 
 pause(5);
 
 a=1100;
 fprintf(SerPIC,'%s',['#0P' int2str(1500) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#1P' int2str(a) 'T' int2str(2000) 13]);
 fprintf(SerPIC,'%s',['#2P' int2str(3000-a) 'T' int2str(2000) 13]);
 
 
 fprintf(SerPIC,'%s',['#3P' int2str(2000) 'T' int2str(3000) 13]);
 fprintf(SerPIC,'%s',['#4P' int2str(500) 'T' int2str(1000) 13]);
 pause(3);
 fprintf(SerPIC,'%s',['#5P' int2str(1800) 'T' int2str(3000) 13]);

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


function xf_Callback(hObject, eventdata, handles)
% hObject    handle to xf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xf as text
%        str2double(get(hObject,'String')) returns contents of xf as a double


% --- Executes during object creation, after setting all properties.
function xf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiempo_Callback(hObject, eventdata, handles)
% hObject    handle to tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempo as text
%        str2double(get(hObject,'String')) returns contents of tiempo as a double


% --- Executes during object creation, after setting all properties.
function tiempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yf_Callback(hObject, eventdata, handles)
% hObject    handle to yf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yf as text
%        str2double(get(hObject,'String')) returns contents of yf as a double


% --- Executes during object creation, after setting all properties.
function yf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zf_Callback(hObject, eventdata, handles)
% hObject    handle to zf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zf as text
%        str2double(get(hObject,'String')) returns contents of zf as a double


% --- Executes during object creation, after setting all properties.
function zf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in BAUDIOS.
function BAUDIOS_Callback(hObject, eventdata, handles)

% hObject    handle to BAUDIOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns BAUDIOS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from BAUDIOS


% --- Executes during object creation, after setting all properties.
function BAUDIOS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BAUDIOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

vel =get(handles.BAUDIOS,'Value');
puerto=get(handles.PUERTO,'Value');

delete(instrfind({'Port'},{'COM1'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM2'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM3'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM4'})); %ajustar puerto serie!
delete(instrfind({'Port'},{'COM5'})); %ajustar puerto serie!

if puerto==1

SerPIC = serial('COM1');

 switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 
end

if puerto==2

SerPIC = serial('COM2');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 

end

if puerto==3

SerPIC = serial('COM3');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
 end 

end

if puerto==4

SerPIC = serial('COM4');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
end 
end

if puerto==5

SerPIC = serial('COM5');
switch vel
    case 1 
        set(SerPIC,'BaudRate',2400);
               
    case 2
        set(SerPIC,'BaudRate',9600);
        
    case 3 
        set(SerPIC,'BaudRate',38400);
        
    case 4
        set(SerPIC,'BaudRate',115200);
        
end 
end

set(SerPIC,'DataBits',8);
set(SerPIC,'Parity','none');
set(SerPIC,'StopBits',1);
set(SerPIC,'FlowControl','none');

fopen(SerPIC);


% 
% popup_sel_index = get(handles.MODO, 'Value');
% switch popup_sel_index
%     case 1
%         plot(rand(5));
%     case 2
%         plot(sin(1:0.01:25.99));
%     case 3
%         bar(1:.5:10);
%     case 4
%         plot(membrane);
%     case 5
%         surf(peaks);
% end
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==1

q1= eval(get(handles.q1a,'string')); % solo cintura
t1= eval(get(handles.q1t,'string')); % tiempo
p1=500+100*q1/9;
fprintf(SerPIC,'%s',['#0P' int2str(p1) 'T' t1 13]);

end
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==1

q2= eval(get(handles.q2a,'string')); % solo hombro
t2= eval(get(handles.q2t,'string')); % tiempo
p2a=500+100*q2/9;%servo derecho
p2b=3000-p2a;%servo derecho
fprintf(SerPIC,'%s',['#1P' int2str(p2a) 'T' t2 13]);
fprintf(SerPIC,'%s',['#2P' int2str(p2b) 'T' t2 13]);

end

% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
fun =get(handles.MODO,'Value');

if fun==1

q3= eval(get(handles.q3a,'string')); % solo codo
t3= eval(get(handles.q3t,'string')); % tiempo
p3=500+100*q3/9;
fprintf(SerPIC,'%s',['#3P' int2str(p3) 'T' t3 13]);

end

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

fun =get(handles.MODO,'Value');

if fun==1

q4= eval(get(handles.q4a,'string')); % solo muñeca
t4= eval(get(handles.q4t,'string')); % tiempo
p4=500+100*q4/9;
fprintf(SerPIC,'%s',['#4P' int2str(p4) 'T' t4 13]);

end
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
fun =get(handles.MODO,'Value');

if fun==1

q5= eval(get(handles.q5a,'string')); % solo gripper
t5= eval(get(handles.q5t,'string')); % tiempo
p5=500+100*q5/9; %conversion
fprintf(SerPIC,'%s',['#5P' int2str(p5) 'T' t5 13]);

end
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function pushbutton9_CreateFcn(hObject, eventdata, handles)

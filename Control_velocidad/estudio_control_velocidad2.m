

function varargout = estudio_control_velocidad(varargin)
% ESTUDIO_CONTROL_VELOCIDAD M-file for estudio_control_velocidad.fig
%      ESTUDIO_CONTROL_VELOCIDAD, by itself, creates a new ESTUDIO_CONTROL_VELOCIDAD or raises the existing
%      singleton*.
%
%      H = ESTUDIO_CONTROL_VELOCIDAD returns the handle to a new ESTUDIO_CONTROL_VELOCIDAD or the handle to
%      the existing singleton*.
%
%      ESTUDIO_CONTROL_VELOCIDAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ESTUDIO_CONTROL_VELOCIDAD.M with the given input arguments.
%
%      ESTUDIO_CONTROL_VELOCIDAD('Property','Value',...) creates a new ESTUDIO_CONTROL_VELOCIDAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before estudio_control_velocidad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to estudio_control_velocidad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help estudio_control_velocidad

% Last Modified by GUIDE v2.5 10-Oct-2014 17:03:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @estudio_control_velocidad_OpeningFcn, ...
                   'gui_OutputFcn',  @estudio_control_velocidad_OutputFcn, ...
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


% --- Executes just before estudio_control_velocidad is made visible.
function estudio_control_velocidad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to estudio_control_velocidad (see VARARGIN)

% Choose default command line output for estudio_control_velocidad
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes estudio_control_velocidad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = estudio_control_velocidad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.monitor1,'string',round((get(handles.slider1,'value')+20)));

    
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in START.
function START_Callback(hObject, eventdata, handles)
% hObject    handle to START (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set(handles.STOP,'Value',0,'String','Off','Enable','On')
%set(handles.START,'Value',1,'String','On','Enable','Off')

%borrar previos
delete(instrfind({'Port'},{'COM4'}));
%crear objeto serie
s = serial('COM4','BaudRate',115200,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)

cla(handles.axes1)
% preparar la figura
axes(handles.axes1);

%a = axes('XLim',[0 tmax],'YLim',[0 80]);
l1 = line(nan,nan,'Color','r','LineWidth',2);
l2 = line(nan,nan,'Color','b','LineWidth',2);
 
xlabel('Tiempo (s)')
ylabel('Velocidad (V)')
title('Estudio del Control de Velocidad')
grid on
hold on
% inicializar
v1 = zeros(1,tmax*rate);
v2 = zeros(1,tmax*rate);
i = 1;
t = 0;

%envio = input('Valor de Referencia = ');
%fwrite(s,envio,'uint8');
% ejecutar bucle cronometrado
slider1_anterior = get(handles.slider1,'value');
slider2_anterior = get(handles.slider2,'value');
slider3_anterior = get(handles.slider3,'value');
slider4_anterior = get(handles.slider4,'value');
slider7_anterior = get(handles.slider7,'value');

set(handles.slider1 ,'Value',0);

global indicador

indicador=0;

tic

while t<tmax
   t = toc;
        if (get(handles.slider1,'value') ~= slider1_anterior) || (get(handles.slider2,'value') ~= slider2_anterior) ||(get(handles.slider3,'value') ~= slider3_anterior) || (get(handles.slider4,'value') ~= slider4_anterior)
       
            fwrite(s,'S','char');
            fwrite(s,(get(handles.slider1,'value')+20),'uint8');
            fwrite(s,get(handles.slider2,'value'),'uint8');
            fwrite(s,get(handles.slider3,'value'),'uint8');
            fwrite(s,get(handles.slider4,'value'),'uint8');
            fwrite(s,(get(handles.slider7,'value')+1),'uint8');
            
            fwrite(s,'J','char');

            disp(get(handles.slider1,'value'))
            slider1_anterior = get(handles.slider1,'value') ;
            slider2_anterior = get(handles.slider2,'value') ;
            slider3_anterior = get(handles.slider3,'value') ;
            slider4_anterior = get(handles.slider4,'value') ;
            slider7_anterior = get(handles.slider7,'value') ;
            
        end
        
    if indicador == 1
        break;
    end
    
    % leer del puerto serie
    a = fread(s,2,'uint8');
    v1(i)=a(1);
    v2(i)=a(2);
    
    disp(v1(i));
    disp(v2(i));
    % dibujar en la figura
    x = linspace(0,i/rate,i);
  
    set(l1,'YData',v1(1:i),'XData',x);
    set(l2,'YData',v2(1:i),'XData',x);
    drawnow
    % seguir
    i = i+1;
end
% resultado del cronometro
clc;
delete(instrfind({'Port'},{'COM4'}));
fprintf('%g s de captura a %g cap/s \n',t,i/t);
%savefigure('captura_multi','s',[4.5 3],'po','-dpdf')
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;

% --- Executes on button press in STOP.
function STOP_Callback(hObject, eventdata, handles)
% hObject    handle to STOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fwrite(s,'S','char');
fwrite(s,0,'uint8');
fwrite(s,0,'uint8');
fwrite(s,0,'uint8');
fwrite(s,0,'uint8');
fwrite(s,'J','char');

global indicador
indicador = 1;




% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function monitor1_Callback(hObject, eventdata, handles)
% hObject    handle to monitor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of monitor1 as text
%        str2double(get(hObject,'String')) returns contents of monitor1 as a double



% --- Executes during object creation, after setting all properties.
function monitor1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to monitor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
 set(handles.Kp_etiqueta,'string',get(handles.slider2,'value'));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.Ki_etiqueta,'string',get(handles.slider3,'value'));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.Kd_etiqueta,'string',get(handles.slider4,'value'));


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.T_muestreo,'string',(get(handles.slider7,'value')+1));


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

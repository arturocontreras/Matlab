function varargout = gui_tareas(varargin)
% GUI_TAREAS M-file for gui_tareas.fig
%      GUI_TAREAS, by itself, creates a new GUI_TAREAS or raises the existing
%      singleton*.
%
%      H = GUI_TAREAS returns the handle to a new GUI_TAREAS or the handle to
%      the existing singleton*.
%
%      GUI_TAREAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TAREAS.M with the given input arguments.
%
%      GUI_TAREAS('Property','Value',...) creates a new GUI_TAREAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_tareas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_tareas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_tareas

% Last Modified by GUIDE v2.5 05-Aug-2013 10:30:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_tareas_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_tareas_OutputFcn, ...
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


% --- Executes just before gui_tareas is made visible.
function gui_tareas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_tareas (see VARARGIN)

background = imread('agricultor.png'); %Leer imagen
axes(handles.agricultor);              %Carga la imagen en background

axis off;
imshow(background);
% Choose default command line output for gui_tareas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_tareas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_tareas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
fun =get(handles.color,'Value')-1
%close all;clear all;clc;
imaqreset
% primero se captura un stream de video usando videoinput, con argumento
%de winvideo, numero de dispositivo y formato de la camara, si no sabes usa la
%funcion imaqtool para averiguarlo es YUY o RGB
vid=videoinput('winvideo',1,'YUY2_640x480');
%640x480 160x120
% Se configura las opciones de adquision de video
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb')
vid.FrameGrabInterval = 5;
%framegrabinterval significa que tomara cada 5 frame del stream de video adquirida
%con start(vid) se activa la adquisicion, pero todavia se toma la primera foto
start(vid)

% creamos un bucle que puede ser while always o while true en este caso
%y como mi compu es una netbook trucha(trucha=cagada=lenta=barata)
%hago que despues de 100 frames adquiridos se salga del bucle para evitar colgadas
while(vid.FramesAcquired<=1000)

    % se toma una snapshot del stream y se la almacena en data para trabajar mas
    %facil
    data = getsnapshot(vid);
    
    % ahora vamos a reconocer el color rojo en tiempo real
    % tenemos que extraer el color rojo
    % de la imagen en escala de grises de la imagen adquirida en data
    diff_im = imsubtract(data(:,:,get(handles.color,'Value')-1), rgb2gray(data));
    %imsubstract sirve para sacar algun valor constante de una imagen, usamos como
    %argumento el array de data y la funcion rgb2gray de data
    %se usa medfilt2 para filtrar la senial del ruido
    diff_im = medfilt2(diff_im, [3 3]);
    % Convertir la imagen en escala de grises a una imagen binaria.
    diff_im = im2bw(diff_im,0.06);
    
    % para determinar el tamanio a reconocer se usa bwareopen para descartar
    %imagen de rojo de menos de 300 pixels
    diff_im = bwareaopen(diff_im,50);
    
    % Etiquetamos los elementos conectados en la imagen
    bw = bwlabel(diff_im, 8);
    
    % Ahora hacemos el analisis del "objeto" detectado(que solo son pixels rojos)
    %agrupados de mas de 300
    % onfiguramos la region etiquetada
    stats = regionprops(bw, 'BoundingBox', 'Centroid', 'Area', 'Perimeter');
    
    % mostramos la imagen
    
    imshow(data)
    
    hold on
    
    %este es un bucle para encerrar el objeto rojo en un rectangulp y una cruz en el
    %centroide(solo es programacion basica de matlab)
    for object = 1:length(stats)
        A=stats(object).Area;
        P=stats(object).Perimeter;
        K=P^2/A
        forma=get(handles.forma,'Value');
        if(forma==2)
            if(15>K && K>13)
            bb = stats(object).BoundingBox;
            bc = stats(object).Centroid;
            rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
            plot(bc(1),bc(2), '-m+')
            a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
            set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
            end
        end
        if(forma==3)
            if(25>K && K>22)
            bb = stats(object).BoundingBox;
            bc = stats(object).Centroid;
            rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
            plot(bc(1),bc(2), '-m+')
            a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
            set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
            end
        end
         if(forma==4)
            if(21>K && K>15)
            bb = stats(object).BoundingBox;
            bc = stats(object).Centroid;
            rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
            plot(bc(1),bc(2), '-m+')
            a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
            set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
            end
        end     
%         if(4*pi*(stats(object).Area)/(stats(object).Perimeter)^2 > 0.75)        
%         (stats(object).Perimeter)^2/stats(object).Area
%             bb = stats(object).BoundingBox;
%             bc = stats(object).Centroid;
%             rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
%             plot(bc(1),bc(2), '-m+')
%             a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
%             set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
%         end
        
    end
    
    hold off
end
% aqui terminan los 2 bucles

% detenemos la captura
stop(vid);


%FLUSHDATA remueve la imagen del motor de adquisicion y la almacena en el buffer
flushdata(vid);

% borramos todo(como en cualquier programa)
clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in color.
function color_Callback(hObject, eventdata, handles)
% hObject    handle to color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns color contents as cell array
%        contents{get(hObject,'Value')} returns selected item from color


% --- Executes during object creation, after setting all properties.
function color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function latitud_Callback(hObject, eventdata, handles)
% hObject    handle to latitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of latitud as text
%        str2double(get(hObject,'String')) returns contents of latitud as a double


% --- Executes during object creation, after setting all properties.
function latitud_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function longitud_Callback(hObject, eventdata, handles)
% hObject    handle to longitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of longitud as text
%        str2double(get(hObject,'String')) returns contents of longitud as a double


% --- Executes during object creation, after setting all properties.
function longitud_CreateFcn(hObject, eventdata, handles)
% hObject    handle to longitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in forma.
function forma_Callback(hObject, eventdata, handles)
% hObject    handle to forma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns forma contents as cell array
%        contents{get(hObject,'Value')} returns selected item from forma


% --- Executes during object creation, after setting all properties.
function forma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to forma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function robot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to robot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

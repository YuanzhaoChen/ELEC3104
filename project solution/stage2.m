%A five channel equaliser with GUI user interface
%Yuanzhao Chen
function varargout = stage2(varargin)
%STAGE2 MATLAB code file for stage2.fig
%      STAGE2, by itself, creates a new STAGE2 or raises the existing
%      singleton*.
%
%      H = STAGE2 returns the handle to a new STAGE2 or the handle to
%      the existing singleton*.
%
%      STAGE2('Property','Value',...) creates a new STAGE2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to stage2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      STAGE2('CALLBACK') and STAGE2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in STAGE2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stage2

% Last Modified by GUIDE v2.5 01-Jun-2017 22:52:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stage2_OpeningFcn, ...
                   'gui_OutputFcn',  @stage2_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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
end

% --- Executes just before stage2 is made visible.
function stage2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for stage2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stage2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = stage2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gain1 = get(handles.slider1,'Value');
set(handles.dis1,'String',gain1);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on slider movement.
function y2 = slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gain2 = get(handles.slider2,'Value');
set(handles.dis2,'String',gain2);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on slider movement.
function  slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gain3 = get(handles.slider3,'Value');
set(handles.dis3,'String',gain3);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
end

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on slider movement.
function y5 = slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gain5 = get(handles.slider5,'Value');
set(handles.dis5,'String',gain5);
%--------------------------------------
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
end

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on slider movement.
function y4 = slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gain4 = get(handles.slider4,'Value');
set(handles.dis4,'String',gain4);

end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes during object creation, after setting all properties.
function dis1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end
% --- Executes during object deletion, before destroying properties.
function dis1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to dis1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes during object creation, after setting all properties.
function dis2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%code inside this function works as a clock monitor  
set(handles.slider1,'Value',1);
set(handles.slider2,'Value',1);
set(handles.slider3,'Value',1);
set(handles.slider4,'Value',1);
set(handles.slider5,'Value',1);
set(handles.dis1,'String',1);
set(handles.dis2,'String',1);
set(handles.dis3,'String',1);
set(handles.dis4,'String',1);
set(handles.dis5,'String',1);
WaveFiles = get(handles.editFile,'String');
[y,Fs] = audioread(WaveFiles); 

%------------------for 8kHz------------
if Fs == 8000
    downy = [1:round(length(y)/2)];
    j = 1;
    for i=1:length(y)
        if mod(i,2) == 1
            downy(j) = y(i);
            j = j+1;
        end
    end
    
    y = downy;
end
%---------------------------------------
tic;
for i = 1:100*round(length(y)/Fs)
    pause(0.01);
    set(handles.clk,'Value',round(toc));
    set(handles.clk,'String',round(toc));
end
    set(handles.clk,'Value',0);
    set(handles.clk,'String','END');
    
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over clk.
function clk_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to clk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end



function editFile_Callback(hObject, eventdata, handles)
% hObject    handle to editFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFile as text
%        str2double(get(hObject,'String')) returns contents of editFile as a double
end

% --- Executes during object creation, after setting all properties.
function editFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on key press with focus on editFile and none of its controls.
function editFile_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editFile (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in FiltersControl.
function FiltersControl_Callback(hObject, eventdata, handles)
% hObject    handle to FiltersControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%------------read input file-------------
WaveFiles = get(handles.editFile,'String');
[y,Fs] = audioread(WaveFiles); 
y = y';
%------------------for 8kHz------------
if Fs == 8000
    downy = [1:length(y)];
    j = 1;
    for i=1:length(y)
        if mod(i,2) == 1
            downy(j) = y(i);
            j = j+1;
        end
    end
    y = downy;
    Fs = 16000;
    %Rp = 0.4;
    %Rs = 20;
    %Wp = 7500/(Fs/2);
    %Ws = 7000/(Fs/2);
    %[n,Wn] = buttord(Wp,Ws,Rp,Rs);
    %[b,a] = butter(n,Wn);
    %y = myFilter(b,a);
end
%---------------------------------------
%-------locate the location in the wav file-----
timing = get(handles.clk,'Value');
n = round(timing*Fs); 
%-----------------------------------------------

%------------------update gains-----------------
gain1 = get(handles.slider1,'Value');
gain2 = get(handles.slider2,'Value');
gain3 = get(handles.slider3,'Value');
gain4 = get(handles.slider4,'Value');
gain5 = get(handles.slider5,'Value');
%------------------------------------------------
clear sound
if timing~=0 && timing<(length(y)/Fs)
    %-------------1st filter----------------
   
    Rp = 0.4;
    Rs = 20;
    Wp1 = 1500/(Fs/2);
    Ws1 = 1700/(Fs/2);
    [n1 Wn1] = buttord(Wp1,Ws1,Rp,Rs);
    [b1,a1] = butter(n1,Wn1);
    b1 = b1*gain1;
    %---------------2nd filter------------------
    Wp2 = [1800 3000]/(Fs/2);
    Ws2 = [1600 3200]/(Fs/2);
    [n2 Wn2]= buttord(Wp2,Ws2,Rp,Rs);
    [b2,a2] = butter(n2,Wn2);
    b2 = b2*gain2; 
    %-------------3rd filter------------------------
    Wp3 = [3400 4600]/(Fs/2);
    Ws3 = [3200 4800]/(Fs/2);
    [n3 Wn3]= buttord(Wp3,Ws3,Rp,Rs);
    [b3,a3] = butter(n3,Wn3);
    b3 = b3*gain3;
    %-------------4th filter-----------------------
    Wp4 = [5000 6200]/(Fs/2);
    Ws4 = [4800 6400]/(Fs/2);
    [n4 Wn4]= buttord(Wp4,Ws4,Rp,Rs);
    [b4,a4] = butter(n4,Wn4);
    b4 = b4*gain4;
    %-------------5th filter-----------------------
    Wp5 = [6600]/(Fs/2);
    Ws5 = [6300]/(Fs/2);
    [n5 Wn5]= buttord(Wp5,Ws5,Rp,Rs);
    [b5,a5] = butter(n5,Wn5,'high');
    b5 = b5*gain5;
    %----------------------------------------------
    y1 = myFilter(b1,a1,y(n:end));
    y2 = myFilter(b2,a2,y(n:end));
    y3 = myFilter(b3,a3,y(n:end));
    y4 = myFilter(b4,a4,y(n:end));
    y5 = myFilter(b5,a5,y(n:end));
    y = y1+y2+y3+y4+y5;
    sound(y,Fs);
else 
    clear sound
end
end

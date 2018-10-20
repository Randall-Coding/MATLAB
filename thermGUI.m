
function varargout = thermGUI(varargin)
% THERMGUI MATLAB code for thermGUI.fig
%      THERMGUI, by itself, creates a new THERMGUI or raises the existing
%      singleton*.
%
%      H = THERMGUI returns the handle to a new THERMGUI or the handle to
%      the existing singleton*.
%
%      THERMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THERMGUI.M with the given input arguments.
%
%      THERMGUI('Property','Value',...) creates a new THERMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before thermGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to thermGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help thermGUI

% Last Modified by GUIDE v2.5 19-Oct-2018 17:37:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thermGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @thermGUI_OutputFcn, ...
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


% --- Executes just before thermGUI is made visible.
function thermGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thermGUI (see VARARGIN)

% Choose default command line output for thermGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%mystuff
%set default radio button value and colormap  
handles.radio_red.Value = 1.0;
handles.tbox_colormap.String = 'jet';

% UIWAIT makes thermGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = thermGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_browse.
function btn_browse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [filenames,folder]=uigetfile('*.txt','MultiSelect','on');  
    handles.tbox_filenames.String  

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radio_red.
function radio_red_Callback(hObject, eventdata, handles)
% hObject    handle to radio_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_red
  if hObject.Value
     handles.tbox_colormap.String = 'jet'; 
  end

% --- Executes on button press in radio_orange.
function radio_orange_Callback(hObject, eventdata, handles)
% hObject    handle to radio_orange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_orange
   if hObject.Value
    handles.tbox_colormap.String = 'default';
   end

function tbox_fig_width_Callback(hObject, eventdata, handles)
% hObject    handle to tbox_fig_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbox_fig_width as text
%        str2double(get(hObject,'String')) returns contents of tbox_fig_width as a double


% --- Executes during object creation, after setting all properties.
function tbox_fig_width_CreaorangeteFcn(hObject, eventdata, handles)
% hObject    handle to tbox_fig_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbox_fig_height_Callback(hObject, eventdata, handles)
% hObject    handle to tbox_fig_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbox_fig_height as text
%        str2double(get(hObject,'String')) returns contents of tbox_fig_height as a double


% --- Executes during object creation, after setting all properties.
function tbox_fig_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbox_fig_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_render.
function btn_render_Callback(hObject, eventdata, handles)
% hObject    handle to btn_render (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   fig_width = str2double (handles.tbox_fig_width.String)
   fig_height = str2double (handles.tbox_fig_height.String)
   type.colormap = handles.tbox_colormap.String 
   type.data = 'uni'
   thermal_func(type,fig_width,fig_height);
   

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function tbox_colormap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbox_colormap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

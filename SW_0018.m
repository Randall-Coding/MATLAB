function varargout = SW_0018(varargin)
% SW_0018 MATLAB code for SW_0018.fig
%      SW_0018, by itself, creates a new SW_0018 or raises the existing
%      singleton*.
%
%      H = SW_0018 returns the handle to a new SW_0018 or the handle to
%      the existing singleton*.
%
%      SW_0018('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SW_0018.M with the given input arguments.
%
%      SW_0018('Property','Value',...) creates a new SW_0018 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SW_0018_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SW_0018_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SW_0018

% Last Modified by GUIDE v2.5 31-Oct-2018 12:44:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SW_0018_OpeningFcn, ...
                   'gui_OutputFcn',  @SW_0018_OutputFcn, ...
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


% --- Executes just before SW_0018 is made visible.
function SW_0018_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SW_0018 (see VARARGIN)

% Choose default command line output for SW_0018
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SW_0018 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%my stuff
%initialize variables
global data
data = cell(1,3);
set(gcf,'Name','SW0018_Uniformity_Calculator');
handles.tbl_all.Data = data;
data = zeros(1,3); data(:) = -1;
tbl_width = handles.tbl_all.ColumnWidth{1} + handles.tbl_all.ColumnWidth{2} + handles.tbl_all.ColumnWidth{3} ...
    + 32;  %last number is length of scroll bar
handles.tbl_all.Position = [11 0 tbl_width 447];



% --- Outputs from this function are returned to the command line.
function varargout = SW_0018_OutputFcn(hObject, eventdata, handles) 
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

% Hint: get(hObject,'Value') returns toggle state of btn_browse
global data 
load_img = handles.lbl_load; 
data = SW0018_Uniformity_Calculator(load_img);
handles.lbl_load.Visible = 'off';
%load data if not empty 
if ( (data(1)) ~= -1 )
    handles.tbl_all.Data = data;
    
    %readjust width
    tbl_width = handles.tbl_all.ColumnWidth{1} + handles.tbl_all.ColumnWidth{2} + handles.tbl_all.ColumnWidth{3} ...
    + 35;  %last number is length of row number column 
    if length(data(:,1)) > 21
        tbl_width = tbl_width + 18;  %adjusting for scrollbar
        disp 'data over 20 counts'
    end
    if length(data(:,1)) > 99
        tbl_width = tbl_width + 12;
        disp 'data over 100 counts'
    end
    handles.tbl_all.Position = [11 0 tbl_width 447];
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over btn_browse.
function btn_browse_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to btn_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

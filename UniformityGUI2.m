function varargout = UniformityGUI2(varargin)
%UNIFORMITYGUI2 MATLAB code file for UniformityGUI2.fig
%      UNIFORMITYGUI2, by itself, creates a new UNIFORMITYGUI2 or raises the existing
%      singleton*.
%
%      H = UNIFORMITYGUI2 returns the handle to a new UNIFORMITYGUI2 or the handle to
%      the existing singleton*.
%
%      UNIFORMITYGUI2('Property','Value',...) creates a new UNIFORMITYGUI2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to UniformityGUI2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      UNIFORMITYGUI2('CALLBACK') and UNIFORMITYGUI2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in UNIFORMITYGUI2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UniformityGUI2

% Last Modified by GUIDE v2.5 19-Oct-2018 20:42:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UniformityGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @UniformityGUI2_OutputFcn, ...
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


% --- Executes just before UniformityGUI2 is made visible.
function UniformityGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for UniformityGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UniformityGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UniformityGUI2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

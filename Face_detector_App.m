function varargout = Face_detector_App(varargin)
% FACE_DETECTOR_APP MATLAB code for Face_detector_App.fig
%      FACE_DETECTOR_APP, by itself, creates a new FACE_DETECTOR_APP or raises the existing
%      singleton*.
%
%      H = FACE_DETECTOR_APP returns the handle to a new FACE_DETECTOR_APP or the handle to
%      the existing singleton*.
%
%      FACE_DETECTOR_APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACE_DETECTOR_APP.M with the given input arguments.
%
%      FACE_DETECTOR_APP('Property','Value',...) creates a new FACE_DETECTOR_APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Face_detector_App_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Face_detector_App_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Face_detector_App

% Last Modified by GUIDE v2.5 28-Mar-2020 01:53:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Face_detector_App_OpeningFcn, ...
                   'gui_OutputFcn',  @Face_detector_App_OutputFcn, ...
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


% --- Executes just before Face_detector_App is made visible.
function Face_detector_App_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Face_detector_App (see VARARGIN)

% Choose default command line output for Face_detector_App
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Face_detector_App wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Face_detector_App_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullpathname;
[filename, pathname] = uigetfile({'*.jpg',}, 'Browse');
fullpathname = strcat(pathname, filename);
set(handles.text3, 'String', fullpathname);
global x;
global d_x
x = imread(fullpathname);
face_detector = vision.CascadeObjectDetector();
BBOX = step(face_detector, x);
d_x = insertObjectAnnotation(x, 'rectangle', BBOX, 'Face');
axes(handles.axes1);
imshow(d_x);
n = size(BBOX, 1);
str_n = num2str(n);
set(handles.text6, 'String', str_n);

function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit as text
%        str2double(get(hObject,'String')) returns contents of edit as a double


% --- Executes during object creation, after setting all properties.
function edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

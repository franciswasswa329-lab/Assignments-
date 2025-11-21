function varargout = slider_graph(varargin)
% SLIDER_GRAPH MATLAB code for slider_graph.fig
%      SLIDER_GRAPH, by itself, creates a new SLIDER_GRAPH or raises the existing
%      singleton*.
%
%      H = SLIDER_GRAPH returns the handle to a new SLIDER_GRAPH or the handle to
%      the existing singleton*.
%
%      SLIDER_GRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLIDER_GRAPH.M with the given input arguments.
%
%      SLIDER_GRAPH('Property','Value',...) creates a new SLIDER_GRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before slider_graph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to slider_graph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help slider_graph

% Last Modified by GUIDE v2.5 05-Apr-2013 11:14:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @slider_graph_OpeningFcn, ...
                   'gui_OutputFcn',  @slider_graph_OutputFcn, ...
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


% --- Executes just before slider_graph is made visible.
function slider_graph_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to slider_graph (see VARARGIN)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handles.colors = {'b-' 'r-' 'g-' 'c-' 'm-' 'y-' 'k-'};  % available colors for graph
handles.graph_color = 1;                                % default to color 1 (blue)
guidata(hObject, handles);                              % update handles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Choose default command line output for slider_graph
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes slider_graph wait for user response (see UIRESUME)
% uiwait(handles.figure1);
slider_update(handles);

% --- Outputs from this function are returned to the command line.
function varargout = slider_graph_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_x_Callback(hObject, eventdata, handles)
% hObject    handle to slider_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

slider_update(handles); % update graph based on slider position

% --- Executes during object creation, after setting all properties.
function slider_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_y_Callback(hObject, eventdata, handles)
% hObject    handle to slider_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

slider_update(handles); % update graph based on slider position

% --- Executes during object creation, after setting all properties.
function slider_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_arrowhead_size_Callback(hObject, eventdata, handles)
% hObject    handle to slider_arrowhead_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

slider_update(handles); % update graph based on slider position

% --- Executes during object creation, after setting all properties.
function slider_arrowhead_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_arrowhead_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over hidden_button.
function hidden_button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to hidden_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if handles.graph_color == length(handles.colors)    % check if at last color
    handles.graph_color = 1;                        % if last color, start over at 1
else
    handles.graph_color = handles.graph_color + 1;  % update color
end
guidata(hObject, handles);                          % update handles
slider_update(handles);                             % update graph based on slider position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on slider movement.
function slider_thickness_Callback(hObject, eventdata, handles)
% hObject    handle to slider_thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

slider_update(handles); % update graph based on slider position

% --- Executes during object creation, after setting all properties.
function slider_thickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- This function is used to update the graph when either slider is adjusted.
function slider_update(handles)
% get x,y coordinate from sliders
x = get(handles.slider_x,'Value');
set(handles.text_x,'String',x);
y = get(handles.slider_y,'Value');
set(handles.text_y,'String',y);
% get arrowhead size and line thickness from sliders
s = get(handles.slider_arrowhead_size,'Value');
set(handles.text_arrowhead_size,'String',s);
T = get(handles.slider_thickness,'Value');
if T <= 0
    T = 0.05;
    set(handles.slider_thickness,'Value',T);
end
set(handles.text_thickness,'String',T);
% compute the locations of the arrowheads
A = atand(y/x);
if x >= 0
    x_arrow_1 = x+s*cosd(A+135);
    x_arrow_2 = x+s*cosd(A-135);
    y_arrow_1 = y+s*sind(A+135);
    y_arrow_2 = y+s*sind(A-135);
else
    x_arrow_1 = x+s*cosd(A+45);
    x_arrow_2 = x+s*cosd(A-45);
    y_arrow_1 = y+s*sind(A+45);
    y_arrow_2 = y+s*sind(A-45);
end
% plot the arrow
axes(handles.axes1);
cla;
plot([0 x],[0 y],handles.colors{handles.graph_color},'LineWidth',T);
hold on;
plot([x x_arrow_1],[y y_arrow_1],handles.colors{handles.graph_color},'LineWidth',T);
plot([x x_arrow_2],[y y_arrow_2],handles.colors{handles.graph_color},'LineWidth',T);
axis([-10 10 -10 10]);
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For a hidden button:                                                     %
% Include a static text box and remove the string (i.e. string = '').  You %
% then need to add the ButtonDownFcn callback by right-clicking on the     %
% object and select "View Callbacks -> ButtonDownFcn".  This will add the  %
% callback function to your code.  In order for a click on the area of the %
% text box to execute, you must set the "Enable" property to off.  You will%
% also want to change the "ForegroundColor" and "BackgroundColor"          %
% properties to be the same color as the background of your GUI.  Place    %
% the code you want to execute on the hidden button press in the           %
% ButtonDownFcn callback, and you now have a hidden button!                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
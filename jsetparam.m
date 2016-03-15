function varargout = jsetparam(varargin)
                                                % JSETPARAM MATLAB code for jsetparam.fig
                                                %      JSETPARAM, by itself, creates a new JSETPARAM or raises the existing
                                                %      singleton*.
                                                %
                                                %      H = JSETPARAM returns the handle to a new JSETPARAM or the handle to
                                                %      the existing singleton*.
                                                %
                                                %      JSETPARAM('CALLBACK',hObject,eventData,handles,...) calls the local
                                                %      function named CALLBACK in JSETPARAM.M with the given input arguments.
                                                %
                                                %      JSETPARAM('Property','Value',...) creates a new JSETPARAM or raises the
                                                %      existing singleton*.  Starting from the left, property value pairs are
                                                %      applied to the GUI before jsetparam_OpeningFcn gets called.  An
                                                %      unrecognized property name or invalid value makes property application
                                                %      stop.  All inputs are passed to jsetparam_OpeningFcn via varargin.
                                                %
                                                %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
                                                %      instance to run (singleton)".
                                                %
                                                % See also: GUIDE, GUIDATA, GUIHANDLES

                                                % Edit the above text to modify the response to help jsetparam

                                                % Last Modified by GUIDE v2.5 03-Sep-2014 15:12:47

                                                % Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jsetparam_OpeningFcn, ...
                   'gui_OutputFcn',  @jsetparam_OutputFcn, ...
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


                                                % --- Executes just before jsetparam is made visible.
function jsetparam_OpeningFcn(hObject, ~, handles, varargin)
                                                % This function has no output args, see OutputFcn.
                                                % hObject    handle to figure
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)
                                                % varargin   command line arguments to jsetparam (see VARARGIN)

                                                % Choose default command line output for jsetparam
handles.output = hObject;

global chandle
global cdata

chandle.setparam        = handles.setparam;
chandle.mutetxt         = handles.mutetxt;
chandle.scltxt          = handles.scltxt;
chandle.tier2txt        = handles.tier2txt;
chandle.tier3txt        = handles.tier3txt;
chandle.ptstxt          = handles.ptstxt;
chandle.hdlabel         = handles.hdlabel;
chandle.label01         = handles.label01;
chandle.label02         = handles.label02;
chandle.label03         = handles.label03;
chandle.label04         = handles.label04;
chandle.label05         = handles.label05;
chandle.resetbtn        = handles.resetbtn;
chandle.cfmbtn          = handles.cfmbtn;



if ispc
    pcparamtextsize;
end

param                   = cdata.param;
parpos                  = get(chandle.fg,'OuterPosition');
kidpos                  = get(hObject,'OuterPosition');
kidpos(1)               = floor(parpos(1)+parpos(3)/2-kidpos(3)/2);
kidpos(2)               = ceil(parpos(2)+0.2*parpos(4)-kidpos(4));

set(hObject,'OuterPosition',kidpos);

set(chandle.mutetxt,'String',num2str(param.mute));
set(chandle.scltxt,'String',num2str(param.scale));
set(chandle.tier2txt,'String',num2str(param.thres));
set(chandle.tier3txt,'String',num2str(param.dist));
set(chandle.ptstxt,'String',num2str(param.numpts));
                                                % Update handles structure
guidata(hObject, handles);

                                                % UIWAIT makes jsetparam wait for user response (see UIRESUME)
                                                % uiwait(handles.setparam);


                                                % --- Outputs from this function are returned to the command line.
function varargout = jsetparam_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mutetxt_Callback(hObject, eventdata, handles)
% hObject    handle to mutetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mutetxt as text
%        str2double(get(hObject,'String')) returns contents of mutetxt as a double


                                                % --- Executes during object creation, after setting all properties.
function mutetxt_CreateFcn(hObject, ~, ~)
% hObject    handle to mutetxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scltxt_Callback(hObject, eventdata, handles)
% hObject    handle to scltxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scltxt as text
%        str2double(get(hObject,'String')) returns contents of scltxt as a double


% --- Executes during object creation, after setting all properties.
function scltxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scltxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tier2txt_Callback(hObject, eventdata, handles)
% hObject    handle to tier2txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tier2txt as text
%        str2double(get(hObject,'String')) returns contents of tier2txt as a double


% --- Executes during object creation, after setting all properties.
function tier2txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tier2txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tier3txt_Callback(hObject, eventdata, handles)
% hObject    handle to tier3txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tier3txt as text
%        str2double(get(hObject,'String')) returns contents of tier3txt as a double


% --- Executes during object creation, after setting all properties.
function tier3txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tier3txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ptstxt_Callback(hObject, eventdata, handles)
% hObject    handle to ptstxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ptstxt as text
%        str2double(get(hObject,'String')) returns contents of ptstxt as a double


% --- Executes during object creation, after setting all properties.
function ptstxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ptstxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


                                                % --- Executes on button press in resetbtn.
function resetbtn_Callback(~, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to resetbtn (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

global cstate
global chandle
global cdata

switch cstate
    case 'paramst'
        param       = cdata.iniparam;

        set(chandle.mutetxt,'String',num2str(param.mute));
        set(chandle.scltxt,'String',num2str(param.scale));
        set(chandle.tier2txt,'String',num2str(param.thres));
        set(chandle.tier3txt,'String',num2str(param.dist));
        set(chandle.ptstxt,'String',num2str(param.numpts));
end


                                                % --- Executes on button press in cfmbtn.
function cfmbtn_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cfmbtn (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

global cstate
global chandle
global cdata

switch cstate
    case 'paramst'
        oparam          = cdata.param;
        chg             = 0;
        
        param.mute      = str2double(get(chandle.mutetxt,'String'));
        param.scale     = str2double(get(chandle.scltxt,'String'));
        param.thres     = str2double(get(chandle.tier2txt,'String'));
        param.dist      = str2double(get(chandle.tier3txt,'String'));
        param.numpts    = str2double(get(chandle.ptstxt,'String'));
        
        if ~isequal(oparam.mute,param.mute)
            chg         = chg+1;
        end
        if ~isequal(oparam.scale,param.scale)
            chg         = chg+1;
        end
        if ~isequal(oparam.thres,param.thres)
            chg         = chg+1;
        end
        if ~isequal(oparam.dist,param.dist)
            chg         = chg+1;
        end
        if ~isequal(oparam.numpts,param.numpts)
            chg         = chg+1;
        end
        
        if chg > 0
            cdata.param     = param;
            cdata.apcur     = japcurvefit(cdata.dat,cdata.param);
            cdata.pcur      = jcurvefit(cdata.dat,cdata.param);
            if get(chandle.apradio,'Value')
                cdata.curve     = cdata.apcur;
            else
                cdata.curve     = cdata.pcur;
            end
            cdata.datrange  = max(cdata.curve.sg)-min(cdata.curve.sg);
            cdata.curve.ptslist.tierlist1   = jtierlist(cdata.curve.ptslist.tier1,cdata.grplist);
            cdata.curve.ptslist.tierlist2   = jtierlist(cdata.curve.ptslist.tier2,cdata.grplist);
            cdata.curve.ptslist.tierlist3   = jtierlist(cdata.curve.ptslist.tier3,cdata.grplist);
            
            delete(chandle.setparam);
            axes(chandle.ax);
            jaxreplot;
            if isequal(num,1)
                tot             = size(cdata.curve.ptslist.all,1);
                jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
            else
                tot             = size(cdata.curve.ptslist.tierlist3{num-1},1)+size(cdata.curve.ptslist.tierlist2{num-1},1)+size(cdata.curve.ptslist.tierlist1{num-1},1);
                jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
            end
        end
        
        set(chandle.cbox01,'Enable','on');
        set(chandle.cbox02,'Enable','on');
        set(chandle.cbox03,'Enable','on');
        set(chandle.cbox04,'Enable','on');
        set(chandle.cbox05,'Enable','on');
        set(chandle.cbox06,'Enable','on');
        set(chandle.cbox07,'Enable','on');
        set(chandle.apradio,'Enable','on');
        if ~isequal(chandle.oldstate,'startst')
            set(chandle.pradio,'Enable','on');
        end

        cstate  = chandle.oldstate;

end



                                                % --- Executes when user attempts to close setparam.
function setparam_CloseRequestFcn(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to setparam (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: delete(hObject) closes the figure

global cstate
global chandle

set(chandle.cbox01,'Enable','on');
set(chandle.cbox02,'Enable','on');
set(chandle.cbox03,'Enable','on');
set(chandle.cbox04,'Enable','on');
set(chandle.cbox05,'Enable','on');
set(chandle.cbox06,'Enable','on');
set(chandle.cbox07,'Enable','on');
set(chandle.apradio,'Enable','on');
if ~isequal(chandle.oldstate,'startst')
    set(chandle.pradio,'Enable','on');
end

cstate  = chandle.oldstate;
delete(hObject);

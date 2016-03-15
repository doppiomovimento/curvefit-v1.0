function varargout = jcurvefitdemo(varargin)
                                                % JCURVEFITDEMO MATLAB code for jcurvefitdemo.fig
                                                %      JCURVEFITDEMO, by itself, creates a new JCURVEFITDEMO or raises the existing
                                                %      singleton*.
                                                %
                                                %      H = JCURVEFITDEMO returns the handle to a new JCURVEFITDEMO or the handle to
                                                %      the existing singleton*.
                                                %
                                                %      JCURVEFITDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
                                                %      function named CALLBACK in JCURVEFITDEMO.M with the given input arguments.
                                                %
                                                %      JCURVEFITDEMO('Property','Value',...) creates a new JCURVEFITDEMO or raises the
                                                %      existing singleton*.  Starting from the left, property value pairs are
                                                %      applied to the GUI before jcurvefitdemo_OpeningFcn gets called.  An
                                                %      unrecognized property name or invalid value makes property application
                                                %      stop.  All inputs are passed to jcurvefitdemo_OpeningFcn via varargin.
                                                %
                                                %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
                                                %      instance to run (singleton)".
                                                %
                                                % See also: GUIDE, GUIDATA, GUIHANDLES

                                                % Edit the above text to modify the response to help jcurvefitdemo

                                                % Last Modified by GUIDE v2.5 20-Jan-2016 13:58:41

                                                % Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jcurvefitdemo_OpeningFcn, ...
                   'gui_OutputFcn',  @jcurvefitdemo_OutputFcn, ...
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


                                                % --- Executes just before jcurvefitdemo is made visible.
function jcurvefitdemo_OpeningFcn(hObject, ~, handles, varargin)
                                                % This function has no output args, see OutputFcn.
                                                % hObject    handle to figure
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)
                                                % varargin   command line arguments to jcurvefitdemo (see VARARGIN)

                                                % Choose default command line output for jcurvefitdemo
handles.output = hObject;
global chandle
global cdata
global cstate

cstate              = 'startst';
chandle.fg          = handles.fg;
chandle.hdr         = handles.hdr;
chandle.ax          = handles.ax;
chandle.showlist    = handles.showlist;
chandle.open        = handles.open;
chandle.export      = handles.export;
chandle.settings    = handles.settings;
chandle.apradio     = handles.apradio;
chandle.pradio      = handles.pradio;
chandle.ax01        = handles.ax01;
chandle.ax02        = handles.ax02;
chandle.ax03        = handles.ax03;
chandle.ax04        = handles.ax04;
chandle.ax05        = handles.ax05;
chandle.ax06        = handles.ax06;
chandle.ax07        = handles.ax07;
chandle.cbox01      = handles.cbox01;
chandle.cbox02      = handles.cbox02;
chandle.cbox03      = handles.cbox03;
chandle.cbox04      = handles.cbox04;
chandle.cbox05      = handles.cbox05;
chandle.cbox06      = handles.cbox06;
chandle.cbox07      = handles.cbox07;
chandle.txt01       = handles.txt01;
chandle.txt02       = handles.txt02;
chandle.txt03       = handles.txt03;
chandle.txt04       = handles.txt04;
chandle.txt05       = handles.txt05;
chandle.txt06       = handles.txt06;
chandle.txt07       = handles.txt07;
chandle.ctrlpts     = handles.ctrlpts;
chandle.oldstate    ='startst';


if ispc
    pctextsize;
end


param.mute          = 6;
param.scale         = 4;
param.thres         = 0;
param.dist          = 4;
param.numpts        = 20;
cdata.iniparam      = param;
cdata.param         = param;

cdata.imblanks      = zeros(10,36)+0.302;

set(chandle.fg,'OuterPosition',jpositionfigure(0,chandle.fg));
                                                % label for original data
axes(chandle.ax01);
imshow(cdata.imblanks);hold on
plot(1:36,5*ones(1,36),'color', [0.6 0.6 0.6],'LineWidth',1);hold off
                                                % label for filtered data
axes(chandle.ax02);
imshow(cdata.imblanks);hold on
plot(1:36,5*ones(1,36),'c','LineWidth',1);hold off
                                                % label for curve fit
axes(chandle.ax03);
imshow(cdata.imblanks);hold on
plot(1:36,5*ones(1,36),'g','LineWidth',2);hold off
                                                % label for scaled curvature data
axes(chandle.ax04);
imshow(cdata.imblanks);hold on
plot(1:36,5*ones(1,36),'m','LineWidth',1);hold off
                                                % label for markers
axes(chandle.ax05);
imshow(cdata.imblanks);hold on
plot(20,7,'rs'); hold off

axes(chandle.ax06);
imshow(cdata.imblanks);hold on
plot(20,7,'bs'); hold off

axes(chandle.ax07);
imshow(cdata.imblanks);hold on
plot(20,7,'ys'); hold off

                                                % read in data, analyze and display
cdata.orgdata       = csvread('c-pe20070302to20131113.csv');
cdata.dat           = cdata.orgdata;
cdata.datmin        = min(cdata.dat);
cdata.datmax        = max(cdata.dat);
cdata.curve         = japcurvefit(cdata.dat,cdata.param);
cdata.datrange      = max(cdata.curve.sg)-min(cdata.curve.sg);
cdata.datsize       = size(cdata.dat,1);
[gl,sl,r]           = jshowlist(cdata.datsize);
cdata.grplist       = gl;
cdata.strlist       = sl;
cdata.ratio         = r;
cdata.curve.ptslist.tierlist1   = jtierlist(cdata.curve.ptslist.tier1,cdata.grplist);
cdata.curve.ptslist.tierlist2   = jtierlist(cdata.curve.ptslist.tier2,cdata.grplist);
cdata.curve.ptslist.tierlist3   = jtierlist(cdata.curve.ptslist.tier3,cdata.grplist);
cdata.rangesel      = 1;                        % selected range in list

set(chandle.showlist, 'String', sl);

axes(handles.ax);
hold on
chandle.plotmin     = plot(1, cdata.datmin,'Color', [0.29 0.29 0.29]);
chandle.plotmax     = plot(1, cdata.datmax,'Color', [0.29 0.29 0.29]);
chandle.jcurva      = -0.1234;
chandle.orgdata     = plot(cdata.dat,'color', [0.6 0.6 0.6]);
chandle.filtdata    = -0.1234;
chandle.curve       = plot(cdata.curve.y,'g','LineWidth',2);
chandle.tier3       = -0.1234;
chandle.tier2       = -0.1234;
chandle.tier1       = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
hold off

jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(size(cdata.curve.ptslist.all,1))],0.7);

                                                % Update handles structure
guidata(hObject, handles);

                                                % UIWAIT makes jcurvefitdemo wait for user response (see UIRESUME)
                                                % uiwait(handles.fg);


                                                % --- Outputs from this function are returned to the command line.
function varargout = jcurvefitdemo_OutputFcn(~, ~, handles) 
                                                % varargout  cell array for returning output args (see VARARGOUT);
                                                % hObject    handle to figure
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Get default command line output from handles structure
varargout{1} = handles.output;


                                                % --- Executes on button press in apradio.
function apradio_Callback(~, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to apradio (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of apradio

global chandle
global cdata
global cstate

switch cstate
    case 'openst'
        set(chandle.pradio,'Value',0);
        set(chandle.pradio,'Enable','off');
        cdata.curve                     = cdata.apcur;
        cdata.datrange                  = max(cdata.curve.sg)-min(cdata.curve.sg);
        cdata.curve.ptslist.tierlist1   = jtierlist(cdata.curve.ptslist.tier1,cdata.grplist);
        cdata.curve.ptslist.tierlist2   = jtierlist(cdata.curve.ptslist.tier2,cdata.grplist);
        cdata.curve.ptslist.tierlist3   = jtierlist(cdata.curve.ptslist.tier3,cdata.grplist);
        
        jaxreplot;
        set(chandle.pradio,'Enable','on');
        
        num             = cdata.rangesel;
        if isequal(num,1)
            tot             = size(cdata.curve.ptslist.all,1);
            jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
        else
            tot             = size(cdata.curve.ptslist.tierlist3{num-1},1)+size(cdata.curve.ptslist.tierlist2{num-1},1)+size(cdata.curve.ptslist.tierlist1{num-1},1);
            jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
        end
end


                                                % --- Executes on button press in pradio.
function pradio_Callback(~, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to pradio (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of pradio


global chandle
global cdata
global cstate

switch cstate
    case 'openst'
        set(chandle.apradio,'Value',0);
        set(chandle.apradio,'Enable','off');
        cdata.curve                     = cdata.pcur;
        cdata.datrange                  = max(cdata.curve.sg)-min(cdata.curve.sg);
        cdata.curve.ptslist.tierlist1   = jtierlist(cdata.curve.ptslist.tier1,cdata.grplist);
        cdata.curve.ptslist.tierlist2   = jtierlist(cdata.curve.ptslist.tier2,cdata.grplist);
        cdata.curve.ptslist.tierlist3   = jtierlist(cdata.curve.ptslist.tier3,cdata.grplist);
        
        jaxreplot;
        set(chandle.apradio,'Enable','on');
        
        num             = cdata.rangesel;
        if isequal(num,1)
            tot             = size(cdata.curve.ptslist.all,1);
            jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
        else
            tot             = size(cdata.curve.ptslist.tierlist3{num-1},1)+size(cdata.curve.ptslist.tierlist2{num-1},1)+size(cdata.curve.ptslist.tierlist1{num-1},1);
            jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
        end
end


                                                % --- Executes on button press in open.
function open_Callback(~, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to open (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

global chandle
global cdata
global cstate
                                                % Open a file
                                                % -------------
                                                
switch cstate
    case {'startst','openst'}
            [fn, pn]        = uigetfile({'*.csv','csv files'},'Select a file');
        if ~isequal(fn,0)                       % When the user properly select a file
            cdata.file      = [pn fn];
            cdata.dat       = csvread(cdata.file);
            cdata.datmin    = min(cdata.dat);
            cdata.datmax    = max(cdata.dat);
            cdata.apcur     = japcurvefit(cdata.dat,cdata.param);
            cdata.pcur      = jcurvefit(cdata.dat,cdata.param);
            cdata.curve     = cdata.apcur;
            cdata.datrange  = max(cdata.curve.sg)-min(cdata.curve.sg);
            cdata.datsize   = size(cdata.dat,1);
            [gl,sl,r]       = jshowlist(cdata.datsize);
            cdata.grplist   = gl;
            cdata.strlist   = sl;
            cdata.ratio     = r;
            cdata.curve.ptslist.tierlist1   = jtierlist(cdata.curve.ptslist.tier1,cdata.grplist);
            cdata.curve.ptslist.tierlist2   = jtierlist(cdata.curve.ptslist.tier2,cdata.grplist);
            cdata.curve.ptslist.tierlist3   = jtierlist(cdata.curve.ptslist.tier3,cdata.grplist);
            cdata.rangesel  = 1;                % selected range in list
            chandle.oldstate= 'startst';
            cstate          = 'openst';
            set(chandle.showlist, 'String', sl);
            set(chandle.pradio,'Enable','on');
            
            jaxreplot;
            set(chandle.showlist,'Value', 1)
            set(chandle.apradio,'Value',1);
            set(chandle.pradio,'Value',0);
            
            jFlashingStr(chandle.hdr,fn,0.7);
            jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(size(cdata.curve.ptslist.all,1))],0.7);
        end
end


                                                % --- Executes on button press in cbox01.
function cbox01_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox01 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox01

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.orgdata)
                delete(chandle.orgdata);
            end
        else
            if ishandle(chandle.filtdata)
                delete(chandle.filtdata);
            end
            if ishandle(chandle.curve)
                delete(chandle.curve);
            end
            if ishandle(chandle.tier1)
                delete(chandle.tier1);
            end
            if ishandle(chandle.tier2)
                delete(chandle.tier2);
            end
            if ishandle(chandle.tier3)
                delete(chandle.tier3);
            end
            
            hold on
            num             = cdata.rangesel;
            lst             = cdata.grplist(num,1):cdata.grplist(num,2);
            chandle.orgdata = plot(lst, cdata.dat(lst),'color', [0.6 0.6 0.6]);

            if isequal(get(chandle.cbox02,'Value'),1)
                chandle.filtdata    = plot(lst,cdata.curve.sg(lst),'c');
            end
            if isequal(get(chandle.cbox03,'Value'),1)
                chandle.curve       = plot(lst, cdata.curve.y(lst),'g','LineWidth',2);
            end
            if isequal(get(chandle.cbox05,'Value'),1)
                if isequal(num,1)
                    chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
                else
                    chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox06,'Value'),1)
                if isequal(num,1)
                    chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
                else
                    chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox07,'Value'),1)
                if isequal(num,1)
                    chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
                else
                    chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
                end
            end
            
            
            hold off
        end
        
end


                                                % --- Executes on button press in cbox02.
function cbox02_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox02 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox02

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.filtdata)
                delete(chandle.filtdata);
            end
        else
            if ishandle(chandle.curve)
                delete(chandle.curve);
            end
            if ishandle(chandle.tier1)
                delete(chandle.tier1);
            end
            if ishandle(chandle.tier2)
                delete(chandle.tier2);
            end
            if ishandle(chandle.tier3)
                delete(chandle.tier3);
            end
            
            hold on
            num             = cdata.rangesel;
            lst             = cdata.grplist(num,1):cdata.grplist(num,2);
            chandle.filtdata= plot(lst,cdata.curve.sg(lst),'c');

            if isequal(get(chandle.cbox03,'Value'),1)
                chandle.curve       = plot(lst, cdata.curve.y(lst),'g','LineWidth',2);
            end
            if isequal(get(chandle.cbox05,'Value'),1)
                if isequal(num,1)
                    chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
                else
                    chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox06,'Value'),1)
                if isequal(num,1)
                    chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
                else
                    chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox07,'Value'),1)
                if isequal(num,1)
                    chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
                else
                    chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
                end
            end
            
            
            hold off
        end
        
end


                                                % --- Executes on button press in cbox03.
function cbox03_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox03 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox03

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.curve)
                delete(chandle.curve);
            end
        else
            if ishandle(chandle.tier1)
                delete(chandle.tier1);
            end
            if ishandle(chandle.tier2)
                delete(chandle.tier2);
            end
            if ishandle(chandle.tier3)
                delete(chandle.tier3);
            end
            
            hold on
            num             = cdata.rangesel;
            lst             = cdata.grplist(num,1):cdata.grplist(num,2);
            chandle.curve   = plot(lst, cdata.curve.y(lst),'g','LineWidth',2);

            if isequal(get(chandle.cbox05,'Value'),1)
                if isequal(num,1)
                    chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
                else
                    chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox06,'Value'),1)
                if isequal(num,1)
                    chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
                else
                    chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox07,'Value'),1)
                if isequal(num,1)
                    chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
                else
                    chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
                end
            end
            
            
            hold off
        end
        
end


                                                % --- Executes on button press in cbox05.
function cbox05_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox05 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox05

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.tier1)
                delete(chandle.tier1);
            end
        else
            
            hold on
            num             = cdata.rangesel;

            if isequal(num,1)
                chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
            else
                chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
            end
            
            hold off
        end
        
end


                                                % --- Executes on button press in cbox04.
function cbox04_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox04 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox04

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.jcurva)
                delete(chandle.jcurva);
            end
        else
            if ishandle(chandle.orgdata)
                delete(chandle.orgdata);
            end
            if ishandle(chandle.filtdata)
                delete(chandle.filtdata);
            end
            if ishandle(chandle.curve)
                delete(chandle.curve);
            end
            if ishandle(chandle.tier1)
                delete(chandle.tier1);
            end
            if ishandle(chandle.tier2)
                delete(chandle.tier2);
            end
            if ishandle(chandle.tier3)
                delete(chandle.tier3);
            end
            
            hold on
            num             = cdata.rangesel;
            lst             = cdata.grplist(num,1):cdata.grplist(num,2);
            chandle.jcurva  = plot(lst, cdata.curve.jcurva(lst)*(cdata.datrange/10),'m','LineWidth',1);
            
            if isequal(get(chandle.cbox01,'Value'),1)
                chandle.orgdata     = plot(lst, cdata.dat(lst),'color', [0.6 0.6 0.6]);
            end
            if isequal(get(chandle.cbox02,'Value'),1)
                chandle.filtdata    = plot(lst,cdata.curve.sg(lst),'c');
            end
            if isequal(get(chandle.cbox03,'Value'),1)
                chandle.curve       = plot(lst, cdata.curve.y(lst),'g','LineWidth',2);
            end
            if isequal(get(chandle.cbox05,'Value'),1)
                if isequal(num,1)
                    chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
                else
                    chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox06,'Value'),1)
                if isequal(num,1)
                    chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
                else
                    chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox07,'Value'),1)
                if isequal(num,1)
                    chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
                else
                    chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
                end
            end
            
            
            hold off
        end
        
end


                                                % --- Executes on button press in export.
function export_Callback(~, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to export (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)


            global cdata
            list                = cdata.curve.salpts;
            y                   = cdata.curve.y;
            ctrpts              = zeros(size(list,1),3);
            count               = 1;
for run = 1:size(list,1)
    if list(run) > 0
            ctrpts(count,1)     = run;
            ctrpts(count,2)     = y(run);
            ctrpts(count,3)     = list(run);
            count               = count+1;
    end
end
            ctrpts              = ctrpts(1:(count-1),:);
            [fn, pn]            = uiputfile({'*.csv','csv files'},'Select a file');
if ~isequal(fn,0)   
            dlmwrite([pn fn],ctrpts);
end
            cdata.exportdata    = ctrpts;


                                                % --- Executes on button press in settings.
function settings_Callback(~, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to settings (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

global cstate
global chandle

switch cstate
    case {'startst','openst'}
        chandle.oldstate    = cstate;
        cstate              = 'paramst';
        jsetparam;
        
        set(chandle.cbox01,'Enable','off');
        set(chandle.cbox02,'Enable','off');
        set(chandle.cbox03,'Enable','off');
        set(chandle.cbox04,'Enable','off');
        set(chandle.cbox05,'Enable','off');
        set(chandle.cbox06,'Enable','off');
        set(chandle.cbox07,'Enable','off');
        set(chandle.apradio,'Enable','off');
        set(chandle.pradio,'Enable','off');
end


                                                % --- Executes on selection change in showlist.
function showlist_Callback(hObject, ~, handles) %#ok<DEFNU>
                                                % hObject    handle to showlist (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hints: contents = cellstr(get(hObject,'String')) returns showlist contents as cell array
                                                %        contents{get(hObject,'Value')} returns selected item from showlist

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
            num             = cdata.rangesel;
        if ~isequal(num, get(hObject,'Value'))
            axes(handles.ax);
                                                % delete handles
            if isequal(get(chandle.cbox01,'Value'),1)
                delete(chandle.orgdata);
            end
            if isequal(get(chandle.cbox02,'Value'),1)
                delete(chandle.filtdata);
            end
            if isequal(get(chandle.cbox04,'Value'),1)
                delete(chandle.jcurva);
            end
            if isequal(get(chandle.cbox03,'Value'),1)
                delete(chandle.curve);
            end
            if ishandle(chandle.tier1)
                delete(chandle.tier1);
            end
            if ishandle(chandle.tier2)
                delete(chandle.tier2);
            end
            if ishandle(chandle.tier3)
                delete(chandle.tier3);
            end
            delete(chandle.plotmin);
            delete(chandle.plotmax);
            cdata.rangesel  = get(hObject,'Value');

                                                % plot the graphs
            hold on
            num             = cdata.rangesel;
            lst             = cdata.grplist(num,1):cdata.grplist(num,2);
            chandle.plotmin = plot(lst(1), cdata.datmin,'Color', [0.29 0.29 0.29]);
            chandle.plotmax = plot(lst(1), cdata.datmax,'Color', [0.29 0.29 0.29]);
            if isequal(get(chandle.cbox04,'Value'),1)
                chandle.jcurva      = plot(lst,cdata.curve.jcurva(lst)*(cdata.datrange/10),'m','LineWidth',1);
            end
            if isequal(get(chandle.cbox01,'Value'),1)
                chandle.orgdata     = plot(lst, cdata.dat(lst),'color', [0.6 0.6 0.6]);
            end
            if isequal(get(chandle.cbox02,'Value'),1)
                chandle.filtdata    = plot(lst,cdata.curve.sg(lst),'c');
            end
            if isequal(get(chandle.cbox03,'Value'),1)
                chandle.curve       = plot(lst, cdata.curve.y(lst),'g','LineWidth',2);
            end
            if isequal(get(chandle.cbox05,'Value'),1)
                if isequal(num,1)
                    chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
                else
                    chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox06,'Value'),1)
                if isequal(num,1)
                    chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
                else
                    chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
                end
            end
            if isequal(get(chandle.cbox07,'Value'),1)
                if isequal(num,1)
                    chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
                else
                    chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
                end
            end
            if isequal(num,1)
                tot             = size(cdata.curve.ptslist.all,1);
                jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
            else
                tot             = size(cdata.curve.ptslist.tierlist3{num-1},1)+size(cdata.curve.ptslist.tierlist2{num-1},1)+size(cdata.curve.ptslist.tierlist1{num-1},1);
                jFlashingStr(chandle.ctrlpts,['control points: ' jnum2str(tot)],0.7);
            end
            
            hold off
        end
end

                                                % --- Executes during object creation, after setting all properties.
function showlist_CreateFcn(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to showlist (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    empty - handles not created until after all CreateFcns called

                                                % Hint: popupmenu controls usually have a white background on Windows.
                                                %       See ISPC and COMPUTER.


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


                                                % --- Executes on button press in cbox06.
function cbox06_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox06 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox06

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.tier2)
                delete(chandle.tier2);
            end
        else
            
            hold on
            num             = cdata.rangesel;

            if isequal(num,1)
                chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
            else
                chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
            end
            
            hold off
        end
        
end







                                                % --- Executes on button press in cbox07.
function cbox07_Callback(hObject, ~, ~) %#ok<DEFNU>
                                                % hObject    handle to cbox07 (see GCBO)
                                                % eventdata  reserved - to be defined in a future version of MATLAB
                                                % handles    structure with handles and user data (see GUIDATA)

                                                % Hint: get(hObject,'Value') returns toggle state of cbox07

global chandle
global cdata
global cstate

switch cstate
    case {'startst','openst'}
        if isequal(get(hObject,'Value'),0)
            if ishandle(chandle.tier3)
                delete(chandle.tier3);
            end
        else
            
            hold on
            num             = cdata.rangesel;

            if isequal(num,1)
                chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
            else
                chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
            end
            
            hold off
        end
        
end

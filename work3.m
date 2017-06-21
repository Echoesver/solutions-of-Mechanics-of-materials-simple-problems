function varargout = work3(varargin)
%This programme is meant to slove the problems of principal moment ofinertia .
%The principal axises and centroid coordinates are also provided.
%                                          written by ����&��˼��,2017/5/25
% WORK3 MATLAB code for work3.fig
%      WORK3, by itself, creates a new WORK3 or raises the existing
%      singleton*.
%
%      H = WORK3 returns the handle to a new WORK3 or the handle to
%      the existing singleton*.
%
%      WORK3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WORK3.M with the given input arguments.
%
%      WORK3('Property','Value',...) creates
%a new WORK3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before work3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to work3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".

%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help work3

% Last Modified by GUIDE v2.5 19-Jun-2017 16:14:05

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @work3_OpeningFcn, ...
                   'gui_OutputFcn',  @work3_OutputFcn, ...
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


% --- Executes just before work3 is made visible.
function work3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to work3 (see VARARGIN)

% Choose default command line output for work3
handles.output = hObject;

rectanglecount = [];%Ԥ��վ����Ա��洢������Ϣ
handles.rectanglecount = rectanglecount;%����handles

circlecount = [];%Ԥ��վ����Ա��洢Բ����Ϣ
handles.circlecount = circlecount;%����handles

circleringcount = [];%Ԥ��վ����Ա��洢Բ����Ϣ
handles.circleringcount = circleringcount;%����handles

trianglecount = [];%Ԥ��վ����Ա��洢Բ����Ϣ
handles.trianglecount = trianglecount;%����handles

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes work3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = work3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.showimage);
cla reset
grid on
rectanglecount = [];%Ԥ��վ����Ա��洢������Ϣ
handles.rectanglecount = rectanglecount;%����handles

circlecount = [];%Ԥ��վ����Ա��洢Բ����Ϣ
handles.circlecount = circlecount;%����handles

circleringcount = [];%Ԥ��վ����Ա��洢Բ����Ϣ
handles.circleringcount = circleringcount;%����handles

trianglecount = [];%Ԥ��վ����Ա��洢Բ����Ϣ
handles.trianglecount = trianglecount;%����handles

% Update handles structure
guidata(hObject, handles);
set(handles.Xvalue,'string',[]);
set(handles.Yvalue,'string',[]);
set(handles.XX,'string',[]);

set(handles.YY,'string',[]);
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
axes(handles.showimage)
xlabel('x(mm)');
ylabel('y(mm)');
% --- Executes on button press in addrectangle.
function addrectangle_Callback(hObject, eventdata, handles)
% hObject    handle to addrectangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rectanglecount = handles.rectanglecount;                                   %��ȡԤ�����

prompt={'���������½ǵ��xֵ','���������½ǵ��yֵ','���������Ͻǵ�xֵ','���������Ͻǵ�yֵ'};%���봰�������п�ʼ
   name='���������';
   numlines=1;
   defaultanswer={'100','100','800','800'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %��ȡx1,y1,x2,y2ֵԪ��
                                                                           %���봰�������н���
 if isempty(xyz)
     return;                                                      %+ȷ��ȡ��������
 end
x1 = str2double(xyz{1});                                                   %��ȡ��ֵ����Ϊ�Ƿ����뼴��NaN���
y1 = str2double(xyz{2});
x2 = str2double(xyz{3});
y2 = str2double(xyz{4});

if (~((0<=x1)&&(x1<=1000)&&(0<=y1)&&(y1<=1000)&&(0<=x2)&&(x2<=1000)&&(0<=y2)&&(y2<=1000)&&(x1<x2)&&(y1<y2)))||(isnan(x1))||(isnan(y1))||(isnan(x2))||(isnan(y2))%�ݴ��Լ���
    errordlg('�������������ע�ⷶΧ')                                   %warning�Ի���
    beep;
else
    rectanglecount =[rectanglecount;[x1,y1,x2-x1,y2-y1]];                  %��������Ϣ����rectanglecount����
    handles.rectanglecount = rectanglecount;                               %����handles
    guidata(hObject,handles);                                              %����handles
    axes(handles.showimage);                                               %��������ϵ
    hold on;                                                               %����ͼ��
   axis equal
    [a,b] = size(rectanglecount);
    if a >0                                                                %ȷ�����ǿվ���
        for jj =1:a
            rectangle('Position',rectanglecount(jj,:),'facecolor',[0.5 0.5 0.5],'edgecolor',[0.5 0.5 0.5])%������
        end
    end
end
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
% --- Executes on button press in addcircle.
function addcircle_Callback(hObject, eventdata, handles)
% hObject    handle to addcircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

circlecount = handles.circlecount;                                         %��ȡԤ�����

prompt={'������Բ�ĵ�xֵ','������Բ�ĵ�yֵ','�뾶'};                       %���봰�������п�ʼ
   name='���������';
   numlines=1;
   defaultanswer={'500','500','100'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %��ȡx1,y1,rֵԪ��
  if isempty(xyz)                                                          %���봰�������н���
     return;
  end
x1 = str2double(xyz{1});                                                   %��ȡ��ֵ����Ϊ�Ƿ����뼴��NaN���
y1 = str2double(xyz{2});
r  = str2double(xyz{3});

if (~((0<=x1)&&(x1<=1000)&&(0<=y1)&&(y1<=1000)&&(0<r)&&(r<=500)&&(0<=(x1+r))&&((x1+r)<=1000)&&(0<=(y1+r))&&((y1+r)<=1000)&&(0<=(x1-r))&&((x1-r)<=1000)&&(0<=(y1-r))&&((y1-r)<=1000)))||(isnan(x1))||(isnan(y1))||(isnan(r))
                                                                           %�ݴ��Լ���
    errordlg('�������������ע�ⷶΧ')                                   %warning�Ի���
    beep;
else
    circlecount =[circlecount;[x1-r,y1-r,2*r,2*r]];                                  %��������Ϣ����circlecount����
    handles.circlecount = circlecount;                                     %����handles
    guidata(hObject,handles);                                              %����handles
    axes(handles.showimage);                                               %��������ϵ
    hold on;                                                               %����ͼ��
    axis equal
    [a,b] = size(circlecount);
    if a >0                                                                %ȷ�����ǿվ���
        for jj =1:a
            rectangle('Position',circlecount(jj,:),'Curvature',[1,1],'facecolor',[0.5 0.5 0.5],'edgecolor',[0.5 0.5 0.5])%��Բ��
        end
    end
end
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
% --- Executes on button press in addcirclering.
function addcirclering_Callback(hObject, eventdata, handles)
% hObject    handle to addcirclering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
circleringcount = handles.circleringcount;                                         %��ȡԤ�����

prompt={'������Բ�ĵ�xֵ','������Բ�ĵ�yֵ','��������Բ�뾶','��������Բ�뾶'};%���봰�������п�ʼ
   name='���������';
   numlines=1;
   defaultanswer={'500','500','200','100'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %��ȡR,r,x,yֵԪ��
                                                                           %���봰�������н���
 if isempty(xyz)                                                          
     return;                                                               %ȷ��ȡ��������
  end
x = str2double(xyz{1});                                                    %��ȡ��ֵ����Ϊ�Ƿ����뼴��NaN���
y = str2double(xyz{2});
R  = str2double(xyz{3});
r  = str2double(xyz{4});

if (~((0<=x)&&(x<=1000)&&(0<=y)&&(y<=1000)&&(0<R)&&(R<=500)&&(0<r)&&(r<R)&&(0<=(y+R))&&((y+R)<=1000)&&(0<=(y-R))&&((y-R)<=1000)&&(0<=(x-R))&&((x-R)<=1000)&&(0<=(x+R))&&((x+R)<=1000)))||(isnan(x))||(isnan(y))||(isnan(r))||(isnan(R))
                                                                           %�ݴ��Լ���
    errordlg('�������������ע�ⷶΧ')                                   %warning�Ի���
    beep;
else
    circleringcount =[circleringcount;[x,y,R,r]];                          %��������Ϣ����circlecount����
    handles.circleringcount = circleringcount;                             %����handles
    guidata(hObject,handles);                                              %����handles
    axes(handles.showimage);                                               %��������ϵ
    hold on;                                                               %����ͼ��
    axis equal
    [a,b] = size(circleringcount);


    if a >0                                                                %ȷ�����ǿվ���
        for jj =1:a
           qq=circleringcount(jj,3);
           qqq=circleringcount(jj,4);
           R=qqq:0.1:qq;
           theta=0:2*pi/400:2*pi;
           x1=qq'*cos(theta)+circleringcount(jj,1);
           y1=qq'*sin(theta)+circleringcount(jj,2);
           x2=qqq*cos(theta)+circleringcount(jj,1);
           y2=qqq*sin(theta)+circleringcount(jj,2);
           x = [x1(end:-1:1),x2];
           y = [y1(end:-1:1),y2];
           plot(x,y);
           fill(x,y,[0.5,0.5,0.5]);
%            [m,n]=size(x);
%            z=zeros(m,n);
%            c=ones(m,n,3);
%            c(:,:,1)=0.5;
%            c(:,:,2)=0.5;
%            c(:,:,3)=0.5;
%            surf(x,y,z,c);
%            shading interp
%            colormap([0.177 0.177 0.177;0.177 0.177 0.177])
%            axis equal
%            view(2)
        end
    end
end
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);

% --- Executes on button press in begin2compute.
function begin2compute_Callback(hObject, eventdata, handles)
% hObject    handle to begin2compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
circlecount = handles.circlecount;                                         %[x1-r,y1-r,2*r,2*r]
circleringcount = handles.circleringcount;                                 %[x,y,R,r]
rectanglecount = handles.rectanglecount;                                   %[x1,y1,x2-x1,y2-y1]
trianglecount = handles.trianglecount;                                     %[x1,y1,x2,y2,x3,y3]

[c1,~] = size(circlecount);
[cr1,~] = size(circleringcount);
[rec1,~] = size(rectanglecount);
[tri1,~] = size(trianglecount);

Scir = [];                                                                 %Ԥ�����
Scr  = [];
Srec = [];
Stri = [];
LOCcir = [];                                                               %Ԥ�����������
LOCcr  = [];
LOCrec = [];
LOCtri = [];

for ii = 1:c1
    
    LOCcir(ii,1) = circlecount(ii,1) + 0.5*circlecount(ii,3);
    LOCcir(ii,2) = circlecount(ii,2) + 0.5*circlecount(ii,3);
    Scir(ii,1)   = pi*(0.5*circlecount(ii,3))^2;
end
for ii = 1:cr1
    LOCcr(ii,1)  = circleringcount(ii,1);
    LOCcr(ii,2)  = circleringcount(ii,2);
    Scr(ii,1)    = pi*((circleringcount(ii,3)^2-circleringcount(ii,4)^2));
end
for ii = 1:rec1
    LOCrec(ii,1) = rectanglecount(ii,1)+0.5*rectanglecount(ii,3);
    LOCrec(ii,2) = rectanglecount(ii,2)+0.5*rectanglecount(ii,4);
    Srec(ii,1)   = rectanglecount(ii,3)*rectanglecount(ii,4);
end
for ii = 1:tri1
    LOCtri(ii,1) =  (trianglecount(ii,1)+trianglecount(ii,3)+trianglecount(ii,5))/3;
    LOCtri(ii,2) =  (trianglecount(ii,2)+trianglecount(ii,4)+trianglecount(ii,6))/3;
    Stri(ii,1)   = abs((trianglecount(ii,1)*trianglecount(ii,4)+trianglecount(ii,3)*trianglecount(ii,6)+trianglecount(ii,5)*trianglecount(ii,2)-trianglecount(ii,1)*trianglecount(ii,6)-trianglecount(ii,3)*trianglecount(ii,2)-trianglecount(ii,5)*trianglecount(ii,4))/2);
    %S=abs((x1*y2+x2*y3+x3*y1-x1*y3-x2*y1-x3*y2)/2)
end
Sall = sum(Scir)+sum(Scr)+sum(Srec)+sum(Stri); 
%����Ϊ�վ���ֵ�����ⱨ��
if isempty(Scir)
    Scir = [0];                                                       
end
if isempty(LOCcir)
    LOCcir = [0 0];
end
if isempty(Scr)
    Scr = [0];
end
if isempty(LOCcr)
    LOCcr = [0 0];
end
if isempty(Srec)
    Srec = [0];
end
if isempty(LOCrec)
    LOCrec = [0 0];
end
if isempty(Stri)
    Stri = [0];
end
if isempty(LOCtri)
    LOCtri = [0 0];
end
%����Ϊ�վ���ֵ�����ⱨ��
Xc   = (sum(Scir.*LOCcir(:,1))+sum(Scr.*LOCcr(:,1))+sum(Srec.*LOCrec(:,1))+sum(Stri.*LOCtri(:,1)))/Sall;
Yc   = (sum(Scir.*LOCcir(:,2))+sum(Scr.*LOCcr(:,2))+sum(Srec.*LOCrec(:,2))+sum(Stri.*LOCtri(:,2)))/Sall;
handles.Xcvalue = Xc;
handles.Ycvalue = Yc;
guidata(hObject, handles);
set(handles.Xvalue,'String',num2str(Xc));
set(handles.Yvalue,'String',num2str(Yc));                                  %��GUI����ʾ
axes(handles.showimage);
hold on;
axis equal;
plot([0,1000],[Yc,Yc],'b');                                                    %�����Ļ�������ϵ
plot([Xc,Xc],[0,1000],'b');
text(Xc,Yc,'\fontsize{16}\leftarrow\fontname{����}����')
if isempty(rectanglecount)
    rectanglecount=[0,0,0,0];
end
if isempty(circlecount)
    circlecount=[0,0,0,0];
end
if isempty(circleringcount)
    circleringcount=[0,0,0,0];
end
if isempty(trianglecount)
    trianglecount=[0,0,0,0,0,0];
end
%���ι��Ծأ����Ի�
Ixc_rectangle=rectanglecount(:,3).*(rectanglecount(:,4).^3)./12;
Iyc_rectangle=rectanglecount(:,4).*(rectanglecount(:,3).^3)./12;
Ix_rectangle=Ixc_rectangle+((LOCrec(:,2)-Yc).^2).*Srec;
Iy_rectangle=Iyc_rectangle+((LOCrec(:,1)-Xc).^2).*Srec;
Ixy_rectangle=(LOCrec(:,1)-Xc).*(LOCrec(:,2)-Yc).*Srec;
%Բ�ι��Ծأ����Ի�
Ixc_circle=((0.5*circlecount(:,3)).^4).*pi./4;
Iyc_circle=((0.5*circlecount(:,3)).^4).*pi./4;
Ix_circle=Ixc_circle+((LOCrec(:,2)-Yc).^2).*Scir;
Iy_circle=Iyc_circle+((LOCrec(:,1)-Xc).^2).*Scir;
Ixy_circle=(LOCrec(:,1)-Xc).*(LOCrec(:,2)-Yc).*Scir;
%Բ�����Ծأ����Ի�
Ixc_circlering=(circleringcount(:,3).^4-circleringcount(:,4).^4).*pi./4;
Iyc_circlering=(circleringcount(:,3).^4-circleringcount(:,4).^4).*pi./4;
Ix_circlering=Ixc_circlering+((LOCrec(:,1)-Yc).^2).*Scr;
Iy_circlering=Iyc_circlering+((LOCrec(:,1)-Xc).^2).*Scr;
Ixy_circlering=(LOCrec(:,1)-Xc).*(LOCrec(:,2)-Yc).*Scr;
%�����ι��Ծأ����Ի�
for ii=1:length(Stri)
    lenthofside(ii,1)=sqrt((trianglecount(ii,3)-trianglecount(ii,1))^2+(trianglecount(ii,4)-trianglecount(ii,2))^2);
    lenthofside(ii,2)=sqrt((trianglecount(ii,5)-trianglecount(ii,1))^2+(trianglecount(ii,6)-trianglecount(ii,2))^2);
    lenthofside(ii,3)=sqrt((trianglecount(ii,3)-trianglecount(ii,5))^2+(trianglecount(ii,4)-trianglecount(ii,6))^2);
    b(ii,1)=max(lenthofside(ii,:));
    c(ii,1)=min(lenthofside(ii,:));
    h(ii,1)=2.*Stri(ii,1)./b(ii,1);
end
%�ж��Ϸ������·�
fan=[];
for ii=1:length(Stri)
    pp=[trianglecount(ii,2),trianglecount(ii,4),trianglecount(ii,6)]
ymin=min(pp);
ymax=max(pp);
ymed=sum(pp)-ymin-ymax;
if ymed==ymin
    fan=[fan,1];%�Ϸ�
elseif ymed==ymax
    fan=[fan,-1];%�·�
end
end
%�ж����
Ixc_triangle=b.*(h.^3)./36;
Iyc_triangle=h.*(b.^3-b.^2.*c+b.*c.^2)./36;
for ii=1:length(Stri)
    if fan(ii)==1
        Ixcyc_triangle(ii,1)=(b(ii,1)-2.*c(ii,1)).*b(ii,1).*(h(ii,1).^2)./72;
    elseif fan(ii==-1)
        Ixcyc_triangle(ii,1)=-7*(b(ii,1)-2.*c(ii,1)).*b(ii,1).*(h(ii,1).^2)./72;
    end
end

Ix_triangle=Ixc_triangle+((LOCrec(:,1)-Yc).^2).*Stri;
Iy_triangle=Iyc_triangle+((LOCrec(:,1)-Xc).^2).*Stri;
Ixy_triangle=Ixcyc_triangle+(LOCrec(:,1)-Xc).*(LOCrec(:,2)-Yc).*Stri;
if isnan(Ix_triangle)
    Ix_triangle=[0];
end
if isnan(Iy_triangle)
    Iy_triangle=[0];
end
if isnan(Ixy_triangle)
    Ixy_triangle=[0];
end
%���
Ix=sum(Ix_rectangle+Ix_circle+Ix_circlering+Ix_triangle);
Iy=sum(Iy_rectangle+Iy_circle+Iy_circlering+Iy_triangle);
Ixy=sum(Ixy_rectangle+Ixy_circle+Ixy_circlering+Ixy_triangle);
Ix0=(Ix+Iy)/2+0.5*sqrt((Iy-Ix)^2+4*Ixy^2);
Iy0=(Ix+Iy)/2-0.5*sqrt((Iy-Ix)^2+4*Ixy^2);
if Ix==Iy
    alpha=pi/4;
else
    alpha=0.5*atan(-2*Ixy/(Ix-Iy));
end
alpha2=alpha+pi/2;
xxx=0:0.01:1000;
xxxx=0:0.01:1000;
yyy=tan(alpha)*(xxx-Xc)+Yc;
yyyy=tan(alpha2)*(xxxx-Xc)+Yc;
axes(handles.showimage);
hold on
plot(xxx,yyy,'k');
plot(xxxx,yyyy,'k');
axis equal
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
set(handles.XX,'String',num2str(Ix0));
set(handles.YY,'String',num2str(Iy0)); 

function Xvalue_Callback(hObject, eventdata, handles)
% hObject    handle to Xvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xvalue as text
%        str2double(get(hObject,'String')) returns contents of Xvalue as a double


% --- Executes during object creation, after setting all properties.
function Xvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Yvalue_Callback(hObject, eventdata, handles)
% hObject    handle to Yvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yvalue as text
%        str2double(get(hObject,'String')) returns contents of Yvalue as a double


% --- Executes during object creation, after setting all properties.
function Yvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XX_Callback(hObject, eventdata, handles)
% hObject    handle to XX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XX as text
%        str2double(get(hObject,'String')) returns contents of XX as a double


% --- Executes during object creation, after setting all properties.
function XX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in addcircle.
function addtriangle_Callback(hObject, eventdata, handles)
% hObject    handle to addcircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
trianglecount = handles.trianglecount;                                         %��ȡԤ�����

prompt={'��һ�����xֵ��ֻ���������ƽ���ں���������Σ�','�������һ�����yֵ','������ڶ������xֵ','������ڶ������yֵ','��������������xֵ','��������������yֵ'};                       %���봰�������п�ʼ
   name='���������';
   numlines=1;
   defaultanswer={'100','100','150','200','400','100'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %��ȡx��yֵԪ��
if  isempty(xyz)                                                           %���봰�������н���
    return;                                                     %ȷ�����ȡ��ʱ������
end
x1 = str2double(xyz{1});                                                   %��ȡ��ֵ����Ϊ�Ƿ����뼴��NaN���
y1 = str2double(xyz{2});
x2 = str2double(xyz{3});                                                   
y2 = str2double(xyz{4});
x3 = str2double(xyz{5});                                                   
y3 = str2double(xyz{6});
a=sqrt((x2-x1)^2+(y2-y1)^2);
b=sqrt((x2-x3)^2+(y2-y3)^2);
c=sqrt((x3-x1)^2+(y3-y1)^2);
if (~((0<=x1)&&(x1<=1000)&&(0<=y1)&&(y1<=1000)&&(0<=x2)&&(x2<=1000)&&(0<=y2)&&(y2<=1000)&&(0<=x3)&&(x3<=1000)&&(0<=y3)&&(y3<=1000)&&((a+b)>c)&&((a+c)>b)&&((c+b)>a)))||(isnan(x1))||(isnan(y1))||(isnan(x2))||(isnan(y2))||(isnan(x3))||(isnan(y3))
                                                                           %�ݴ��Լ���
    errordlg('�������������ע�ⷶΧ')                                   %warning�Ի���
    beep;
else
    trianglecount =[trianglecount;[x1,y1,x2,y2,x3,y3]];                    %��������Ϣ����trianglecount����
    handles.trianglecount = trianglecount;                                 %����handles
    guidata(hObject,handles);                                              %����handles
    axes(handles.showimage);                                               %��������ϵ
    hold on;                                                               %����ͼ��
    axis equal
    [aa,bb] = size(trianglecount);
    xloc = zeros(aa,3);
    yloc = zeros(aa,3);
    for ii = 1:aa
        xloc(ii,1) = trianglecount(ii,1);
        xloc(ii,2) = trianglecount(ii,3);
        xloc(ii,3) = trianglecount(ii,5);
        yloc(ii,1) = trianglecount(ii,2);
        yloc(ii,2) = trianglecount(ii,4);
        yloc(ii,3) = trianglecount(ii,6);
    end
    if a >0                                                                %ȷ�����ǿվ���
        for jj =1:aa
            fill(xloc(jj,:),yloc(jj,:),[0.5 0.5 0.5])                      %��������
        end
    end
end
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
% xlabel('x');
% ylabel('y');
% --- Executes during object creation, after setting all properties.
function showimage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to showimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate showimage
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
xlabel('x(mm)');
ylabel('y(mm)');


function YY_Callback(hObject, eventdata, handles)
% hObject    handle to YY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YY as text
%        str2double(get(hObject,'String')) returns contents of YY as a double


% --- Executes during object creation, after setting all properties.
function YY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gzg1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
imshow('ˮ����.png');


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('ˮ����.png');
% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function work3back_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work3back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('ˮ����.png');
% Hint: place code in OpeningFcn to populate work3back

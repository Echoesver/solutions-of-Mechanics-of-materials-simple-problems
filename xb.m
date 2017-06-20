function [Fsy,Mz,v,x]=xb(L,F,q,M,E,I)
%��������������ļ�������ء��Ӷ�
x=0:0.01:L;
[~,Fnum]=size(F);
[~,qnum]=size(q);
Fsy=zeros(1,length(x));
Mz=zeros(1,length(x));
v=zeros(1,length(x));

% %����̶���Լ����Fy,M0
% F1=0;
% for k=1:qnum
%     F1=F1+(q(2,k)-q(1,k))*q(3,k);
% end
% Fy=-sum(F(1,:))-F1;
% M1=0;
% M2=0;
% for k=1:qnum
%     M1=M1+(q(2,k)-q(1,k))^2*q(3,k)*0.5;
% end
% for k=1:Fnum
%     M2=M2+F(1,k)*F(2,k);
% end
% M0=-M1-M2-sum(M(1,:));
% F=[F(1,:),Fy;F(2,:),0];
% M=[M(1,:),M0;M(2,:),0];
[~,Fnum]=size(F);
[~,Mnum]=size(M);

%���㼯����F���µ�Fsy��Mz
for k=1:Fnum
    for m=1:length(x)
        if x(m)<F(2,k)
        Fsy(m)=Fsy(m)+F(1,k);
        Mz(m)=Mz(m)+F(1,k)*(F(2,k)-x(m));
        end
    end
end

%����ֲ���q���µ�Fsy��Mz��v
for k=1:qnum
    for m=1:length(x)
        if (q(1,k)<=x(m))&&(x(m)<=q(2,k))
            Fsy(m)=Fsy(m)+q(3,k)*(q(2,k)-x(m));
            Mz(m)=Mz(m)+q(3,k)*((q(2,k)-x(m))^2)*0.5;
        elseif x(m)<q(1,k)
            Fsy(m)=Fsy(m)+q(3,k)*(q(2,k)-q(1,k));
            Mz(m)=Mz(m)+q(3,k)*(q(2,k)-q(1,k))*((q(2,k)+q(1,k))/2-x(m));
        elseif x(m)>q(2,k)
            Mz(m)=Mz(m);
            Fsy(m)=Fsy(m);
        end
    end
end

%���㼯����ż���µ�Mz
for m=1:length(x)
    for k=1:Mnum
        if M(2,k)>=x(m)
            Mz(m)=Mz(m)+M(1,k);
        end
    end
end
% Mz=-Mz;
% Fsy=-Fsy;

%�����Ӷ�
n=ceil(L*100);
A=zeros(n+2,n+2);
v=[0,v];
for p=1:n
    A(p,p)=1;
    A(p,p+1)=-2;
    A(p,p+2)=1;
end
A(n+1,2)=1;
A(n+2,1)=1;
A(n+2,3)=-1;
B=[Mz(1:(end-1)),0,0];
B=(1/100)^2/(E*I)*B;
B=B';
v=A\B;
v=v(2:end);
v=v';


% %��������ͼ
% subplot(3,1,1);
% hold on;
% plot(x,Fsy);
% title('����ͼ');
% ax = gca;
% ax.XAxisLocation = 'origin';%�涨x��Ϊԭ��λ��
% 
% 
% %�������ͼ
% subplot(3,1,2);
% plot(x,Mz);
% title('���ͼ');
% ax = gca;
% ax.XAxisLocation = 'origin';%�涨x��Ϊԭ��λ��
% 
% 
% %����������
% subplot(3,1,3);
% plot(x,v);
% title('�Ӷ�����');
% ax = gca;
% ax.XAxisLocation = 'origin';%�涨x��Ϊԭ��λ��
% 

end
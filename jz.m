function [Fsy,Mz,v,x]=jz(a,b,L,F,q,M,E,I)
%�����֧���ļ�������ء��Ӷ�
x=0:0.01:L;
[~,Fnum]=size(F);
[~,qnum]=size(q);
[~,Mnum]=size(M);
Fsy=zeros(1,length(x));
Mz=zeros(1,length(x));
v=zeros(1,length(x));

%����̶���Լ����F1,F2
M1=0;
M2=0;
F0=0;
for k=1:Fnum
    if F(2,k)<a
        M1=M1-F(1,k)*(a-F(2,k));
    elseif F(2,k)>a
        M1=M1+F(1,k)*(F(2,k)-a);
    end
end
for k=1:qnum
    if (q(1,k)+q(2,k))/2<a
        M2=M2-(q(2,k)-q(1,k))*q(3,k)*(a-(q(1,k)+q(2,k))/2);
    elseif (q(1,k)+q(2,k))/2>a
        M2=M2+(q(2,k)-q(1,k))*q(3,k)*((q(1,k)+q(2,k))/2-a);
    end
end
F2=(-M1-M2-sum(M(1,:)))/(b-a);
for k=1:qnum
    F0=F0+(q(2,k)-q(1,k))*q(3,k);
end
F1=-sum(F(1,:))-F0-F2;

F=[F(1,:),F1,F2;F(2,:),a,b];
[~,Fnum]=size(F);

%���㼯����F���µ�Fsy��Mz
for m=1:length(x)
    for k=1:Fnum
        if x(m)>=F(2,k)
        Fsy(m)=Fsy(m)+F(1,k);
        Mz(m)=Mz(m)-F(1,k)*(x(m)-F(2,k));
        end
    end
end

%����ֲ���q���µ�Fsy��Mz
for k=1:qnum
    for m=1:length(x)
        if (q(1,k)<=x(m))&&(x(m)<q(2,k))
            Fsy(m)=Fsy(m)+q(3,k)*(x(m)-q(1,k));
            Mz(m)=Mz(m)-q(3,k)*((x(m)-q(1,k))^2)*0.5;
        elseif x(m)>=q(2,k)
            Fsy(m)=Fsy(m)+q(3,k)*(q(2,k)-q(1,k));
            Mz(m)=Mz(m)-q(3,k)*(q(2,k)-q(1,k))*(x(m)-(q(2,k)+q(1,k))/2);
        end
    end
end

%���㼯����ż���µ�Mz
for m=1:length(x)
    for k=1:Mnum
        if M(2,k)<=x(m)
            Mz(m)=Mz(m)+M(1,k);
        end
    end
end

Mz=-Mz;
Fsy=-Fsy;
%�����Ӷ�
n=ceil(L*100);
A=zeros(n+1,n+1);
for p=1:n-1
    A(p,p)=1;
    A(p,p+1)=-2;
    A(p,p+2)=1;
end
A(n,(a*100+1))=1;
A(n+1,(b*100+1))=1;
B=[Mz(2:(end-1)),0,0];
B=(1/100)^2/(E*I)*B;
B=B';
v=A\B;
v=v';
% %��������ͼ
% subplot(3,1,1);
% hold on;
% plot(x,Fsy);
% % title('����ͼ');
% ax = gca;
% ax.XAxisLocation = 'origin';%�涨x��Ϊԭ��λ��
% 
% 
% %�������ͼ
% subplot(3,1,2);
% hold on
% plot(x,Mz);
% % title('���ͼ');
% ax = gca;
% ax.XAxisLocation = 'origin';%�涨x��Ϊԭ��λ��
% 
% 
% %����������
% subplot(3,1,3);
% plot(x,v);
% % title('�Ӷ�����');
% ax = gca;
% ax.XAxisLocation = 'origin';%�涨x��Ϊԭ��λ��

end
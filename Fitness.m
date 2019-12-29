function[F,AvgJ]=Fitness(O,x_ref,z_ref,theta_ref,a,b,c)
w1=0.8;
w2=1.5;
w3=2.0;
w4=2.0;
Ts=0.1;
l=1.28;
Npop=40;
n=5;%prediction horizon or no of time samples
pmo=0.1;%initial mutation rate
delvmax=(0.05); % m/s
delphimax=0.02;% rad/s
delomegamax=0.015;% rad/s2
F=zeros(Npop,1);%fitness evaluation
J=zeros(Npop,1);
%%STATES%%
theta_veh=zeros(n,1);%path angle
x_veh=zeros(n,1);
z_veh=zeros(n,1);
de=0;
te=0;
%%%%%%%
for i=1:Npop
theta_veh(1)=(O(i).o(1,1)*tan(O(i).o(2,1)/l));
x_veh(1)=O(i).o(1,1)*cos(theta_veh(1));
z_veh(1)=O(i).o(1,1)*sin(theta_veh(1));

% theta_veh(1)=theta_ref(1);
% x_veh(1)=x_ref(1);
% z_veh(1)=z_ref(1);

V=O(i).o(1,1);%v is v+ delv
Phi=O(i).o(2,1);%Phi is Phi+ delPhi
for j=2:5   
V=V+O(i).o(1,j);
Phi=Phi+O(i).o(2,j);
theta_veh(j)=[theta_veh(j-1)+(V*tan(Phi)*Ts/l)];
x_veh(j)=[x_veh(j-1)+V*cos(theta_veh(j))*Ts];
z_veh(j)=[z_veh(j-1)+V*sin(theta_veh(j))*Ts];
end
%% Theta error
theta_err=theta_veh-theta_ref;%to minimisde in cost func
% d_err
d_err=zeros(n,1);
for k=1:n
 d_err(k)=abs((z_veh(k)*(2*a*z_ref(k)+b) -x_veh(k)+(x_ref(k)-2*a*((z_ref(k))^2)-b*(z_ref(k))))/(sqrt(((2*a*z_ref(k))+b)^2)+1));
end
%%%%%%%%%%%%%%%%%%%% COST FUNCTION  %%%%%%%%%%%%%%%%%
J(i)=(w1*((norm(d_err))^2)) +(w2*((norm(theta_err))^2))+(w3*((norm(O(i).o(2,1:5)))^2))+(w4*((norm(O(i).o(1,1:3)))^2));
F(i)=(1/(1+J(i)));
de=de +(norm(d_err));
te=te +norm(theta_err);
end
%Normalising Fitness between 0-100
% J
% avde=sum(de)/Npop
% avte=sum(te)/Npop
AvgJ=sum(J)/Npop;
% d=max(F)-min(F);
% F=F-min(F);
% F=F/d;
% F=floor(100*F);
end
function[x_ref,z_ref,theta_ref,a,b,c]=refpath()
z_ref=[10 43 95 158 250]';
x=[3 6 9 12 15]';
p=polyfit(z_ref,x,2);
a=p(1);
b=p(2);
c=p(3);
x_ref=polyval(p,z_ref);
n=size(z_ref);
theta_ref=zeros(5,1);
for i=1:n
theta_ref(i)=atan((1/((2*p(1)*z_ref(i)))+p(2)));
end
close 
x=[-175 -80 -20 50 140 185 220 180 120 30 -10 -180 -230 -250 -260	-270 -240 -175]
z=[-260	-330 -260 -190 -130	-45	40 140 160 180 160 190 100 10 -60 -90 -280 -260]
figure
plot(x,z,'-mo','color','k','LineWidth',1)
title('Reference Path')
xlabel('X') 
ylabel('Z') 
legend({'Road refrence path',},'Location','southeast')
end
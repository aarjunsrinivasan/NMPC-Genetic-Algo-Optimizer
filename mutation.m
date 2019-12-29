function[Onew]=mutation(Onew)
n=5;
pmo=0.1;%initial mutation rate
gamma=0.2;%learning rate
pm=pmo;
Npop=10;
w1=0.8;w2=1.5;w3=2.0;w4=2.0;
Ts=0.1;
l=1.28;
n=20;%prdiction horizon or no of time samples
pmo=0.1;%initial mutation rate
delvmax=(0.05); % m/s
delphimax=0.02;% rad/s
delomegamax=0.015;% rad/s2
for i=1:Npop
     for j=1:n
         if(rand<pm)
         Onew(i).o(1,j)=(randi(10000*[-delvmax delvmax],1))/10000;
         if Onew(i).o(2,j)>0
             sign=1;
         else 
             sign=-1;
         end
         Onew(i).o(2,j)= (randi(10000*[-delphimax delphimax],1))/10000;
         if(j>1)
           while ~(((-delomegamax) <=(Onew(i).o(2,j)-Onew(i).o(2,(j-1)))&&(Onew(i).o(2,j)-Onew(i).o(2,(j-1)))<=delomegamax))  
               Onew(i).o(2,j)= (randi(10000*[-delphimax delphimax],1))/10000;
           end
         end
         if((sign)*(Onew(i).o(2,j))<0)
             Onew(i).o(2,j)=-Onew(i).o(2,j);
         end
         pm=(1+((1/pm)-1)*exp(-gamma*rand))^(-1);
         end
     end
end
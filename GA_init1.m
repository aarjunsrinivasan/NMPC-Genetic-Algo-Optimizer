function[O]=GA_init1()
w1=0.8;
w2=1.5;
w3=2.0;
w4=2.0;
Ts=0.1;
l=1.28;
Npop=40;
n=20;%prdiction horizon or no of time samples
pmo=0.1;%initial mutation rate
delvmax=(0.05); % m/s
delphimax=0.02;% rad/s
delomegamax=0.015;% rad/s2
delv=(randi(10000*[-delvmax delvmax],1,n))/10000;
delphi= (randi(10000*[-delphimax delphimax],1,n))/10000;
i=1;
while(i<(n))
    if ~(((-delomegamax) <=(delphi(i+1)-delphi(i)))&&((delphi(i+1)-delphi(i))<=delomegamax))
        delphi= (randi(10000*[-delphimax delphimax],1,n))/10000;
        i=1;
    else
        i=i+1;
    end   
end
O1=[delv;delphi];%chromosome
O=struct('o',O1);
for j=2:Npop
    delv=(randi(10000*[-delvmax delvmax],1,n))/10000;
    delphi= (randi(10000*[-delphimax delphimax],1,n))/10000;
    %%%%%%%%%%%%%
    i=1;
    while(i<(n))
        if ~(((-delomegamax) <=(delphi(i+1)-delphi(i)))&&((delphi(i+1)-delphi(i))<=delomegamax))
          delphi= (randi(10000*[-delphimax delphimax],1,n))/10000;
          i=1;
        else
          i=i+1;
        end   
     end
    %%%%%%%%%%%%%%%%
    O1=[delv;delphi];
    O=[O;struct('o',O1)];
end
end


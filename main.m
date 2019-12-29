O=GA_init1();
[x_ref,z_ref,theta_ref,a,b,c]=refpath();
Javg=zeros(40,1);
[F,AvgJ]=Fitness(O,x_ref,z_ref,theta_ref,a,b,c);
Onew=tournament(O,F);
Onew=mutation(Onew);
Javg(1)=AvgJ;
for l=1:39
[F,AvgJ]=Fitness(Onew,x_ref,z_ref,theta_ref,a,b,c);
Onew=tournament(Onew,F);
Onew=mutation(Onew);
Javg(l+1)=AvgJ;
end

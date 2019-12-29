function[Onew]=tournament(O,F)
Npop=40;
Sel=randi([1,Npop],20,1);%
[m,i]=max(F(Sel));
Sel(i);
Onew=O(Sel(i));
for l=2:Npop
    Sel=randi([1,Npop],10,1);%
    [m,i]=max(F(Sel));
    Sel(i);
    Onew=[Onew;O(Sel(i))];
end


      
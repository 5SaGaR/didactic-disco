%************************************************%
%Name:Kasturi GSagar
%Roll No: 19IM30011
%OHM 39003
%Genetic Algorithm: In-Class Feb 10, 2022
%Author: Internet Source and Akhilesh Kumar akumar@iem.iitkgp.ac.in
%************************************************%
clc
clear all
close all
rng default %control for randome number generator
format long
%%Function Bounds
m=1; % no of variables
LB=0;
UB=1024;



n=10;
w=0.55;
wd=0.9;
c1=0.3;
c2=0.3;
maxite=300;
maxrun=5;



for run=1:maxrun



% PSO initialization
for i=1:n
x0(i)=round(LB+rand()*(UB-LB));
end
x=x0; 
v=0.01*x0; % initial velocity
for i=1:n
f0(i,1)=ofun(x0(i));
end
[fmax0,index0]=max(f0);
pbest=x0; % initial pbest
gbest=x0(index0); % initial gbest



iter=1;
while iter<=maxite
w=w*wd; %updating inertia weight
% pso velocity updates
for i=1:n
v(i)=w*v(i)+c1*rand()*(pbest(i)-x(i))...
+c2*rand()*(gbest(1)-x(i));
end
% pso position update
for i=1:n
x(i)=round(x(i)+v(i));
end
% handling boundary violations
for i=1:n
if x(i)<LB
x(i)=LB;
elseif x(i)>UB
x(i)=UB;
end
end
% evaluating fitness
for i=1:n
f(i,1)=ofun(x(i));
end
% updating pbest and fitness
for i=1:n
if f(i,1)>f0(i,1)
pbest(i)=x(i);
f0(i,1)=f(i,1);
end
end
[fmax,index]=max(f0); % finding out the best particle
ffmax(iter,run)=fmax; % storing best fitness
ffite(run)=iter; % storing iteration count

% updating gbest and best fitness
if fmax>fmax0
gbest=pbest(index);
fmax0=fmax;



end

%displaying iterative results
if iter==1
fprintf('Iteration Best particle Objective fun\n');
end
fprintf('%8g %8g %8.4f\n',iter,index,fmax0);
iter=iter+1;

end

gbest;
fvalue=ofun(gbest);
fff(run)=fvalue;
Rgbest(run,:)=gbest;
end



[bestfun,bestrun]=max(fff);
best_variables=Rgbest(bestrun,:);



% PSO convergence characteristic
plot(ffmax(1:ffite(bestrun),bestrun),'-r');
xlabel('Iteration');
ylabel('Fitness');
title('PSO convergence characteristic')



figure(2);
plot(x0,f0, 'bo');
xlabel('x');
ylabel('F(x)');
title('Data for last generation');
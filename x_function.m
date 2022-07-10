function y = x_function(x)
D=60;
r_D=0.009;
K=0.15;
Loan_size =[10 25 4 11 18 3 17 15 9 10];
Interest = [0.021 0.022 0.021 0.027 0.025 0.026 0.023 0.021 0.028 0.022];
Loss= [0.0002 0.0058 0.0001 0.0003 0.0024 0.0002 0.0058 0.0002 0.001 0.001];
str=dec2bin(x);
for i = 1:(10-strlength(str))
str = "0"+str;
end
% str = '0'*(10-strlength(str))+str;
chr = convertStringsToChars(str);
x1=zeros(1,10);
for i=1:strlength(str)
x1(i)=str2num(chr(i));
end
%% Total Loan
L = sum(Loan_size.*x1);

%% Loan revenue
Revenue= sum(((Loan_size.*x1).*(Interest.*x1)-(Loss.*x1)));  

%% Transaction cost
Tcost=0.01*sum((1-K)*D*x1-Loan_size.*x1);
%% Demand deposit
Beta = r_D*D;
%% Fx
y=Revenue+Tcost-Beta-sum(Loss.*x1);
%% Penalty
if ((1-K)*D<L)
y = y-25;
end
end
  
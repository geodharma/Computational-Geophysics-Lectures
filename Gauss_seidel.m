clc,clear all,close all;
%Inisiasi awal
kmax=100; tol=1e-3;

%Soal
A=[-5 3 0 0 0;3 -6 3 0 0;3 -3 -3 3 0;0 0 3 -6 3;0 0 0 3 -5];
b = [-80 0 0 60 0]';
x0=[0;0;0;0;0];  %tebakan awal

%A=[1 4 9 16;4 9 16 25; 9 16 25 36;16 25 36 49]
%b=[30 54 86 126]';
%x0=[0 0 0 0]';

%Dekomposisi Matriks A menjadi D,L,U
U=-triu(A,1);
L=-tril(A,-1);
D=diag(diag(A));

Tgs=(D-L)\U;   cg = (D-L)\b;
x(:,1)=x0; Err(:,1)=0;

disp('iter      x1          x2        x3         x4        x5           Err')
for k=1:kmax    
    x(:,k+1)= Tgs*x(:,k)+ cg;
    Err=norm((x(:,k+1)-x(:,k)),1);
    pause(0.8)
    fprintf('%3i %11.5f%11.5f%11.5f%11.5f%11.5f%11.5f\n',k,x(:,k+1),Err)
    if Err<tol
        break
      end
end
x=x(:,end)

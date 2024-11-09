clc,clear all,close all;
%Inisiasi awal
kmax=100; tol=1e-5;

%Soal
%A=[-5 3 0 0 0;3 -6 3 0 0;3 -3 -3 3 0;0 0 3 -6 3;0 0 0 3 -5];
%b = [-80 0 0 60 0]';
%x0=[20;7;-5;-17;-10];   %tebakan awal
%A=[12 -2 3 1;-2 15 6 -3;1 6 20 -4;0 -3 2 9];
%b = [0 0 20 0]';
x0=[0;0;0;0]; %tebakan awal
A=zeros(9);
n=size(A,1);
for i=1:n
    A(i,i)=-4;
    
    if i>3
        A(i,i-3)=1;
    end
    if i<7
        A(i,i+3)=1;
    end
          
end
for i=1:n
    A(i,i+1)=1
end
A(3,4)=0; A(5,6)=0;
%Dekomposisi Matriks A menjadi D,L,U
U=-triu(A,1);
L=-tril(A,-1);
D=diag(diag(A));
 
T=inv(D)*(L+U); c= inv(D)*b;
 
x(:,1)=x0; Err(:,1)=0;

disp('iter      x1          x2        x3         x4          Err')
for k=1:kmax    
    x(:,k+1)= T*x(:,k)+ c;
    Err=norm((x(:,k+1)-x(:,k)),1);
    pause(0.6)
    fprintf('%3i %11.5f%11.5f%11.5f%11.5f%11.5f\n',k,x(:,k+1),Err)
    if Err<tol               
        break
      end
end
x=x(:,end)



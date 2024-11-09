clc,clear all, close all;
disp('--Program menyelesaikan SPL Ax=b menggunakan LU Decomposition--')
disp('input: matriks A & b')
%A=[2 8 6;4 2 -2;3 -2 1]
%b=[20; -2; 12]
A=[1 -2 2;2 1 -3;3 -3 -1]
b=[1 5 2]'
%L=Matirks segitiga bawah
%U=Matriks segitiga atas
n=size(A,1);
L=eye(n); U=zeros(n,n);% Inisialisasi

for i=1:n,
    U(i,i)= A(i,i)-L(i,1:i-1)*U(1:i-1,i)
    for j=i+1:n,
        U(i,j)=A(i,j)-L(i,1:i-1)*U(1:i-1,j)
        L(j,i)=(A(j,i)-L(j,1:i-1)*U(1:i-1,i))/U(i,i)
    end
end

%Ax=b menjadi LUx=b

%Menyelesaikan Ly=b dengan subtitusi ke depan
y=zeros(n,1);
y(1)=b(1);
for i=2:n,
y(i)=b(i)-L(i,1:i-1)*y(1:i-1);
end
y
%Menyelesaiankan Ux=y dengan subtitusi ke belakang
x=zeros(n,1);
x(n)=y(n)/U(n,n);
for i=n-1:-1:1,
    x(i)=(y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
end
x
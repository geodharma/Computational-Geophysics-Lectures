clc, clear all, close all;
disp('---Program menyelesaikan SPL Ax=b menggunakan Metode Eliminasi Gauss---')
disp('input: matriks A & b')
%input matriks A & b
A=[-5 1 16 -12; 0 -3 10 -5;1 0 -4 3;4 8 -24 -3]
b=[-28;-2;6;1]
%A=[1 3 6;2 -1 1;4 -2 3]
%b=[19; -2; -1];

%A=[1 2 3 4; -1 2 1 3;2 -1 1 5;1-2 1 3 1];
%b=[1 1 0 -2]';
%A=[1 3 6;2 -1 1;4 -2 3]
%b=[19; -2;-1]
%Tahapan mencari vektor X :
disp('1.)Tahap Eliminasi ke depan (forward elimination)')
k=size(A,1)
for i=1:k-1
    for j=i+1:k
        eps=A(j,i)/A(i,i)
        A(j,i:k)=eps*A(i,i:k)-A(j,i:k)
        b(j)=eps*b(i)-b(j)
    end
end
Ab=[A b]%Hasil eliminasi ke depan diAugmentasi

disp('2.)Tahap Subtitusi ke belakang (back subtitution)')
x=zeros(k,1);
for i=k:-1:1
    x(i)=(Ab(i,end)-Ab(i,i+1:k)*x(i+1:k))/Ab(i,i)
end
x
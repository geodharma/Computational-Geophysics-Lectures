clc,clear all,close all;
disp('---Program menyelesaikan SPL Ax=b menggunakan Metode Gauss-Jordan---')
disp('input: matriks A & b')
A=[1 3 6;2 -1 1;4 -2 3]
b=[19; -2; -1]

Ab=[A b]
n = size(A, 1)
for i = 1:n
    Ab(i,:) = Ab(i,:) / Ab(i,i)
    for j = 1:n
        if i ~= j;
            Ab(j,:) = Ab(j,:) - Ab(i,:) * Ab(j,i)
        end
    end
    pause(0.5)
end

x=Ab(:,end)
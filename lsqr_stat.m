clc,clear all,close all;
disp('<<Regresi Linear Menggunakan Least-squares method')
n_data=input('Masukan jumlah data [x y] = ');

%read data points
for i=1:n_data;
    data=input('Masukan data [x y] = ');
    x(i)=data(1);
    y(i)=data(2);
end

%Accumulate statistics
sum_x=0;sum_y=0;sum_x2=0;sum_xy=0; %initial condition
for ii=1:n_data;
    sum_x=sum_x+x(ii);
    sum_y=sum_y+y(ii);
    sum_x2=sum_x2+x(ii)^2;
    sum_xy=sum_xy+x(ii)*y(ii);
end

%calculate slope(m) & intercept (b)
%m=(sum_xy-sum_x*y_bar)/(sum_x2-sum_x*x_bar)
%b=y_bar-m*x_bar
x_bar=sum_x/n_data;
y_bar=sum_y/n_data;
m=(sum_xy-sum_x*y_bar)/(sum_x2-sum_x*x_bar);%slope
b=y_bar-m*x_bar;%intercept
fprintf('Jumlah data =  %4.2f\n',n_data)
fprintf('Slope =   %4.2f\n',m)
fprintf('Intercept =  %4.2f\n',b)

figure;
plot(x,y,'ro','linewidth',2,'MarkerFaceColor','r')
hold on
%create fit line
xmin=min(x);
xmax=max(x);
ymin=m*xmin+b;
ymax=m*xmax+b;

plot([xmin xmax], [ymin ymax],'b-','linewidth',2)
legend('Input Data','Fitted Line')
xlabel('Nilai X')
ylabel('Nilai Y')
title ('Fitting Data using leastsquares regression')
grid on



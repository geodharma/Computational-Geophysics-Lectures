clc, clear all close all;

%input 
f=inline('x^3+2*x-2');
df=inline('3*x^2+2');
tol=0.01;maxit=25;
x0=0.9; %tebakan awal
x(1)=x0;


disp('iterasi   x_i       x_i+1      Err(%)')

for i=1:maxit
    
    if df(x(i))==0
        r='failure'
        return
    end
    
    %estimasi akar
    x(i+1)=x(i)-f(x(i))/df(x(i));%rumus newton-raphson
    Err=abs((x(i+1)-x(i))/x(i+1))*100;
    
    %waitforbuttonpress
    fprintf('%3i %11.4f%11.4f%11.4f\n',i,x(i),x(i+1),Err)
    
    if f(x(i+1))==0
        break
        return
    end
    
    %Plot grafik
    ezplot(f)
    grid on
    hold all
    plot(x(i),f(x(i)),'b*','linewidth',2.5)
    xlim([0 1])
     ylim([-10 10])
    grid on
    plot(x(i+1),f(x(i+1)),'ro','MarkerFaceColor','r','linewidth',2.5)
    hold off
    
        if Err<tol,
            break
            r=x(i+1);%update nilai akar
         end
    
end
r=x(end)

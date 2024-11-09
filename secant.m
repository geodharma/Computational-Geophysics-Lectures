clc,clear all, close all;

%input 
f=inline('x^3-7');
tol=0.01;maxit=25;
x1=4; x2=3; 


disp('  n        x1        x2         x3        Err') 
for i=1:maxit,
    if x1==x2
        r='failure'
        return
    end
    
    x(1)=x1;x(2)=x2;
    x(i+2)=x(i+1)-f(x(i+1))*(x(i+1)-x(i))/(f(x(i+1))-f(x(i)));%rumus sekan
            
    Err=(abs(x(i+2)-x(i+1))/x(i+2))*100;
    
    %waitforbuttonpress
    fprintf('%3i %11.5f%11.5f%11.5f%11.5f\n',i,x(i),x(i+1),x(i+2),Err)
    
    if f(x(i+2))==0
        break
        return
    end
    
    %Plot grafik
    ezplot(f)
    grid on
    hold all
    plot(x(i),f(x(i)),'b*','linewidth',2.5)
    xlim([-0.9 0.9])
    ylim([-10 10])
    grid on
    plot(x(i+1),f(x(i+1)),'b*','linewidth',2.5)
    plot(x(i+2),f(x(i+2)),'ro','MarkerFaceColor','r','linewidth',2.5)
    hold off
    
    if Err<tol,
       break
    end
    r=x(i+1);
end
r
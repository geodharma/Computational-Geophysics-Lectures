%Program pencarian akar 4 Metode
clc,clear all,close all;

f=inline('x^3-3*x+1');
df=inline('3*x^2-3');
tol=0.01; 
maxit=100;

%Tebakan awal
a_inp=-8;b_inp=2;%bisection & regula-Falsi
x0=2;%newton-raphson
x1=1; x2=2;%secant


%1.) Pencarian dengan bisection
disp('1) Pencarian dengan metode bisection')
a=a_inp;
b=b_inp;

if f(a)*f(b)>0
    c='failure'
    return
end

disp('  n      a           b           c       (b-a)')
%memulai iterasi
for n=1:maxit;
    c=(a+b)/2; %akar estimasi
    Err=abs(a-b);%error
    %waitforbuttonpress
    fprintf('%3i %11.4f%11.4f%11.4f%11.4f\n', n, a, b,c,(b-a))    
   
    if f(c)==0 %Jika akar sudah diperoleh,iterasi dihentikan
        break
        return
    end
    
    if Err<tol%Jika error lebih kecil dari 
        break
        return
    end
    
    if f(b)*f(c)>0 %cek tanda untuk ganti interval
        b=c;
    else a=c;
    end
end
r_b=c
n_b=n

%2.) Pencarian regula-falsi
disp('2) Pencarian dengan metode regula-falsi')
a=a_inp;
b=b_inp;

%cek a dan b
if f(a)*f(b)>0
    c='failure'
    return
end

disp('iterasi     a          b         c      Err(%)')
Err(1)=100;
%memulai iterasi

for n=1:maxit;
    c(n)=(a*f(b)-b*f(a))/(f(b)-f(a));%estimasi akar pada perpotongan sumbu-x dan garis
    
    if f(c(n))==0%akar sudah diperoleh,iterasi dihentikan
        break
        return
    end
    
    %waitforbuttonpress
    fprintf('%3i %11.5f%11.5f%11.5f%11.5f\n',n,a,b,c(n),Err)
     
    
    if f(b)*f(c(n))>0
        b=c(n);
    else a=c(n);
    end
    
   
    c(n+1)=(a*f(b)-b*f(a))/(f(b)-f(a));
    Err=(abs(c(n+1)-c(n))/c(n+1))*100;%dalam persen
    
    if Err<tol,
       break
       r=c(n+1)
    end
end
r_RF=c(end)
n_RF=n

%3. Newton-Raphson
disp('3) Pencarian dengan metode Newton-Raphson')
x(1)=x0;


disp('iterasi   x_n       x_n+1      Err(%)')

for n=1:maxit
    
    if df(x(n))==0
        r='failure'
        return
    end
    
    %estimasi akar
    x(n+1)=x(n)-f(x(n))/df(x(n));%rumus newton-raphson
    Err=abs((x(n+1)-x(n))/x(n+1))*100;
    %waitforbuttonpress
    fprintf('%3i %11.4f%11.4f%11.4f\n',n,x(n),x(n+1),Err)
    
    
        if Err<tol,
           break
        end
    r=x(n+1);%update nilai akar
end
r_NR=r
n_NR=n


%4.) secant
disp('4) Pencarian dengan metode secant')
disp('  n        x1        x2         x3        Err') 
for n=1:maxit,
    if x1==x2
        r='failure'
        return
    end
    
    x(1)=x1;x(2)=x2;
    x(n+2)=x(n+1)-f(x(n+1))*(x(n+1)-x(n))/(f(x(n+1))-f(x(n)));
            
    Err=(abs(x(n+2)-x(n+1))/x(n+2))*100;  
    fprintf('%3i %11.5f%11.5f%11.5f%11.5f\n',n,x(n),x(n+1),x(n+2),Err)
    
    if Err<tol,
       break
    end
    r=x(n+1);
end
r_S=r
n_S=n

Result =[r_b f(r_b) n_b;r_RF f(r_RF) n_RF;r_NR f(r_NR) n_NR;r_S f(r_S) n_S]
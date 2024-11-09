  clc,clear all, close all;

%input fungsi, toleransi,a & b
f=inline('x^3+2*x-2');
%f=inline('36-(0.654*m*(1-exp(-150/m)))')
tol=0.0001; 
maxit=100;
a=0;b=1;

%cek a dan b
if f(a)*f(b)>0
    c='failure'
    return
end

disp('  n      a           b           c       (b-a)')
%memulai iterasi
for n=1:maxit;
    c=(a+b)/2; %akar estimasi
    Err=abs(a-b);%error
    waitforbuttonpress
    fprintf('%3i %11.4f%11.4f%11.4f%11.4f\n', n, a, b,c,(b-a))
    
    %Plot grafik
    ezplot(f)
    grid on
    hold all
    plot(a,f(a),'b*','linewidth',2.5)
    xlim([-2 5])
    ylim([-50 100])
    grid on
        plot(b,f(b),'b*','linewidth',2.5)
    plot(c,f(c),'ro','MarkerFaceColor','r','linewidth',2.5)
    hold off
    
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
disp('Pencarian Selesai')
Hasil=[c f(c) Err]
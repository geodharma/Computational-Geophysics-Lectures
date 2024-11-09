clc,clear all, close all;

%input fungsi, toleransi,a & b
f=inline('x^3+2*x-2');
tol=1e-02; maxit=25; 
a=0;b=1;

%cek a dan b
if f(a)*f(b)>0
    c='failure'
    return
end

disp('iterasi     a          b         c      Err(%)')
Err(1)=100;
%memulai iterasi
figure
for n=1:maxit;
    c(n)=(a*f(b)-b*f(a))/(f(b)-f(a));%estimasi akar pada perpotongan sumbu-x dan garis
    
    if f(c(n))==0%akar sudah diperoleh,iterasi dihentikan
        break
        return
    end
    
    waitforbuttonpress
    fprintf('%3i %11.5f%11.5f%11.5f%11.5f\n',n,a,b,c(n),Err)
    
    %Plot grafik
    ezplot(f)
    grid on
    hold all
    plot(a,f(a),'b*','linewidth',2.5)
    xlim([-2 5])
    ylim([-50 100])
    grid on
    plot(b,f(b),'b*','linewidth',2.5)
    plot(c(n),f(c(n)),'ro','MarkerFaceColor','r','linewidth',2.5)
    hold off
      
    
    
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
disp('Pencarian Selesai')
Hasil=[c(end) f(c(end)) Err]
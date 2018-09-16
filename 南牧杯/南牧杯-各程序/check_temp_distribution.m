clc
clear
alpha=0.05;
fid=fopen('Öí³¡Êª¶È.txt','r');
sum1=262;
good=0;
%{
for i=1:262
    a=fscanf(fid,'%f',119);
    f=length(a)
    a=nonzeros(a);
    xbar=mean(a);
    s=std(a);
    mm=minmax(a');
    pd=@(x)normcdf(x,xbar,s);
    [h,p,st]=chi2gof(a,'cdf',pd,'Nparams',2);
    pi=st.E/length(a);
    col4=st.E;
    tj=st.O.^2./st.E,stj=sum(tj);
    k2=chi2inv(1-alpha,st.df);
    if (stj-119<=k2) 
        good=good+1;
    end
end
%}
for i=1:262
    a=fscanf(fid,'%f',119);
    f=length(a)
    a=nonzeros(a);
    xbar=mean(a);
    s=std(a);
    mm=minmax(a');
    pd=@(x)normcdf(x,xbar,s);
    [h,p,st]=chi2gof(a,'cdf',pd,'Nparams',2);
    pi=st.E/length(a);
    col4=st.E;
    tj=st.O.^2./st.E,stj=sum(tj);
    k2=chi2inv(1-alpha,st.df);
    if (stj-119<=k2) 
        good=good+1;
    end
end


good
sum1
good/sum1
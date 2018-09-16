clc;clear;
fid=fopen('猪场温度.txt','r');
good1=0;
good2=0;
good3=0;
good4=0;
good5=0;
sum1=262;
for i=1:sum1
    A=fscanf(fid,'%f',119);
    alpha=0.1;
    [mu,sigma]=normfit(A);
    p1=normcdf(A,mu,sigma);
    [H1,s1]=kstest(A,[A,p1],alpha)
    n=length(A);
    if H1==0
        good1=good1+1;
        %disp('该数据源服从正态分布。')
    else
        %disp('该数据源不服从正态分布。')
    end
    phat=gamfit(A,alpha);
    p2=gamcdf(A,phat(1),phat(2));
    [H2,s2]=kstest(A,[A,p2],alpha)
    if H2==0
        good2=good2+1;
        %disp('该数据源服从γ分布。')
    else
        %disp('该数据源不服从γ分布。')
    end
    lamda=poissfit(A,alpha);
    p3=poisscdf(A,lamda);
    [H3,s3]=kstest(A,[A,p3],alpha)
    if H3==0
        good3=good3+1;
        %disp('该数据源服从泊松分布。')
    else
        %disp('该数据源不服从泊松分布。')
    end
    mu=expfit(A,alpha);
    p4=expcdf(A,mu);
    [H4,s4]=kstest(A,[A,p4],alpha)
    if H4==0
        good4=good4+1;
        %disp('该数据源服从指数分布。')
    else
        %disp('该数据源不服从指数分布。')
    end
    [phat, pci] = raylfit(A, alpha);
    p5=raylcdf(A,phat);
    [H5,s5]=kstest(A,[A,p5],alpha)
    if H5==0
        good5=good5+1;
        %disp('该数据源服从rayleigh分布。')
    else
        %disp('该数据源不服从rayleigh分布。')
    end
end
sprintf('服从正态分布的数据的比例 %.5f',good1/sum1)
sprintf('服从γ分布的数据的比例 %.5f',good2/sum1)
sprintf('服从泊松分布的数据的比例 %.5f',good3/sum1)
sprintf('服从指数分布的数据的比例 %.5f',good4/sum1)
sprintf('服从rayleigh分布的数据的比例 %.5f',good5/sum1)





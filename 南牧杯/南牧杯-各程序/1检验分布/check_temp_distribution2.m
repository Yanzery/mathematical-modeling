clc;clear;
fid=fopen('���¶�.txt','r');
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
        %disp('������Դ������̬�ֲ���')
    else
        %disp('������Դ��������̬�ֲ���')
    end
    phat=gamfit(A,alpha);
    p2=gamcdf(A,phat(1),phat(2));
    [H2,s2]=kstest(A,[A,p2],alpha)
    if H2==0
        good2=good2+1;
        %disp('������Դ���Ӧ÷ֲ���')
    else
        %disp('������Դ�����Ӧ÷ֲ���')
    end
    lamda=poissfit(A,alpha);
    p3=poisscdf(A,lamda);
    [H3,s3]=kstest(A,[A,p3],alpha)
    if H3==0
        good3=good3+1;
        %disp('������Դ���Ӳ��ɷֲ���')
    else
        %disp('������Դ�����Ӳ��ɷֲ���')
    end
    mu=expfit(A,alpha);
    p4=expcdf(A,mu);
    [H4,s4]=kstest(A,[A,p4],alpha)
    if H4==0
        good4=good4+1;
        %disp('������Դ����ָ���ֲ���')
    else
        %disp('������Դ������ָ���ֲ���')
    end
    [phat, pci] = raylfit(A, alpha);
    p5=raylcdf(A,phat);
    [H5,s5]=kstest(A,[A,p5],alpha)
    if H5==0
        good5=good5+1;
        %disp('������Դ����rayleigh�ֲ���')
    else
        %disp('������Դ������rayleigh�ֲ���')
    end
end
sprintf('������̬�ֲ������ݵı��� %.5f',good1/sum1)
sprintf('���Ӧ÷ֲ������ݵı��� %.5f',good2/sum1)
sprintf('���Ӳ��ɷֲ������ݵı��� %.5f',good3/sum1)
sprintf('����ָ���ֲ������ݵı��� %.5f',good4/sum1)
sprintf('����rayleigh�ֲ������ݵı��� %.5f',good5/sum1)





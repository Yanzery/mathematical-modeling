data=textread('数据矩阵(无方差含因变量标准化).txt');  
data2=textread('拟合后的一次项系数.txt');  

ck=data(12:n,:);m1=size(ck,1);
bj=data(1:11,:);m2=size(bj,1);



for i=1:m1
    for j=1:m2
        if (r(i,j)>0)
            t(j,:)=bj(j,:)-ck(i,:);
        else
            t(j,:)=(1-bj(j,:))-ck(i,:);
        end
    end
    jc1=min(min(abs(t')));
    jc2=max(max(abs(t')));
    rho=0.5;
   
    ksi=(jc1+rho*jc2)./(abs(t)+rho*jc2);
   
    rt=sum(ksi')/size(ksi,2);
    r(i,:)=rt;
    
end
r

[r1,c1]=size(r);
fid=fopen('灰色关联结果.txt','w');
for i=1:r1
    for j=1:c1
        if j==c1
            fprintf(fid,'%f\n',r(i,j));
        else
            fprintf(fid,'%f ',r(i,j));
        end
    end
end
fclose(fid);


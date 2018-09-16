data=textread('数据矩阵(无方差含因变量).txt');  
data=data';
data=data(1:13,:);
n=size(data,1);
for i=1:n
    max1=max(data(i,:));
    min1=min(data(i,:));
	data(i,:)=(data(i,:)-min1)/(max1-min1);
end

ck=data(12:n,:);m1=size(ck,1);
bj=data(1:11,:);m2=size(bj,1);

for i=1:m1
    for j=1:m2
        t(j,:)=bj(j,:)-ck(i,:);
    end
    jc1=min(min(abs(t')));
    jc2=max(max(abs(t')));
    rho=0.5;
   
    ksi=(jc1+rho*jc2)./(abs(t)+rho*jc2);
   
    rt=sum(ksi')/size(ksi,2);
    r(i,:)=rt;
    
end
r



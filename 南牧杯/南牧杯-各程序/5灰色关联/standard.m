data=textread('数据矩阵(无方差含因变量).txt');  
data=data';
data=data(1:13,:);
n=size(data,1);
for i=1:n
    max1=max(data(i,:));
    min1=min(data(i,:));
	data(i,:)=(data(i,:)-min1)/(max1-min1);
end

[r,c]=size(data);
fid=fopen('数据矩阵(无方差含因变量标准化)','w');
for i=1:r
    for j=1:c
        if j==c
            fprintf(fid,'%f\n',data(i,j));%如果是最后一个，就换行
        else
            fprintf(fid,'%f ',data(i,j));%如果不是最后一个，就tab
        end
    end

end
fclose(fid);
data=textread('���ݾ���(�޷�������).txt');  
data=data';
data=data(1:13,:);
n=size(data,1);
for i=1:n
    max1=max(data(i,:));
    min1=min(data(i,:));
	data(i,:)=(data(i,:)-min1)/(max1-min1);
end

[r,c]=size(data);
fid=fopen('���ݾ���(�޷���������׼��).txt','w');
for i=1:r
    for j=1:c
        if j==c
            fprintf(fid,'%f\n',data(i,j));
        else
            fprintf(fid,'%f ',data(i,j));
        end
    end

end
fclose(fid);
data=textread('���ݾ���(�޷���������׼��).txt');  


n=size(data,1);
ck=data(12:n,:);m1=size(ck,1);
bj=data(1:11,:);m2=size(bj,1);

for i=1:m1
    for j=1:m2
        x=data(i,:);
        y=data(j,:);
        p=polyfit(x,y,1);
        r(i,j)=p(1);
    end
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


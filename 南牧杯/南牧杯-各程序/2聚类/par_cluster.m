%�����������ϵ������ճ�������ı��ļ�ch.txt��  
clc,clear  
a=textread('����Զ�������.txt');   
d=1-abs(a);  %�������ݱ任�������ϵ��ת��Ϊ����  
d=tril(d);   %���d����������ǲ���  
b=nonzeros(d); %ȥ��d�е�0Ԫ��  
b=b';  %����������  
z=linkage(b,'complete');  %������뷨����  
y=cluster(z,'maxclust',2);%�ѱ������ֳ����࣬ע:Ҳ��3�࣬���¼ǵ��޸�  
ind1=find(y==1);  %��ʾ��һ���Ӧ�ı������  
ind2=find(y==2);  %��ʾ�ڶ����Ӧ�ı������  
ind1=ind1';  
ind2=ind2';  
h=dendrogram(z);  %������ͼ  
ind1,ind2  
set(h,'Color','k','LineWidth',2.0);%�Ѿ���ͼ�ߵ���ɫ�޸ĳɺ�ɫ���߿�Ӵ�  

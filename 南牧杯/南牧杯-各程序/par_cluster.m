%�����������ϵ������ճ�������ı��ļ�ch.txt��  
clc,clear  
a=textread('����Զ�������.txt');   
d=1-abs(a);  %�������ݱ任�������ϵ��ת��Ϊ����  
d=tril(d);   %���d����������ǲ���  
b=nonzeros(d); %ȥ��d�е�0Ԫ��  
b=b';  %����������  
z=linkage(b,'complete');  %������뷨����  
y=cluster(z,'maxclust',13);%�ѱ������ֳ����࣬ע:Ҳ��3�࣬���¼ǵ��޸�  
ind1=find(y==1);  %��ʾ��һ���Ӧ�ı������  
ind2=find(y==2);  %��ʾ�ڶ����Ӧ�ı������  
ind3=find(y==3);
ind4=find(y==4);
ind5=find(y==5);
ind6=find(y==6);
ind7=find(y==7);
ind8=find(y==8);
ind9=find(y==9);
ind10=find(y==10);
ind11=find(y==11);
ind12=find(y==12);
ind13=find(y==13);
ind1=ind1';  
ind2=ind2';  
ind3=ind3';  
ind4=ind4';  
ind5=ind5';  
ind6=ind6';  
ind7=ind7';  
ind8=ind8';
ind9=ind9';  
ind10=ind10';  
ind11=ind11'; 
ind12=ind12'; 
ind13=ind13'; 
h=dendrogram(z);  %������ͼ  
ind1
ind2
ind3
ind4
ind5
ind6
ind7
ind8
ind9
ind10
ind11
ind12
ind13
set(h,'Color','k','LineWidth',2.0);%�Ѿ���ͼ�ߵ���ɫ�޸ĳɺ�ɫ���߿�Ӵ�  

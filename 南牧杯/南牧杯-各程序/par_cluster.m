%把下三角相关系数矩阵粘贴到纯文本文件ch.txt中  
clc,clear  
a=textread('相关性度量矩阵.txt');   
d=1-abs(a);  %进行数据变换，把相关系数转化为距离  
d=tril(d);   %提出d矩阵的下三角部分  
b=nonzeros(d); %去掉d中的0元素  
b=b';  %化成行向量  
z=linkage(b,'complete');  %按最长距离法聚类  
y=cluster(z,'maxclust',13);%把变量划分成两类，注:也可3类，底下记得修改  
ind1=find(y==1);  %显示第一类对应的变量编号  
ind2=find(y==2);  %显示第二类对应的变量编号  
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
h=dendrogram(z);  %画聚类图  
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
set(h,'Color','k','LineWidth',2.0);%把聚类图线的颜色修改成黑色，线宽加粗  

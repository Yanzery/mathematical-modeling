%% pca  
  
dataSet = load('���ݾ���.txt');%��������  

% pca  
[FinalData, reconData] = PCA(dataSet, 3);  
dataSet(1,:)
%% ��ͼ  
hold on  
plot(dataSet(:,1), dataSet(:,2), '.');  
plot(reconData(:,1), reconData(:,2), '.r');  
hold off

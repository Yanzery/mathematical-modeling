%% pca  
  
dataSet = load('数据矩阵.txt');%导入数据  

% pca  
[FinalData, reconData] = PCA(dataSet, 3);  
dataSet(1,:)
%% 作图  
hold on  
plot(dataSet(:,1), dataSet(:,2), '.');  
plot(reconData(:,1), reconData(:,2), '.r');  
hold off

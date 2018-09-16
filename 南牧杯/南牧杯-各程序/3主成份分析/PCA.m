function [ FinalData,reconData ] = PCA( dataSet, k )  
    [m,n] = size(dataSet);  
  
   %% ȥ��ƽ��ֵ  
    %ȡƽ��ֵ  
    dataSetMean = mean(dataSet);  
    %��ȥƽ��ֵ  
    dataSetAdjust = zeros(m,n);  
    for i = 1 : m  
        dataSetAdjust(i , :) = dataSet(i , :) - dataSetMean;  
    end  
  
    %% ����Э�������  
    dataCov = cov(dataSetAdjust);  
  
    %% ����Э������������ֵ����������  
    [V, D] = eig(dataCov);  
      
    % ������ֵ����ת��������  
    d = zeros(1, n);  
    for i = 1:n  
        d(1,i) = D(i,i);  
    end  
      d
    %% ������ֵ����  
    [maxD, index] = sort(d);  
      
    %% ѡȡǰk����������ֵ  
    % maxD_k = maxD(1, (n-k+1):n);  
    index_k = index(1, (n-k+1):n);  
    
    index_k
    % ��Ӧ����������  
    V_k = zeros(n,k);  
    for i = 1:k  
        V_k(:,i) = V(:,index_k(1,i));  
    end  
      
    %% ת�����µĿռ�  
    FinalData = dataSetAdjust*V_k;  
      
    % ��ԭͼ���ҵ���Щ��  
    reconData = FinalData * V_k';  
    for i = 1 : m  
        reconData(i , :) = reconData(i , :) + dataSetMean;  
    end  
end  
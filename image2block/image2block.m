imgPath = 'C:\Users\WINSTON\Desktop\1.1/';        % 图像库路径
imgDir  = dir([imgPath '*.jpg']); % 遍历所有jpg格式文件
n = length(imgDir);               % n为样本的个数
M = zeros(n,16);  
for k = 1:n                       % 遍历结构体就可以一一处理图片了
    R = imread([imgPath imgDir(k).name]); %读取每张图片
    highsplit=4;                                     % 设置对高平均切割为几份
    widesplit=4;                                     % 设置对宽平均切割为几份
    high=floor(size(R,1)/highsplit);                 % 读取图片的高并向下取整
    wide=floor(size(R,2)/widesplit);                 % 读取图片的宽并向下取整                                                              
    N = zeros(4,4);
    S = cell(4,4);
    for i=0:(highsplit-1)                           % i控制行
       for j=0:(widesplit-1)                        % j控制列
            S{i+1,j+1}=imcrop(R,[i*wide+1 j*high+1 wide-1 high-1]);          %（j*wide+1 i*high+1）为切割起始点；（wide-1 high-1）为切割范围
            N(i+1,j+1) = sum(sum(S{i+1,j+1}.^2));
       end
    end
   M(k,:) = [N(1,:),N(2,:),N(3,:),N(4,:)];
end
save filename.txt -ascii M;                            %保存文本文档的文件名

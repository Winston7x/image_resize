imgPath = 'C:\Users\WINSTON\Desktop\1.1/';        % ͼ���·��
imgDir  = dir([imgPath '*.jpg']); % ��������jpg��ʽ�ļ�
n = length(imgDir);               % nΪ�����ĸ���
M = zeros(n,16);  
for k = 1:n                       % �����ṹ��Ϳ���һһ����ͼƬ��
    R = imread([imgPath imgDir(k).name]); %��ȡÿ��ͼƬ
    highsplit=4;                                     % ���öԸ�ƽ���и�Ϊ����
    widesplit=4;                                     % ���öԿ�ƽ���и�Ϊ����
    high=floor(size(R,1)/highsplit);                 % ��ȡͼƬ�ĸ߲�����ȡ��
    wide=floor(size(R,2)/widesplit);                 % ��ȡͼƬ�Ŀ�����ȡ��                                                              
    N = zeros(4,4);
    S = cell(4,4);
    for i=0:(highsplit-1)                           % i������
       for j=0:(widesplit-1)                        % j������
            S{i+1,j+1}=imcrop(R,[i*wide+1 j*high+1 wide-1 high-1]);          %��j*wide+1 i*high+1��Ϊ�и���ʼ�㣻��wide-1 high-1��Ϊ�иΧ
            N(i+1,j+1) = sum(sum(S{i+1,j+1}.^2));
       end
    end
   M(k,:) = [N(1,:),N(2,:),N(3,:),N(4,:)];
end
save filename.txt -ascii M;                            %�����ı��ĵ����ļ���

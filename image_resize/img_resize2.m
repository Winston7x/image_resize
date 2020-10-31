file_name = 'C:\Users\WINSTON\Desktop\—º…‡√±\';
im_name = '*.jpg';
dis = dir([file_name im_name]);
nms = {dis.name};

% µ˜’˚Õº∆¨¥Û–°Œ™430*430*h
for k = 1:length(nms)
    nm = [file_name nms{k}];
    img = imread(nm);
    [m,n,h] = size(img);
    outimg = uint8(ones(430,430,h));
    outimg(:,:,1) = outimg(:,:,1)*img(1,1,1);
    outimg(:,:,2) = outimg(:,:,2)*img(1,1,2);
    outimg(:,:,3) = outimg(:,:,3)*img(1,1,3);
    if m>430 || n>430
       img = imresize(img , 430/max(m+1,n+1));
       [m,n,~] = size(img);
    end
    outimg(round((430-m)/2)+1:round((430-m)/2)+m,round((430-n)/2)+1:round((430-n)/2)+n,:)=img;
    imwrite(outimg,['C:\Users\WINSTON\Desktop\—º…‡√±\',num2str(k),'.jpg']);
end


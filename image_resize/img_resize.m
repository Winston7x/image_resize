function outimg = img_resize(img)
% 调整图片大小为430*430*h
[m,n,h] = size(img);
outimg = uint8(ones(430,430,h));
outimg(:,:,1) = outimg(:,:,1)*outimg(2,2,1);
outimg(:,:,2) = outimg(:,:,1)*outimg(2,2,2);
outimg(:,:,3) = outimg(:,:,1)*outimg(2,2,3);
if m>430 || n>430
   img = imresize(img , 430/max(m,n));
   [m,n,~] = size(img);
end
outimg(round((430-m)/2)+1:round((430-m)/2)+m,round((430-n)/2)+1:round((430-n)/2)+n,:)=img;
end


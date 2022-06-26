function [output] = ERF(img_s,img,r)
%ERF 
%   img_s           the smooth of image
%   img             raw image
%   r               radius of filter window
%   implemented by Pengyu Zhang
img = single(img);
img_s = single(img_s);
[h,w] = size(img);
U = padarray(img(:,:),[r,r],'replicate'); 
U_s = padarray(img_s(:,:),[r,r],'replicate'); 
output = zeros(h,w,'single');
for i = 1:h
    for j = 1:w
        block = U_s(i:i+2*r,j:j+2*r);
        cost = (block - ones(2*r+1,2*r+1)*U(i+r,j+r)).^2;
        D = reshape(cost,1,(2*r+1)^2);
        [~,ind] = min(D);
        output(i,j) = block(ind);
    end
end
end


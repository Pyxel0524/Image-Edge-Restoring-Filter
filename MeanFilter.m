function [output] = MeanFilter(im, radius)
% MeanFilter
% input: noise image
% r: radius
% Auther: Pengyu Zhang
% Email: zhangpengyu970524@163.com
[m n c] = size(im);  
output = zeros(m, n, c);  
for ch=1:c
    input = im(:,:,ch);
    input_pad = padarray(input, [radius radius], 'replicate');  % padding
    weight = (2*radius+1)^2;  % weight
    for i=1:m  
        for j=1:n 
            x = i + radius;
            y = j + radius;
            neighbordhood = input_pad(x-radius:x+radius, y-radius:y+radius);
            output(i,j, ch) = sum(sum(neighbordhood))/weight;
        end
    end
end
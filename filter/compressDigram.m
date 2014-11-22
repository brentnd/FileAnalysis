function [ compressed ] = compressDigram( digram, ratio )
%COMPRESSDIGRAM Reduces a digram by factor of 2

if(nargin == 1)
    ratio = 2;
end

compressed = zeros(ceil(size(digram,1)/ratio),ceil(size(digram,2)/ratio));

for i= 1:size(compressed,1)-1
    for j= 1:size(compressed,2)-1
        compressed(i,j) = max(max(digram(ratio*i:ratio*i+1,ratio*j:ratio*j+1)));
    end
end
% Fix edges to not be zero
compressed(end,:) = compressed(end-1,:);
compressed(:,end) = compressed(:,end-1);

end


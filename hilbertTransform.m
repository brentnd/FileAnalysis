function [ Z ] = hilbertTransform( A )
%HILBERTTRANSFORM Summary of this function goes here
%   Detailed explanation goes here

va = sqrt(size(A,1));
sz = 0;
for i=1:12
    if(2^i > va)
        sz = i;
        break;
    end
end
if(sz == 0)
    error('Too large');
end

[x,y] = hilbert(sz);

x = round((x./max(x)+1)/2*(2^sz-1)) + 1;
y = round((y./max(y)+1)/2*(2^sz-1)) + 1;

for i = 1:length(A)
    Z(x(i),y(i)) = A(i);
end

end
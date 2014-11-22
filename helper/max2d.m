function [ row, col, maxNum ] = max2d( data )
%MAX2D Summary of this function goes here
%   Detailed explanation goes here

[maxNum, maxIndex] = max(data(:));
[row, col] = ind2sub(size(data), maxIndex);

end


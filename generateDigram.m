function [ digram ] = generateDigram( bytes, bitDepth, offset )
%GENERATEDIGRAM Generate bigram from byte stream

if(nargin == 1)
    bitDepth = 8;
    offset = 1;
end

if(bitDepth > 8)
    error('Bit depth not supported');
end

devFactor = 2;

maxVal = 2^bitDepth;

digram = ones(maxVal,maxVal);

for i=1:length(bytes)-offset
    val1 = bytes(i) + 1;
    val2 = bytes(i+offset) + 1;
    digram(val1,val2) = digram(val1,val2) + 1;
end

% Cleanup edges
digram(1,:) = digram(2,:);
digram(:,1) = digram(:,2);
digram(:,end) = digram(:,end-1);
digram(end,:) = digram(end-1,:);

% Post-process to remove extremes
% mn = mean(digram(:));
% dev = std(digram(:));
% 
% digram(digram > mn+devFactor*dev) = floor(mn+devFactor*dev);

end


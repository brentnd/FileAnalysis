function [ digram ] = generateTrigram( bytes, bitDepth )
%GENERATEDIGRAM Generate bigram from byte stream

if(nargin == 1)
    bitDepth = 8;
end

if(bitDepth > 8)
    error('Bit depth not supported');
end

maxVal = 2^bitDepth;

digram = zeros(maxVal,maxVal,maxVal);

for i=1:length(bytes)-2
    val1 = bytes(i) + 1;
    val2 = bytes(i+1) + 1;
    val3 = bytes(i+2) + 1;
    digram(val1,val2,val3) = digram(val1,val2,val3) + 1;
end

end


function [ gram ] = generateNgram( N, bytes, bitDepth )
%GENERATENGRAM Generate n-gram from byte stream with N adjacent bytes

if(nargin == 2)
    bitDepth = 8;
end

if(bitDepth > 8)
    error('Bit depth not supported');
end

if(N > 4)
    error('N-grams only in [1,2,3,4]');
end

maxVal = 2^bitDepth;

gramSize = num2cell(maxVal*ones(1,N));

gram = ones(gramSize{:});
bytes = bytes + 1;

% Switch pulled outside of loop to improve efficiency
switch(N)
    case 1
        for i=1:length(bytes)-N
            val1 = bytes(i);
            gram(val1) = gram(val1) + 1;
        end
    case 2
        for i=1:length(bytes)-N
            val1 = bytes(i);
            val2 = bytes(i+1);
            gram(val1,val2) = gram(val1,val2) + 1;
        end
    case 3
        for i=1:length(bytes)-N
            val1 = bytes(i);
            val2 = bytes(i+1);
            val3 = bytes(i+2);
            gram(val1,val2,val3) = gram(val1,val2,val3) + 1;
        end
    case 4
        for i=1:length(bytes)-N
            val1 = bytes(i);
            val2 = bytes(i+1);
            val3 = bytes(i+2);
            val4 = bytes(i+3);
            gram(val1,val2,val3,val4) = gram(val1,val2,val3,val4) + 1;
        end
end

end
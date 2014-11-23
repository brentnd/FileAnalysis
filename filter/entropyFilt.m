function [filtered] = entropyFilt( original, window )
%VISIUALIZEBYTES get each byte as entropy value

if(nargin == 1)
    window = 3;
end

filtered = original;
delta = floor((window-1)/2);

for i=1:size(original,1)
    for j=1:size(original,2)
        i_min = i-delta;
        i_max = i+delta;
        j_min = j-delta;
        j_max = j+delta;
        if(i_max >= size(original,1))
            i_max = size(original,2);
        end
        if(j_max >= size(original,2))
            j_max = size(original,2);
        end
        if(i_min < 1)
            i_min = 1;
        end
        if(j_min < 1)
            j_min = 1;
        end
        i_range = i_min:i_max;
        j_range = j_min:j_max;
        window = original(i_range,j_range);
        filtered(i,j) = entropy(window(:));
    end
end

end

function [filtered] = entropyFilt( original )
%VISIUALIZEBYTES get each byte as entropy value

filtered = original;

for i=1:size(original,1)
    for j=1:size(original,2)
        i_min = i-1;
        i_max = i+1;
        j_min = j-1;
        j_max = j+1;
        if(i == size(original,1))
            i_max = i;
        end
        if(j == size(original,2))
            j_max = j;
        end
        if(i == 1)
            i_min = i;
        end
        if(j == 1)
            j_min = j;
        end
        i_range = i_min:i_max;
        j_range = j_min:j_max;
        window = original(i_range,j_range);
        filtered(i,j) = entropy(window(:));
    end
end

end

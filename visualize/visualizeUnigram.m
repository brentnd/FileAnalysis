function visualizeUnigram( bytes )
%VISUALIZEUNIGRAM Does unigram plot but colored with file locality

N=1;
gram = ones(256,1);
blockSz = floor(length(bytes)/(1024*63));
block = 1;
cmap = colormap;
for i=1:length(bytes)-N
    val1 = bytes(i)+1;
    gram(val1) = gram(val1) + 1;
    if(mod(i,1024*blockSz) ==  0)
        visualizeNgram( gram, cmap(block,:) );
        block = block + 1;
        hold on;
    end
end

end


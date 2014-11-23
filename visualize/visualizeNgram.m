function visualizeNgram( gram )
%GENERATENGRAM Generate bigram from byte stream

N = ndims(gram);

switch N
    case 1
        disp('not implemented yet');
    case 2
        gram = log(gram);
        imagesc(gram);
        set(gca,'XAxisLocation','top');
        axis square;
        set(gca,'XTick',0:16:length(gram))
        set(gca,'YTick',0:16:length(gram))
    case 3
        for i=1:size(gram,3)-3
            avg = 1.0*gram(:,:,i) + 0.5*gram(:,:,i+1) + 0.25*gram(:,:,i+2) + 0.25*gram(:,:,i+3);
            visualizeNgram( avg );
            drawnow;
        end
end


grid on;
bits = log2(size(gram,1));
title([ num2str(bits) ' bit N-gram visualization '],'FontSize',14);

end
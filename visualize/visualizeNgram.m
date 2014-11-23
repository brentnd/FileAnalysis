function visualizeNgram( gram, color )
%GENERATENGRAM Generate bigram from byte stream

N = ndims(gram);
if(isvector(gram))
    N = 1;
end
if(nargin == 1)
    color = [0 0 0.8];
end

maxG = ceil(log(sum(gram(:))));
gram = log(gram);

switch N
    case 1
        h = bar(gram,'EdgeColor',color,'FaceColor',color);
        uistack(h,'bottom')
        axis([1 length(gram) 0 maxG]);
        type = 'unigram';
    case 2
        image(gram.*(64/maxG));
        set(gca,'XAxisLocation','top');
        axis square;
        set(gca,'YTick',0:16:length(gram))
        cmap = colormap;
        cmap(1,:) = [0 0 0];
        colormap(cmap);
        type = 'bigram';
    case 3
        for i=1:size(gram,3)-3
            avg = 1.0*gram(:,:,i) + 0.5*gram(:,:,i+1) + 0.25*gram(:,:,i+2) + 0.25*gram(:,:,i+3);
            visualizeNgram( avg );
            drawnow;
        end
        type = 'trigram';
end

set(gca,'XTick',0:16:length(gram))
grid on;
set(gca,'Xcolor',[0.2 0.2 0.2]);
set(gca,'Ycolor',[0.2 0.2 0.2]);
bits = log2(size(gram,1));
title([ num2str(bits) ' bit ' type ' visualization '],'FontSize',14);

end
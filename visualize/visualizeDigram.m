function visualizeDigram( digram )
%GENERATEDIGRAM Generate bigram from byte stream


digram = log(digram);

imagesc(digram);
axis square;
set(gca,'XAxisLocation','top');
set(gca,'XTick',0:16:256)
set(gca,'YTick',0:16:256)

grid on;
bits = log2(size(digram,1));
title(['Digram of ' num2str(bits) ' bits'],'FontSize',14);

end
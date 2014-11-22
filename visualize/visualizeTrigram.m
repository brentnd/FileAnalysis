function visualizeTrigram( trigram )
%GENERATEDIGRAM Generate bigram from byte stream

figure;
for i=1:size(trigram,3)-3
    avg = 1.0*trigram(:,:,i) + 0.5*trigram(:,:,i+1) + 0.25*trigram(:,:,i+2) + 0.25*trigram(:,:,i+3);
    visualizeDigram( avg );
    drawnow;
end

end
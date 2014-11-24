function visualizeBytes( Hbytes )
%VISIUALIZEBYTES Summary of this function goes here
%   Detailed explanation goes here

% Everything red
R = linspace(0.4,0.8,255);
G = linspace(0.0,0.0,255);
B = linspace(0.4,0.8,255);
cmap = [R' G' B'];
% Black for zero
cmap(1,:) = [1 1 1];
cmap(2,:) = [0 0 0];
% White for 255
cmap(end,:) = [0.8 0.8 0.8];
R = linspace(0.7,1.0,96);
G = linspace(0.7,1.0,96);
B = linspace(0.0,0.0,96);
cmap(32:127,:) = [R' G' B'];
colormap(cmap);
image(Hbytes);
axis square
axis off;
colorbar;
hcb=colorbar;
set(hcb,'YTick',[2, 80, 180, 255])
set(hcb,'YTickLabel',{'Null','Printable Chars.','Other','255'});
title('Byte class visualization','FontSize',14);

end


function visualizeBytes( Hbytes )
%VISIUALIZEBYTES Summary of this function goes here
%   Detailed explanation goes here

% Everything red
R = linspace(0.4,0.8,255);
G = linspace(0.0,0.0,255);
B = linspace(0.0,0.8,255);
cmap = [R' G' B'];
% Black for zero
cmap(1,:) = [0 0 0];
% White for 255
cmap(end,:) = [1 1 1];
R = linspace(0.7,1.0,96);
G = linspace(0.7,0.7,96);
B = linspace(0.0,0.0,96);
cmap(32:127,:) = [R' G' B'];
colormap(cmap);
image(Hbytes);
axis square

end


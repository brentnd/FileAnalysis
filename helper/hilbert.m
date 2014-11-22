
function [x,y] = hilbert(n)
%HILBERT Hilbert curve.
%
% [x,y]=hilbert(n) gives the vector coordinates of points
%   in n-th order Hilbert curve of area 1.

if(n > 12)
    error('Too large n');
end

if n<=0
  x=0;
  y=0;
else
  [xo,yo]=hilbert(n-1);
  x=.5*[-.5+yo -.5+xo .5+xo  .5-yo];
  y=.5*[-.5+xo  .5+yo .5+yo -.5-xo];
end

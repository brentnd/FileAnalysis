function [ E ] = entropy( d )
%ENTROPY Return the entropy of the matrix d

[~,~,J] = unique(d); 	
H = sparse(J,1,1);
p = full(H(H>0))/length(d);
E = -sum(p.*log2(p));

end


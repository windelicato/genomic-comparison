function out = gen_dendro(data) 
	X=pascal(4);
	X(1,3)=9;
	Labels={'A' ;'B' ;'C';'D'};
	X;
	Y=pdist(X);
	Z=linkage(Y);
	dendrogram(linkage(X),'labels',Labels(:,1),'COLORTHRESHOLD',8);
	title('Example Dendrogram');

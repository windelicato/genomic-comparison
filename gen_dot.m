function outs = gen_intern(data)
	disp(sprintf('Which genes would you like to compare? Input line number of gene: (#1-%d)',length(data)))
	x = input('Gene 1:   ');
	y = input('Gene 2:   ');
	g1=data{x};
	g2=data{y};

	seqdotplot(g1,g2);

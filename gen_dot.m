function outs = gen_intern(data)
	disp(sprintf('Which genes would you like to compare? Input line number of gene: (#1-%d)',length(data)))
	x = input('Gene 1:   ');
	y = input('Gene 2:   ');
	g1=data{x}(1:100);
	g2=data{y}(1:100);

	seqdotplot(g1,g2);

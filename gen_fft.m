function outs = gen_fft(data)
	disp('Calculating FFT of all sequences in input');
	verbose = input('Show FFT for individual nucleotides? Y/N     ','s');
	l = length(data);		
	for i=1:l
		A = data{i} == 'A';
		T = data{i} == 'T';
		G = data{i} == 'G';
		C = data{i} == 'C';

		Xa = fft(A);
		Xa = Xa(2:length(Xa));
		Xt = fft(T);
		Xt = Xt(2:length(Xt));
		Xc = fft(G);
		Xc = Xc(2:length(Xc));
		Xg = fft(C);
		Xg = Xg(2:length(Xg));

		if(verbose == 'Y' || verbose == 'y')
			figure(i);
			subplot(4,1,1);
			stem(abs(Xa));
			grid
			xlabel('k')
			ylabel('|Xa|')
			subplot(4,1,2);
			stem(abs(Xt));
			ylabel('|Xt|')
			grid
			xlabel('k')
			subplot(4,1,3);
			stem(abs(Xc));
			grid
			xlabel('k')
			ylabel('|Xc|')
			subplot(4,1,4);
			stem(abs(Xg));
			ylabel('|Xg|')
			grid
			xlabel('k')
		end

		Gtotal= abs(Xa).^2 + abs(Xt).^2 + abs(Xg).^2 + abs(Xc).^2;
		figure (i+l);
		stem(Gtotal)
		grid
		xlabel('k');
		ylabel('|Xtotal[k]^2|');
		title(sprintf('FFT Totals for sequence # %d',i));

	end

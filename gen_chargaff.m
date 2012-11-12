function outs = gen_chargaff(data)
	disp('Calculating Chargaff Data for all sequences in input')
	
	l = length(data);

	totals = zeros(l,4);
	for i=1:length(data)

		totals(i,1) = sum(data{i} == 'A');
		totals(i,2) = sum(data{i} == 'T');
		totals(i,3) = sum(data{i} == 'G');
		totals(i,4) = sum(data{i} == 'C');
		Rat_AT(i)   = totals(i,1) / totals(i,2);
		Rat_GC(i)   = totals(i,3) / totals(i,4);
		Rat_ATGC(i) = Rat_AT(i) / Rat_GC(i);
	end

	disp('Number of');
	disp('     A     T     G     C');
	disp('------------------------');
	disp(totals);
	disp('Ratio of A/T');
	disp(Rat_AT);
	disp('Ratio of G/C');
	disp(Rat_GC);
	disp('Ratio of AT/GC');
	disp(Rat_ATGC);


	outs = totals;

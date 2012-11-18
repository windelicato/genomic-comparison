function outs = gen_chargaff(data)
	disp('Calculating Chargaff Data for all sequences in input')
	
	l = length(data);

	totals = zeros(l,8);
	for i=1:length(data)

		totals(i,1) = i;
		totals(i,2) = sum(data{i} == 'A');
		totals(i,3) = sum(data{i} == 'T');
		totals(i,4) = sum(data{i} == 'G');
		totals(i,5) = sum(data{i} == 'C');
		totals(i,6) = totals(i,2) / totals(i,3);
		totals(i,7) = totals(i,4) / totals(i,5);
		totals(i,8) = (totals(i,2) + totals(i,3)) / (totals(i,4) + totals(i,5));
	end

	disp('Number of');
	disp('     A     T     G     C    A/T  G/C   ');
	disp('-----------------------------------------');

	disp(totals);
	outs = totals;

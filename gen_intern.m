function outs = gen_intern(data)
	disp('Which genes would you like to compare? Input line number of gene:')
	x = input('Gene 1:   ');
	y = input('Gene 2:   ');
	gene1=data{x};
	gene2=data{y};

	% For each nucleotide, add a row to the Internucleotide Distance (IND)
	% array
	IND1 = cell(1,4);
	IND2 = cell(1,4);
	nucleotides = {'A','T','C','G'};

	for i = 1:4
		    % Create a binary occurence vector for both genes
		    S1 = (gene1 == nucleotides{i});
		    S2 = (gene2 == nucleotides{i});

		    % Create a vector with the indices of occurences for both genes
		    d1 = find(S1);
		    d2 = find(S2);

		    % Create an IND vector for each gene
		    IND1{i} = d1(2:length(d1)) - d1(1:length(d1)-1);
		    IND2{i} = d2(2:length(d2)) - d2(1:length(d2)-1);
	    end

	    % Set the maximum distance to be considered
	    maxIND = input('Max Internucleotide Distance: ');

	    % Create frequency arrays. Each row is a different nucleotide. Each index
	    % of the row corresponds to an IND value and it contains the frequency that
	    % that IND value occurred.
	    X1 = zeros(4,maxIND);
	    X2 = zeros(4,maxIND);

	    % For each nucleotide type
	    for i = 1:4

		    % For each IND value, find the frequency it occurred for this
		    % nucleotide
		    for j = 1:maxIND

			    % Binary occurence vector of IND value
			    R1 = (IND1{i} == j);
			    R2 = (IND2{i} == j);

			    % Frequency of IND value
			    X1(i,j) = sum(R1);
			    X2(i,j) = sum(R2);
		    end

		    % Find IND values larger than max value and add frequency to max value
		    % frequency
		    L1 = (IND1{i} > maxIND);
		    L2 = (IND2{i} > maxIND);

		    X1(i,maxIND) = X1(i,maxIND) + sum(L1);
		    X2(i,maxIND) = X2(i,maxIND) + sum(L2);
	    end

	    % Calculate unnormalized Euclidean distance
	    DistUnNorm = sqrt(sum(sum((X1-X2).^2)))


	    % Normalize X matrices by columns (IND value)
	    colSums1 = sum(X1, 1);
	    colSums2 = sum(X2, 1);

	    X1_NormCol = X1 ./ repmat(colSums1, [size(X1,1) 1]);
	    X2_NormCol = X2 ./ repmat(colSums2, [size(X2,1) 1]);

	    % Calculate Euclidean distance for this method
	    DistNormCol = sqrt(sum(sum((X1_NormCol-X2_NormCol).^2)))


	    % Normalize X matrices by rows (nucleotide type)
	    rowSums1 = sum(X1, 2);
	    rowSums2 = sum(X2, 2);

	    X1_NormRow = X1 ./ repmat(rowSums1, [1 size(X1,2)]);
	    X2_NormRow = X2 ./ repmat(rowSums2, [1 size(X2,2)]);

	    % Calculate Euclidean distance for this method
	    DistNormRow = sqrt(sum(sum((X1_NormRow-X2_NormRow).^2)))



clear all; close all;

% Import data into array
while(true)
	path	= input('Path to Data:   ','s');
	try
		fid = fopen(path);
		if fid == -1
			error('Invalid file.');
			fclose(fid);
		else
			raw 	= textscan(fid,'%s','delimiter','\n');
			data = raw{1};
			fclose(fid);
			break;
		end

	catch Ex
		again = input('Invalid file. Try new handle? Y/N    ','s');
		if(again == 'N' || again == 'n')
			return;
		end
	end
end



% Choose an algorithm to run
while(true)

	disp('*********************************');
	disp('|				|');
	disp('|  	Method of Comparison	|');
	disp('|				|');
	disp('| 1. Chargaffs Rule 		|');
	disp('| 2. Fast Fourier Transform	|');
	disp('| 3. Internucleotide Distances	|');
	disp('| 4. Dendogram			|');
	disp('| 0. Quit			|');
	disp('|				|');
	disp('*********************************');

	selection 	= input('Selection:   ');
	disp(sprintf('\n'));

	switch selection
		case 0
			break;
		case 1
			outs = gen_chargaff(data);
		case 2
			gen_fft(data);
		case 3
			gen_intern(data);
		case 4
			gen_dendro(data);
		otherwise
			disp('Bad Selection. Try again.');
	end
	disp(sprintf('\n\n\n'));
end

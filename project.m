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
	clc;
	disp('+-------------------------------+');
	disp('|				|');
	disp('|  	Method of Comparison	|');
	disp('|				|');
	disp('| 1. Chargaffs Rule 		|');
	disp('| 2. Fast Fourier Transform	|');
	disp('| 3. Internucleotide Distances	|');
	disp('| 4. Dendogram			|');
	disp('| 5. Dotplot			|');
	disp('| 6. Print Sequences		|');
	disp('| 0. Quit			|');
	disp('|				|');
	disp('+-------------------------------+');

	selection 	= input('Selection:   ');
	clc;
	more on;

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
		case 5
			gen_dot(data);
		case 6
			disp(sprintf('Sequence # to Display? '));
			i = input(sprintf('#1-%d:\t', length(data)));
			seqdisp(data(i))
		otherwise
			disp('Bad Selection. Try again.');
	end
	
	k = input('');
	more off;
end

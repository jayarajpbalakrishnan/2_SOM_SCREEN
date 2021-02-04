#This script needs to be run only on test data

import sys

def rescale(compound_list):
	minimum = [float("inf")] * 31
	maximum = [float("inf")] * 31
	
	maximum = [x * -1 for x in maximum]

	#print(s[0])

	for compound in compound_list:
				
		i=1
		for col in compound[1:]:
			minimum[i] = min(minimum[i], float(col))
			maximum[i] = max(maximum[i], float(col))
			i = i + 1

	scaled_compound_list = []

	for compound in compound_list:		
		scaled_compound = [compound[0]]
		
		i = 1
		for col in compound[1:]:
			if i == 31:
				break
			scaled_compound.append(str(round((float(compound[i]) - minimum[i]) / (maximum[i] - minimum[i]),5)))
			i = i + 1
		scaled_compound_list.append(scaled_compound)

	return scaled_compound_list


def refine_cols(s):
	refined_list = []
	
	for line in s:
		if len(line) < 4:
			continue
			
		l = line.split(" ")
		
		l = l[0:-2]
		
		new_row = [l[0]] + l[148:] 

		refined_list.append(new_row)

	return refined_list




	#print(new_row, len(new_row))

	# if line[-1] == "1":
	# 	a.write(t+'\n')
	# else:
	# 	i.write(t+'\n')


if __name__ == "__main__":
	if len(sys.argv) != 3:
		sys.exit("Files not specified\n")

	s = open(sys.argv[1]).read()

	s = s.split("\n")

	a = open(sys.argv[2], "w")

	refined_list = refine_cols(s)
	scaled_compound_list = rescale(refined_list)

	for compound in scaled_compound_list:	
		a.write(" ".join(compound) + "\n")


import sys

if len (sys.argv) != 4 :
    print "Usage: python parse.py <input_file> <active_outfile> <inactive_outfile>"
    sys.exit (1)

input_file = sys.argv[1]
active_file = sys.argv[2]
inactive_file = sys.argv[3]

s = open(input_file).read()

s = s.replace(" ", ",")
s = s.split("\n")

a = open(active_file, "w")
i = open(inactive_file, "w")

for line in s:
	if len(line) < 4:
		continue
	t = line[0:-4]

	if line[-1] == "1":
		a.write(t+'\n')
	else:
		i.write(t+'\n')

a.close()
i.close()

active_infile = active_file
inactive_infile = inactive_file
active_outfile = active_file
inactive_outfile = inactive_file

sa = open(active_infile).read()    
si = open(inactive_infile).read()

outa = open(active_outfile, "w")
outi = open(inactive_outfile, "w")

si = si.split("\n")
sa = sa.split("\n")

minimum = [float("inf")] * 33
maximum = [float("inf")] * 33
maximum = [x * -1 for x in maximum]

for line in si:
	l = line.split(",")
	l = l[0:1] + l[148:]
	
	i = 0
	for col in l:
		if(i==0):
			i=i+1
			continue;
		minimum[i] = min(minimum[i], float(col))
		maximum[i] = max(maximum[i], float(col))
		i = i + 1

for line in si:
	l = line.split(",")
	l = l[0:1] + l[148:]

	i = 0
	for col in l:
		if(i==0):
			i=i+1;
			continue;
		l[i] = str((float(l[i]) - minimum[i]) / (maximum[i] - minimum[i]))
		i = i + 1
		
	line = ','.join(l)
	outi.write(line+'\n')

for line in sa:
	l = line.split(",")
	l = l[0:1] + l[148:]
	
	i = 0
	for col in l:
		if(i==0):
			i=i+1
			continue;
		minimum[i] = min(minimum[i],float(col))
		maximum[i] = max(maximum[i], float(col))
		i = i + 1
	
for line in sa:
	l = line.split(",")
	l = l[0:1] + l[148:]

	i = 0
	for col in l:
		if(i==0):
			i=i+1;
			continue;
		l[i] = str((float(l[i]) - minimum[i]) / (maximum[i] - minimum[i]))
		i = i + 1
		
	line = ','.join(l)
	outa.write(line+'\n')
	
outa.close()
outi.close()

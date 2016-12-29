import sys, os, random, subprocess, numpy

def binary_search(arr, num):
	"""
		Return the index for num to be correctly inserted into the
		sorted list arr.
	"""
	if num > arr[-1] or num < 0:
		return "Wrong random integer generated!"
	l, r = 0, len(arr)-1
	m = (l+r) / 2
	while l < r:
		if num < arr[m]:
			r = m - 1
			m = (l+r)/2
		elif num > arr[m]:
			l = m + 1
			m = (l+r)/2
		else:
			return m
	if num > arr[l]:
		return l+1
	else:
		return l
		

def pick_start_coordinates(g):
	"""
		Concatenate all chromosomes then pick the start coordinates.
		This guanrantees the equalness for all bases.
		Return the chromosome number and the coordinates in that
		chromosome.
	"""
	accumu = [0]
	for i in range(len(g)):
		accumu.append(accumu[i]+g[i])
	tmp = random.randint(1,accumu[-1])
	chromosome = binary_search(accumu, tmp)
	coor = tmp - accumu[chromosome-1]	
	return chromosome, coor

def construct_genome(genome_name, plant_directory):
	"""
		Input the genome chromosome sizes and return a list
		containing the size of each chromosome.
	"""
	genome_path = os.path.join(plant_directory, genome_name)
	f = open(genome_path)
	genome = []
	for line in f:
		line = line.rstrip()
		line = line.split()
		genome.append(int(line[1]))
	return genome

def minus_plus_strand_ratio(gff_file_p):
	"""
		Calculate the plus strand and the minus strand ratio given the gff file.
		Return the ratio as a dictionary.
	"""
	p_cut = subprocess.Popen(('cut', '-f7', gff_file_p), stdout=subprocess.PIPE)
	p_sort = subprocess.Popen(('sort'), stdin=p_cut.stdout, stdout=subprocess.PIPE)
	p_uniq = subprocess.check_output(('uniq', '-c'), stdin=p_sort.stdout)
	lines = p_uniq.split('\n')
	l1, l2 = lines[0].split(), lines[1].split()
	res = {}
	res[l1[1]] = 1. * int(l1[0]) / (int(l1[0])+int(l2[0]))
	res[l2[1]] = 1. * int(l2[0]) / (int(l1[0])+int(l2[0]))
	return res

def minus_or_plus_strand(ratio):
	"""
		Mimic the bernoulli distribution.
		Return the '+' or '-' correspondingly.
	"""
	tmp = random.random()
	if ratio['-'] >= ratio['+']:
		if tmp > ratio['-']:
			return '+'
		else:
			return '-'
	else:
		if tmp > ratio['+']:
			return '-'
		else:
			return '+'


def write_simulation_file(gff_file_name, simulation_name, genome, plant_directory):
	"""
		Read the gene-gff file and write the simulated file at the 
		same time. The strand direction is the same as the original
		file, that is same "+" or "-".
		No return values.
	"""
	gff_file_path = os.path.join(plant_directory, gff_file_name)
	simulation_path = os.path.join(plant_directory, simulation_name)
	ratio = minus_plus_strand_ratio(gff_file_path)
	gff_file = open(gff_file_path)
	simulation = open(simulation_path, 'w')
	for line in gff_file:
		line = line.split()
		gene_len = int(line[4]) - int(line[3])
		chromosome, start_codon = pick_start_coordinates(genome)
		stop_codon = start_codon+gene_len
		while stop_codon>genome[chromosome-1]:
			chromosome, start_codon = pick_start_coordinates(genome)
			stop_codon = start_codon+gene_len

		if plant_directory[8] == 'm': # maize
			# simulation.write('%d\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chromosome,start_codon,stop_codon,line[6])) # minus or plus is the same as the original	
			simulation.write('%d\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chromosome,start_codon,stop_codon,minus_or_plus_strand(ratio))) # minus or plus is random	

		elif plant_directory[8] == 'a': # tair
			chrom = 'Chr'+str(chromosome)
			# simulation.write('%s\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chrom,start_codon,stop_codon,line[6])) # minus or plus is the same as the original
			simulation.write('%s\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chrom,start_codon,stop_codon,minus_or_plus_strand(ratio))) # minus or plus is random	

		elif plant_directory[8] == '9': # rice
			if len(str(chromosome)) < 2:
				chrom = 'Chr0'+str(chromosome)
			else:
				chrom = 'Chr'+str(chromosome)
			# simulation.write('%s\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chrom,start_codon,stop_codon,line[6])) # minus or plus is the same as the original
			simulation.write('%s\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chrom,start_codon,stop_codon,minus_or_plus_strand(ratio))) # minus or plus is random	

		elif plant_directory[8] == 't': # tomato
			if len(str(chromosome)) < 2:
				chrom = 'chr0'+str(chromosome)
			else:
				chrom = 'chr'+str(chromosome)
			# simulation.write('%s\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chrom,start_codon,stop_codon,line[6])) # minus or plus is the same as the original
			simulation.write('%s\tsimulation\tgene\t%d\t%d\t.\t%s\t.\t.\n' % (chrom,start_codon,stop_codon,minus_or_plus_strand(ratio))) # minus or plus is random	


	gff_file.close()
	simulation.close()


def sort_gff_and_rewrite(gff, plant_directory):
	"""
		Given a gff file. Sort the file based on the chromosome first, then
		the start coordiantes of each entry.
		Return the name of the resulting file.
	"""
	gff_path = os.path.join(plant_directory, gff)

	if plant_directory[8] == 'm': # maize
		p = subprocess.Popen(['sort','-k1,1g','-k4,4g', gff_path],stdout=subprocess.PIPE)
	elif plant_directory[8] == 'a': # tair
		p = subprocess.Popen(['sort','-k1,1','-k4,4g', gff_path],stdout=subprocess.PIPE)
	elif plant_directory[8] == '9': # rice
		p = subprocess.Popen(['sort','-k1,1','-k4,4g', gff_path],stdout=subprocess.PIPE)
	elif plant_directory[8] == 't': # tomato
		p = subprocess.Popen(['sort','-k1,1','-k4,4g', gff_path],stdout=subprocess.PIPE)

	sorted_gff = p.communicate()[0]
	f_out_n = 'sorted_'+gff
	f = open(os.path.join(plant_directory, f_out_n),'w')
	f.writelines(sorted_gff)

	return f_out_n

def count_lines(f_name, directory):
	"""
		Same as the command line 'wc -l f'.
		Return the line number.
	"""
	f = os.path.join(directory, f_name)
	p = subprocess.Popen(['wc','-l',f],stdout=subprocess.PIPE)
	n = p.communicate()[0].split()
	n = int(n[0])
	return n

def bedtools_flank(gff, g, m, long, plant_directory):
	"""
		gff_p is the path of the protein-coding gene gff.
		g_p is the genome chromosome size gff.
		m stands for 5'(l) or 3'(r).
		long stands for the number of base pairs from the start/stop codons.
		Write the corresponding file.
		Return the name of the resulting file.
	"""
	gff_p = os.path.join(plant_directory, gff)
	g_p = os.path.join(plant_directory, g)
	f_out_n = str(long)+'_'+m+'_'+gff

	pre = ['bedtools', 'flank', '-i', gff_p, '-g', g_p, '-s']
	if m == 'l':
		suc = ['-l', str(long), '-r', '0']
	else:
		suc = ['-l', '0', '-r', str(long)]

	cmd = pre + suc
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
	
	f_out = open(os.path.join(plant_directory, f_out_n),'w')
	f_out.writelines(p.communicate()[0])

	return f_out_n


def bedtools_intersect(gff, te, plant_directory):
	"""
		gff_p is the path of the intersected gff.
		te_p is the transponson gff.
		Write the corresponding file.
		Return the name of the resulting file.
	"""
	gff_p = os.path.join(plant_directory, gff)
	te_p = os.path.join(plant_directory, te)
	f_out_n = 'itsect_'+gff+'_'+te+'.gff'
	cmd = ['bedtools', 'intersect', '-u', '-wa', '-a', gff_p, '-b', te_p]
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)

	f_out = open(os.path.join(plant_directory,f_out_n),'w')
	f_out.writelines(p.communicate()[0])

	return f_out_n

# The original protein-coding gene gff file is named: tmp1.gff
# The sorted TE gff file is named: tmp2.gff
# These files only contain chromosome information, no UNKNOWN, no organelle

plant, genome_size_n, simul_num = sys.argv[1], sys.argv[2], sys.argv[3]

plant_dir = os.path.join('rawdata', plant)

gff_file_p = os.path.join(plant_dir, 'tmp1.gff')


species_genome_size = construct_genome(genome_size_n, plant_dir)

# count the total number of protein-coding genes
num_genes = count_lines('tmp1.gff', plant_dir) 

res = {}

for _ in range(int(simul_num)):
	write_simulation_file('tmp1.gff', 'simulation.gff', species_genome_size, plant_dir)
	sorted_simulation = sort_gff_and_rewrite('simulation.gff', plant_dir)
	for i in ['l', 'r']:
		for j in [500,1000,2000]:
			bedt_flk = bedtools_flank(sorted_simulation, genome_size_n,i,j,plant_dir)
			bedt_itse = bedtools_intersect(bedt_flk, 'tmp2.gff', plant_dir)
			num_genes_have_te = count_lines(bedt_itse, plant_dir)
			k = str(j)+'_'+i
			if k not in res:
				res[k] = [num_genes_have_te]
			else:
				res[k].append(num_genes_have_te)

for key in res.keys():
	f = open(os.path.join(plant_dir, key+'_random+-'), 'w')
	for n in res[key]:
		f.write('%d\n' % n)
	f.close()



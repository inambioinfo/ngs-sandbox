mkdir -p /resources/dna-seq
cd /resources/dna-seq

samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA19914/exome_alignment/NA19914.mapped.illumina.mosaik.ASW.exome.20111114.bam 22 | samtools view -bS - > NA19914.chr22.bam
samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA19909/exome_alignment/NA19909.mapped.illumina.mosaik.ASW.exome.20111114.bam 22 | samtools view -bS - > NA19909.chr22.bam
samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA19916/exome_alignment/NA19916.mapped.illumina.mosaik.ASW.exome.20111114.bam 22 | samtools view -bS - > NA19916.chr22.bam

samtools index NA19914.chr22.bam
samtools index NA19909.chr22.bam
samtools index NA19916.chr22.bam

bam2fastq --output example.#.fq NA19914.chr22.bam 
head -n 4000000 example._1.fq > sample.fq
include { FASTQC as FASTQC_RAW }  from '../modules/fastqc.nf'
include { FASTQC as FASTQC_TRIM } from '../modules/fastqc.nf'
include { CUTADAPT }              from '../modules/cutadapt.nf'

workflow TRIM_AND_QC {

    Channel
        .fromFilePairs("${params.fastq_dir}/*_R{1,2}_*.fastq.gz", flat: true)
        .set { read_pairs }

    // FastQC on raw reads
    FASTQC_RAW(read_pairs.map{ it[1] }.flatten())

    // Cutadapt
    trimmed_reads = CUTADAPT(read_pairs)

    // FastQC on trimmed reads
    FASTQC_TRIM(trimmed_reads.map{ it[1..2] }.flatten())
}

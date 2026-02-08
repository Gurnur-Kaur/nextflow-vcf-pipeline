include { FASTQC as FASTQC_RAW }   from '../modules/fastqc.nf'
include { FASTQC as FASTQC_TRIM }  from '../modules/fastqc.nf'
include { CUTADAPT }               from '../modules/cutadapt.nf'
include { BWA_ALIGN }              from '../modules/bwa_mem.nf'
include { SAMTOOLS_SORT }          from '../modules/samtools_sort.nf'
include { SAMTOOLS_INDEX }         from '../modules/samtools_index.nf'
include { VARIANT_CALL }           from '../modules/bcftools.nf'

workflow VCF_PIPELINE {

    read_pairs_ch = Channel
        .fromFilePairs("${params.fastq_dir}/*_R{1,2}_*.fastq.gz", flat: true)
        .set { read_pairs }

    FASTQC_RAW(read_pairs) 

    trimmed_ch = CUTADAPT(read_pairs)

    FASTQC_TRIM(trimmed_ch)

    reference_ch  = Channel.value( file(params.reference_fa) )

    bwa_index_ch = Channel.value(file("${params.reference_fa}.*"))

    bam_sam = BWA_ALIGN(
    trimmed_ch,
    reference_ch,
    bwa_index_ch
    )

    bam_sorted = SAMTOOLS_SORT(bam_sam)

    bam_indexed = SAMTOOLS_INDEX(bam_sorted)  

    VARIANT_CALL(bam_indexed, reference_ch)  
}


process CUTADAPT {
    publishDir "${params.outdir}/trimmed", mode: 'copy'

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:
    tuple val(sample_id),
          path("${sample_id}_R1_trimmed.fastq.gz"),
          path("${sample_id}_R2_trimmed.fastq.gz")

    script:
    """
    ${params.cutadapt_bin} \
        -o ${sample_id}_R1_trimmed.fastq.gz \
        -p ${sample_id}_R2_trimmed.fastq.gz \
        ${read1} ${read2}
    """
}

process SAMTOOLS_SORT {
    tag "$sample_id"
    publishDir "${params.outdir}/bam", mode: 'copy'

    input:
    tuple val(sample_id), path(sam_file)

    output:
    tuple val(sample_id), path("${sample_id}.sorted.bam")

    script:
    """
    ${params.samtools_bin} sort \
      -o ${sample_id}.sorted.bam \
      ${sam_file}
    """
}

process SAMTOOLS_INDEX {
    tag "${sample_id}"
    publishDir "${params.outdir}/bams", mode: 'copy'

    input:
    tuple val(sample_id), path(bam_file)

    output:
    tuple val(sample_id), path(bam_file), path("${bam_file}.bai")  // Include BOTH

    script:
    """
    ${params.samtools_bin} index ${bam_file}
    """
}


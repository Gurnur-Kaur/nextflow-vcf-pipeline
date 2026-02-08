process VARIANT_CALL {
    tag "${sample_id}"
    publishDir "${params.outdir}/vcf", mode: 'copy'

    input:
    tuple val(sample_id), path(bam_file), path(bai_file)
    path reference

    output:
    tuple val(sample_id), path("${sample_id}.vcf")

    script:
    """
    ${params.bcftools_bin} mpileup -Ou -f ${reference} ${bam_file} | \\
    ${params.bcftools_bin} call -mv -Ov -o ${sample_id}.vcf
    """
}


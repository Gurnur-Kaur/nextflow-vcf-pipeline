process BWA_ALIGN {
    tag "${sample_id}"
    publishDir "${params.outdir}/alignments", mode: 'copy'

    input:
    tuple val(sample_id), path(r1), path(r2)
    path reference_fa
    path bwa_index_files

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    ${params.bwa_bin} mem \
        ${reference_fa}  \
        ${r1} ${r2} > ${sample_id}.sam
    """
}


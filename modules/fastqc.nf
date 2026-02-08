process FASTQC {
    tag "${sample_id}"
    publishDir "${params.outdir}/fastqc", mode: 'copy'

    input:
    tuple val(sample_id), path(r1), path(r2)  // Match workflow tuples

    output:
    path "*_fastqc.html", emit: html
    path "*_fastqc.zip", emit: zip

    script:
    """
    ${params.fastqc_bin} ${r1} ${r2}
    """
}


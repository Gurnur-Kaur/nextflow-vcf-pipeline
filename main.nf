params.fastq_dir = "$projectDir/data"
params.outdir    = "$projectDir/results"
params.reference_fa = "$projectDir/reference_genome/hg38_chr22.fa"


include { VCF_PIPELINE } from './workflows/workflow.nf'

workflow {
    VCF_PIPELINE()
}

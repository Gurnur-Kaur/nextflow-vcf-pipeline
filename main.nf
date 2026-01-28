
include { TRIM_AND_QC } from './workflows/workflow.nf'

workflow {
    TRIM_AND_QC()
}

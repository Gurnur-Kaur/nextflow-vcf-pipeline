# Nextflow VCF Calling Pipeline (DSL2)

A modular, reproducible Nextflow pipeline for calling genetic variants.

## Academic Origin
**Academic Note:**  
This project was created as part of an academic assignment to demonstrate workflow automation and modular pipeline design.

## Workflow Overview
```
Raw FASTQ files
↓
FastQC (raw reads)
↓
Cutadapt (adapter trimming)
↓
FastQC (trimmed reads)
↓
BWA-MEM alignment
↓
SAMtools sort → BAM
↓
SAMtools index (.bai)
↓
BCFtools mpileup + call → VCF
```

## Features
- ✅ Fully modular DSL2 structure
- ✅ Automatic Conda environment (`environment.yml`)
- ✅ Resumable (`-resume`)
- ✅ Comprehensive QC (pre/post trimming)
- ✅ Reproducible versions

## Repository Structure
```
├── README.md
├── .gitignore  
├── environment.yml
├── main.nf
├── modules
│   ├── bcftools.nf
│   ├── bwa_mem.nf
│   ├── cutadapt.nf
│   ├── fastqc.nf
│   ├── samtools_index.nf
│   └── samtools_sort.nf
├── nextflow.config
└── workflows
    └── workflow.nf
```

## Requirements
- Nextflow ≥ 24.10
- Conda/Mamba
- Paired-end FASTQ (`*_R{1,2}_*.fastq.gz`)
- Reference genome (FASTA + BWA indices)

### Tools automatically installed via Conda (bioconda):**

- **FastQC** 0.12.1 - Quality control
- **Cutadapt** 5.2 - Adapter trimming  
- **BWA** 0.7.17 - Alignment
- **Samtools** 1.20 - BAM/SAM processing
- **BCFtools** 1.20 - Variant calling


## Quick Start

### Clone Repository
```bash
git clone https://github.com/Gurnur-Kaur/nextflow-vcf-pipeline.git
cd nextflow-vcf-pipeline
```

### Conda env
```bash
conda env create -f environment.yml
conda activate bnf
```

### Place files
```
data/
├── sample_R1.fastq.gz
└── sample_R2.fastq.gz
reference_genome/
└── hg38_chr22.fa + indices
```

### Run

```bash
nextflow run main.nf \
  --reads data \
  --genome reference_genome/hg38_chr22.fa \
  --outdir results \
```
  
### Output Structure
```
results/
├── fastqc/          # QC HTML/ZIP
├── trimmed/         # Clean FASTQ
├── alignments/      # SAM files
├── bams/            # Sorted BAM + .bai
└── vcf/             # Final VCFs
```

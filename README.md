# Nextflow Pipeline: FastQC and Cutadapt

## Overview
This repository contains a modular **Nextflow DSL2 pipeline** developed for basic NGS data quality control and preprocessing.

The pipeline performs:
1. Quality control of raw FASTQ files using **FastQC**
2. Adapter and quality trimming using **Cutadapt**
3. Quality control of trimmed reads using **FastQC**

This project was created as part of an academic assignment to demonstrate workflow automation, modular pipeline design, and reproducible bioinformatics analysis using Nextflow.

---

## Requirements
- Nextflow (>= 22.0)
- Java (>= 11)
- FastQC
- Cutadapt

> Tools can be installed via Conda or Docker if configured in `nextflow.config`.


## Project Structure

```
nextflow_pipeline/
├── main.nf
├── nextflow.config
├── workflows/
│   └── workflow.nf
├── modules/
│   ├── fastqc.nf
│   └── cutadapt.nf
├── data/
│   └── *.fastq.gz
├── results/
└── .gitignore
```


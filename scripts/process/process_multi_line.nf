//process_multi_line.nf
nextflow.enable.dsl=2

params.bam_file = "${launchDir}/data/yeast/bams/ref1.bam"


process PROCESSBAM {

    container 'quay.io/biocontainers/samtools:1.16.1--h6899075_1'

    input:
    path bamfile

    script:
    """
    samtools sort -o ref1.sorted.bam $bamfile
    samtools index ref1.sorted.bam
    samtools flagstat ref1.sorted.bam
    """
}

workflow {
  PROCESSBAM(params.bam_file)
}

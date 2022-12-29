nextflow.enable.dsl=2

params.fastq_file = "${launchDir}/data/yeast/reads/ref1_1.fq.gz"

process RSTUFF {

  container 'quay.io/biocontainers/bioconductor-shortread:1.56.0--r42hc247a5b_0'

  input:
  path fastq_file

  script:
  """
  #!/usr/bin/env Rscript
  library("ShortRead")
  countFastq(dirPath="$fastq_file")
  """
}

workflow {
  RSTUFF(params.fastq_file)
}

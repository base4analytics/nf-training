nextflow.enable.dsl=2

process SALMON_VERSION {

  //container 'nextflow/rnaseq-nf'
  container 'quay.io/biocontainers/salmon:1.9.0--h7e5ed60_1'

  script:
  """
  ls
  salmon --version
  """
}

workflow {
  SALMON_VERSION()
}
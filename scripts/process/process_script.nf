//process_script.nf
nextflow.enable.dsl=2

params.kmer = 31

params.transcriptome_file = "$launchDir/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"

process INDEX {

  //container 'nextflow/rnaseq-nf'
  container 'quay.io/biocontainers/salmon:1.9.0--h7e5ed60_1'

  input:
  path transcriptome

  script:
  """
  salmon index  \
  -t  $transcriptome \
  -i index \
  --kmer $params.kmer
  echo "kmer size is $params.kmer"
  """
}

workflow {
  INDEX(params.transcriptome_file)
}

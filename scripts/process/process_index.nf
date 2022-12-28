nextflow.enable.dsl=2

params.transcriptome_file = "$launchDir/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"
params.outdir = "results"

process INDEX {
  publishDir "$launchDir/output/indices", mode: 'copy'
  
  input:
  path transcriptome

  output:
  path 'salmon_index'

//  salmon index --threads $task.cpus -t $transcriptome -i salmon_index
  script:
  """
  salmon index -t $transcriptome -i salmon_index --kmerLen 31
  """

}

workflow {
  //process is called like a function in the workflow block
  index_ch = INDEX(params.transcriptome_file)
}

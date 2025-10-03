include {FASTQC} from './modules/fastqc'
include { GTF_EXTRACT } from './modules/gtf_extract'
include { STAR } from './modules/star'

workflow {

    Channel.fromFilePairs(params.reads)
    | set { align_ch }

    fastqc_channel = align_ch
        .flatMap { sample_id, reads -> reads.collect { read -> tuple(sample_id, read)}}

    FASTQC(fastqc_channel)

    GTF_EXTRACT(params.gtf)
    STAR(params.genome, params.gtf)
}

import os

rule run_index:
    input:
        fasta=lambda wildcards: os.path.join(wildcards.genomepath, config['config']['star']['genomes'][wildcards.genome]['fasta']),
        gtf=lambda wildcards: os.path.join(wildcards.genomepath, config['config']['star']['genomes'][wildcards.genome]['gtf'])
    output:
        directory("{genomepath}/{genome}_index")
    threads:
        16
    params:
        extra=lambda wildcards: "--outTmpDir {genomepath}/{genome}_index/STARtmp".format(genomepath=wildcards.genomepath, genome=wildcards.genome),
        sjdbOverhang=lambda wildcards: config['config']['star']['genomes'][wildcards.genome]['sjdbOverhang']
    log:
        "{genomepath}/star_index_{genome}.log"
    wrapper:
        "0.74.0/bio/star/index"






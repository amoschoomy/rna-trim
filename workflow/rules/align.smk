rule align:
    input:
        fq1=rules.trim.output['r1'],
        fq2=rules.trim.output['r2']
    output:
        log="results/{sample}/{conf}/Log.final.out",
        bam=temp("results/{sample}/{conf}/Aligned.out.bam")
    log:
        "logs/{sample}/{conf}/star.log"
    message:
        "Aligning sample {wildcards.sample} / {wildcards.conf}"
    params:
        # path to STAR reference genome index
        index=lambda wildcards: star_index_path(wildcards.sample),
        # optional parameters
        extra=lambda wildcards: get_star_config(wildcards.sample, wildcards.conf)
    threads:
        16
    wrapper:
        "0.74.0/bio/star/align"

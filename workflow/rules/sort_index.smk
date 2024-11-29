rule sort_cram:
    input:
        rules.align.output['bam']
    output:
        "results/{sample}/{conf}/{conf}.sorted.cram"
    params:
        extra = lambda wildcards: "-O CRAM --reference " + star_genome(wildcards.sample),
        tmp_dir = directory(os.getenv("TMPDIR", "/tmp/"))  # Default to "/tmp/" if TMP_DIR is not set
    threads:
        8
    wrapper:
        "0.74.0/bio/samtools/sort"

rule index_cram:
    input:
        rules.sort_cram.output
    output:
        "results/{sample}/{conf}/{conf}.sorted.cram.crai"
    params:
        "-@ 16"
    wrapper:
        "0.74.0/bio/samtools/index"

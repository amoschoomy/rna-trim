#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --job-name=trim
#SBATCH --time=48:00:00
#SBATCH --partition=general
#SBATCH --account=a_kelvin_tuong
#SBATCH -e trim.error
#SBATCH -o trim.out
#SBATCH --verbose

module purge
module load fastqc/0.11.9
module load trimmomatic/0.39
source rna/bin/activate

snakemake -s workflow/rules/Snakefile_trim.smk --rerun-incomplete --nolock --jobs 1 all 
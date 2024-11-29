#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --job-name=star
#SBATCH --time=24:00:00
#SBATCH --partition=general
#SBATCH --account=a_kelvin_tuong
#SBATCH -e star.error
#SBATCH -o star.out


source rna/bin/activate
module load star/2.7.9a

# # Run Snakemake
snakemake -s workflow/rules/Snakefile_index.smk --nolock --cores 1 -d . all

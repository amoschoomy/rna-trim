#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --job-name=align
#SBATCH --time=124:00:00
#SBATCH --partition=general
#SBATCH --account=a_kelvin_tuong
#SBATCH -e align.error
#SBATCH -o align.out
#SBATCH --verbose
#SBATCH --constraint=epyc4

module purge
module load trimmomatic/0.39
module load star/2.7.9a
module load samtools
module load bedtools/2.30.0
module load r
module load htslib/1.12
module load tabixpp

source /scratch/user/uqachoo1/miniforge3/etc/profile.d/conda.sh  # Ensure Conda is properly initialized
conda activate kl  # Activate the Conda environment
source rna/bin/activate

snakemake -s workflow/rules/Snakefile_align.smk --nolock --jobs 1 --printshellcmds all -n

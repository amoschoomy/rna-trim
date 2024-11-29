#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --job-name=move
#SBATCH --time=48:00:00
#SBATCH --partition=general
#SBATCH --account=a_kelvin_tuong
#SBATCH -e move.error
#SBATCH -o move.out

rsync -av --progress /scratch/project/tcr_ml/rna-seq2/trimmed /QRISdata/Q7444/results_align
rsync -av --progress /scratch/project/tcr_ml/rna-seq2/results /QRISdata/Q7444/results_align

#!/bin/sh
#SBATCH --part=cpu
#SBATCH --time=12:00:00
#SBATCH --mem=64G

export PYTHONUNBUFFERED=TRUE
export PYTHONPATH='/nemo/stp/ddt/working/rossg/CLAM'
ml purge
ml Anaconda3/2020.07
source /camp/apps/eb/software/Anaconda3/2020.07/etc/profile.d/conda.sh
conda activate /camp/stp/ddt/working/rossg/conda/envs/clam
python ../create_patches_fp.py --source /camp/stp/ddt/working/HEimages/TCGA_KIRC_links --save_dir /camp/stp/ddt/working/rossg/CLAM_data/patches/tcga_patches_112um --patch_size 448 --seg --patch 
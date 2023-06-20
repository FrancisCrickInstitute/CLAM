#!/bin/sh
#SBATCH --part=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=5-00:00:00
#SBATCH --mem=64G

export PYTHONUNBUFFERED=TRUE
export PYTHONPATH='/nemo/stp/ddt/working/rossg/CLAM'
ml purge
ml Anaconda3/2020.07
source /camp/apps/eb/software/Anaconda3/2020.07/etc/profile.d/conda.sh
conda activate /camp/stp/ddt/working/rossg/conda/envs/clam
CUDA_VISIBLE_DEVICES=0 python ../extract_features_fp.py --data_h5_dir ../CLAM_data/patches/tcga_patches_256um --data_slide_dir ../../HEimages/TCGA_KIRC_links --csv_path dataset_csv/tcga_labels.csv --feat_dir ../CLAM_data/features/tcga_features_256um_512px --batch_size 256 --slide_ext .svs
#!/bin/sh
#SBATCH --part=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=10-00:00:00
#SBATCH --mem=64G

rootdir='/nemo/stp/ddt/working/rossg/CLAM'

export PYTHONUNBUFFERED=TRUE
export PYTHONPATH=$rootdir
ml purge
ml Anaconda3/2020.07
source /camp/apps/eb/software/Anaconda3/2020.07/etc/profile.d/conda.sh
conda activate /nemo/stp/ddt/working/rossg/conda/envs/clam
CUDA_VISIBLE_DEVICES=0 python $rootdir/extract_features_fp.py --data_h5_dir /nemo/stp/ddt/working/rossg/CLAM_data/patches/tcga_patches_256um --data_slide_dir /nemo/stp/ddt/working/HEimages/TCGA_KIRC_links --csv_path dataset_csv/tcga_labels.csv --feat_dir /nemo/stp/ddt/working/rossg/CLAM_data/features/tcga_features_256um_512px --batch_size 256 --slide_ext .svs
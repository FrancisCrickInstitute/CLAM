#!/bin/sh
#SBATCH --part=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=1-00:00:00
#SBATCH --mem=64G

rootdir='/nemo/stp/ddt/working/rossg/CLAM'

export PYTHONUNBUFFERED=TRUE
export PYTHONPATH=$rootdir
ml purge
ml Anaconda3/2020.07
source /camp/apps/eb/software/Anaconda3/2020.07/etc/profile.d/conda.sh
conda activate /nemo/stp/ddt/working/rossg/conda/envs/clam
CUDA_VISIBLE_DEVICES=0 python $rootdir/eval.py --drop_out --k 1 --models_exp_code wsi_pbrm1_256um_224px_s1 --save_exp_code pbrm1_wsi_256um_224px_s1_cv --task pbrm1_classification_wsi --split test --model_type clam_sb --results_dir results --data_root_dir /nemo/stp/ddt/working/rossg/CLAM_data/features --dataset wsi_features_256um_224px_imagenet
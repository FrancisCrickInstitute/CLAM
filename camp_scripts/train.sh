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
CUDA_VISIBLE_DEVICES=0 python ../main.py --drop_out --early_stopping --lr 2e-4 --k 1 --label_frac 1 --exp_code pbrm1_wsi_256um_512px --weighted_sample --bag_loss ce --inst_loss svm --task pbrm1_classification_wsi --model_type clam_sb --log_data --subtyping --data_root_dir /nemo/stp/ddt/working/rossg/CLAM_data/features/ --dataset wsi_features_256um_512px
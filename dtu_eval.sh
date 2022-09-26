DATASET_ROOT="/media/nate/Data/DTU/"

# Task name
CKPT_DIR=/media/nate/Data/MVS/NP-CVP-MVSNet/dtu/models/
CKPT_NAME="model_000006.ckpt"

# Checkpoint
LOAD_CKPT_DIR="${CKPT_DIR}${CKPT_NAME}"

# Output dir
OUT_DIR=/media/nate/Data/Results/NP-CVP-MVSNet/dtu/Output/

CUDA_VISIBLE_DEVICES=0 python eval.py \
\
--info=$TASK_NAME \
--mode="test" \
\
--dataset="dtu" \
--dataset_root=$DATASET_ROOT \
--scene_list=./dataset/dtu/scan_list_all.txt \
--imgsize=1200 \
--depth_h=1152 \
--depth_w=1600 \
--vselection="mvsnet" \
--nsrc=10 \
--nbadsrc=0 \
--nscale=4 \
--gtdepth=1 \
--eval_precision=32 \
--feature_ch 8 16 32 64 \
--gwc_groups 2 4 4 8 \
--target_d 8 16 32 48 \
\
--init_search_mode='uniform' \
--costmetric='gwc_weighted_sum' \
\
--batch_size=1 \
\
--loadckpt=$LOAD_CKPT_DIR \
--logckptdir=$CKPT_DIR \
\
--outdir=$OUT_DIR

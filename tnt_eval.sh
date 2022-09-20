DATASET_ROOT="/media/nate/Data/TNT/intermediate/"

# Task name
CKPT_DIR=/media/nate/Data/MVS/NP-CVP-MVSNet/dtu/models/
CKPT_NAME="model_000006.ckpt"

# Checkpoint
LOAD_CKPT_DIR="${CKPT_DIR}${CKPT_NAME}"

# Output dir
OUT_DIR=/media/nate/Data/Results/NP-CVP-MVSNet/tnt/Output_intermediate/

CUDA_VISIBLE_DEVICES=0 python eval.py \
\
--info=$TASK_NAME \
--mode="test" \
\
--dataset="tanks" \
--dataset_root=$DATASET_ROOT \
--scan_list=./dataset/tnt/intermediate_list.txt \
--imgsize=1080 \
--depth_h=1056 \
--depth_w=1920 \
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

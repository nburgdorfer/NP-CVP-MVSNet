#!/bin/bash

DATASET=training
#DATASET=intermediate
#DATASET=advanced

#TRAINING_SET=dtu
TRAINING_SET=blended_mvs

DATASET_ROOT="/media/nate/Data/TNT/${DATASET}/"

# Task name
CKPT_DIR=/media/nate/Data/MVS/NP-CVP-MVSNet/${TRAINING_SET}/models/
CKPT_NAME="model.ckpt"

# Checkpoint
LOAD_CKPT_DIR="${CKPT_DIR}${CKPT_NAME}"

# Output dir
OUT_DIR=/media/nate/Data/Results/NP-CVP-MVSNet/tnt/Output_${DATASET}/

CUDA_VISIBLE_DEVICES=0 python eval.py \
\
--info=$TASK_NAME \
--mode="test" \
\
--dataset="tanks" \
--dataset_root=$DATASET_ROOT \
--scene_list=./dataset/tnt/${DATASET}_list.txt \
--imgsize=1080 \
--depth_h=1056 \
--depth_w=1920 \
--vselection="mvsnet" \
--nsrc=10 \
--nbadsrc=0 \
--nscale=3 \
--gtdepth=1 \
--eval_precision=32 \
--feature_ch 8 16 32 \
--gwc_groups 2 4 8 \
--target_d 8 16 48 \
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

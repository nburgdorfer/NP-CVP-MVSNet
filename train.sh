set -x; set -e;

TASK_NAME="np-cvp-mvsnet"
DTU_HIGHRES_TRAIN_PATH="/media/Data/nate/DTU/"

CKPT_DIR="./ckpts/"
mkdir -p $CKPT_DIR

python -m torch.distributed.launch --nnodes 1 --node_rank 0 --nproc_per_node 1 train.py \
\
--info="${TASK_NAME}" \
--mode="train" \
\
--dataset=dtu \
--dataset_root=$DTU_HIGHRES_TRAIN_PATH \
--scene_list=./dataset/dtu/scan_list_train.txt \
--imgsize=512 \
--vselection="mvsnet" \
--nsrc=2 \
--nbadsrc=2 \
--nscale=4 \
--gtdepth=1 \
--feature_ch 8 16 32 64 \
--gwc_groups 2 4 4 8 \
--target_d 8 16 32 48 \
\
--init_search_mode='uniform' \
--costmetric='gwc_weighted_sum' \
\
--epochs=27 \
--lr=0.001 \
--lrepochs="10,12,14,20:2" \
--wd=0.0 \
--batch_size=2 \
--summary_freq=1 \
--save_freq=1 \
--seed=1 \
--loss_function='BCE' \
--activate_level_itr 0 0 0 0 \
--final_edge_mask=1 \
--final_weight=0.1 \
--final_continue=1 \
--loadckpt="ckpts/np-cvp-mvsnet/model_000006.ckpt" \
--resume=1 \
\
--logckptdir=$CKPT_DIR

#!/bin/bash

TNT_TEST_ROOT="/media/nate/Data/TNT/training/"
DEPTH_FOLDER="/media/nate/Data/Results/NP-CVP-MVSNet/tnt/Output/"
OUT_FOLDER="/media/nate/Data/Results/NP-CVP-MVSNet/tnt/Output_fused/"
FUSIBILE_EXE_PATH="./fusibile"
SCENE_LIST=../dataset/tnt/training_list.txt

fusion() {
	python depthfusion.py \
	--dtu_test_root=$TNT_TEST_ROOT \
	--depth_folder=$DEPTH_FOLDER \
	--scene_list=${SCENE} \
	--out_folder=$OUT_FOLDER \
	--fusibile_exe_path=$FUSIBILE_EXE_PATH \
	--dataset=tnt \
	--prob_threshold=0.8 \
	--disp_threshold=0.5 \
	--num_consistent=3 \
	--image_height=1024
}

fusion

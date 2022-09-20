#!/bin/bash

DTU_TEST_ROOT="/media/nate/Data/DTU/"
DEPTH_FOLDER="/media/nate/Data/Results/NP-CVP-MVSNet/dtu/Output/"
OUT_FOLDER="/media/nate/Data/Results/NP-CVP-MVSNet/dtu/Output_fused/"
FUSIBILE_EXE_PATH="./fusibile"
SCENE_LIST=../dataset/dtu/scan_list.txt


fusion() {
	python depthfusion.py \
	--dtu_test_root=$DTU_TEST_ROOT \
	--depth_folder=$DEPTH_FOLDER \
	--scene_list=${SCENE_LIST} \
	--out_folder=$OUT_FOLDER \
	--fusibile_exe_path=$FUSIBILE_EXE_PATH \
	--prob_threshold=0.8 \
	--disp_threshold=0.5 \
	--num_consistent=3 \
	--image_height=1200
}

fusion

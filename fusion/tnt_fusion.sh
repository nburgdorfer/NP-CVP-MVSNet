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
	--scene=${1} \
	--out_folder=$OUT_FOLDER \
	--fusibile_exe_path=$FUSIBILE_EXE_PATH \
	--dataset=tnt \
	--prob_threshold=0.8 \
	--disp_threshold=${2} \
	--num_consistent=${3} \
	--image_height=1024
}


SCENES=(Barn Caterpillar Church Courthouse Ignatius Meetingroom Truck)
DISP_TH=(1.5 0.8 0.8 0.8 0.8 0.8 0.8)
NUM_CONSIST=(3 3 3 3 3 3 3)
i=0

for SCENE in ${SCENES[@]}
do
	fusion ${SCENE} ${DISP_TH[$i]} ${NUM_CONSIST[$i]}
	exit 0;
done

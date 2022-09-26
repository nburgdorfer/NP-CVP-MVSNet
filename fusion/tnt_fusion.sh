#!/bin/bash

#DATASET=training
DATASET=intermediate

TNT_TEST_ROOT="/media/Data/nate/TNT/${DATASET}/"
DEPTH_FOLDER="/media/Data/nate/Results/NP-CVP-MVSNet/tnt/Output_${DATASET}/"
OUT_FOLDER="/media/Data/nate/Results/NP-CVP-MVSNet/tnt/Output_${DATASET}_fused/"
FUSIBILE_EXE_PATH="./fusibile"
SCENE_LIST=../dataset/tnt/${DATASET}_list.txt

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
	--image_height=1080
}


#	SCENES=(Barn Caterpillar Ignatius Truck)
#	DISP_TH=(0.5 0.5 0.5 0.5)
#	NUM_CONSIST=(3 3 3 3)

SCENES=(Horse)
DISP_TH=(25)
NUM_CONSIST=(0)
i=0

for SCENE in ${SCENES[@]}
do
	fusion ${SCENE} ${DISP_TH[$i]} ${NUM_CONSIST[$i]}
	exit 0;
done

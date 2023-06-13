# test
python ../src/visualize.py ctdet \
--exp_id coco_resdcn18_visulization \
--arch resdcn_18 \
--gpus 0 \
--not_rand_crop \
--no_color_aug \
--flip 0. \
--prefix 'keep1_' \
--sim_thresh 0.9 \
--use_plg \
--ret_copy \
--keep_res \
--vis_prefix "vis_thr09" \
--visualize_path "" \
--anno_path "" \
--load_model "" \

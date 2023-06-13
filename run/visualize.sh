# predition
model="fsod_res18"
# model="siod_res18_plg_gcl"
python ./src/demo.py ctdet \
--arch resdcn_18 \
--demo "./example/$model/" \
--demo_save_name "$model" \
--load_model "./exp/ctdet/$model/model_last.pth"
# visualize
python ./src/utils/visualizer.py \
--imgs_path "./example/$model/" \
--result_file "./example/detect_result/$model.json" \
--prefix "keep1_" \
--thresh 0.25 \

**Gal-SIOD**
========

## Installation
Create a Python 3.8 environement with CUDA 11.1.1 and GCC 9.3.0.
```
1. pip install -r requirements.txt 
2. install pytorch=1.7.0 (higher version has some problems in following installation of dcnv2) 
3. install dcnv2
   cd src/lib/models/networks/DCNv2
   sh make.sh 
4. install cocoapi
   cd src/lib/datasets/dataset/cocoapi/
   sh install.sh 
5. install nms
   cd src/lib/external
   make 
6. create soft link for the data
   vim link.sh
   sh link.sh 
```

## Data preparation

Download and extract RadioGalaxyNET data from the link described in the datasheet.
We expect the directory structure to be the following:
```
./data/coco/
  annotations/  # annotation json files
      annotations/train.json
      annotations/val.json
  train/    # train images
  val/      # val images
```

Download 'keep1_train.json' from this [link]() and place it in './data/coco/annotations/' along with 'train.json' and 'val.json' files.

## Training 

Train base model using single gpu:
```
CUDA_VISIBLE_DEVICES=0 python ./src/main.py ctdet --exp_id fsod_res18 --arch resdcn_18 --save_all --batch_size 8 --num_epochs 200 --master_batch 18 --lr 5e-4 --gpus 0 --num_workers 16 --prefix 'keep1_'
```
To ease reproduction of our results we provide base model checkpoint [here](https://figshare.com/s/fef23f55c373b55e82d7). 
Place the model in `./exp/ctdet/fsod_res18/` directory.

Train with DMiner:
```
CUDA_VISIBLE_DEVICES=0 python ./src/main.py ctdet --exp_id siod_res18_plg_gcl --arch resdcn_18 --save_all --batch_size 8 --num_epochs 200 --master_batch 18 --lr 5e-4 --gpus 0 --num_workers 16 --prefix 'keep1_' --use_gcl --use_plg
```
To ease reproduction of our results we provide dminer model checkpoint [here](). 
Place the model in `./exp/ctdet/siod_res18_plg_gcl/` directory.

## Evaluation 

To evaluate on val images with a single GPU with new Score-aware Detection Evaluation Protocol, run:

Base model:
```
python ./src/test.py ctdet --exp_id fsod_res18_eval --arch resdcn_18 --keep_res --load_model './exp/ctdet/fsod_res18/model_last.pth' --resume
```

DMiner model:
```
python ./src/test.py ctdet --exp_id siod_res18_dminer --arch resdcn_18 --keep_res --load_model './exp/ctdet/siod_res18_plg_gcl/model_last.pth' --resume
```

## License
The License will be updated after publication. Note that the SIOD is released under the MIT license.

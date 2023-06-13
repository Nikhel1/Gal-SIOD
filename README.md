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
./RadioGalaxyNET/
  annotations/  # annotation json files
  train/    # train images
  val/      # val images
  test/     # test images
```

## [Dataset](https://drive.google.com/drive/folders/1mJayvvNkmvur7IOG17-hz3AHQ2yPWfUf) 

- Keep1_COCO2017_Train: **keep1_instances_train2017.json**

- Semi-supervised annotation which has equivalent instance annotations to Keep1_COCO2017_Train: **mark_semi_instances_train2017.json**. (For Table 2)

  We add a new field("keep") to the image infomation in annotation file, where keep=1 indicates the image belongs to labeled part and keep=0 indicates the image belongs to  unlabeled part.

## Training 

Take CenterNet-Res18 for example:

- Directly train the centernet under SIOD setup.

  ```shell
  sh base_resdcn18_train.sh
  ```

- Train the centernet equipped with SPLG or PGCL.

  ```
  # SPLG
  sh plg_resdcn18_train.sh
  # PGCL 
  gcl_resdcn18_train.sh
  ```

- Train the centernet equipped with DMiner.

  ```
  dminer_resdcn18_train.sh
  or 
  all_resdcn18_train.sh
  ```

## Evaluation 

Evaluate the detector with new Score-aware Detection Evaluation Protocol.

```
# modify the parameter "load_model" accordingly
sh test_resdcn18.sh
```

## Visualization 

Prepare some images and modified visualize.sh accordingly. 

```
sh visualize.sh
```


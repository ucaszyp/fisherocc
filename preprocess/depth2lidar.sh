set -e
exeFunc(){
    num_seq=$1
    python utils/depth2lidar.py --calib_dir  /home/DISCOVER/zyp/Surround_scene/VoxFormer/kitti/dataset/sequences/$num_seq \
    --depth_dir /home/DISCOVER/zyp/Surround_scene/VoxFormer/preprocess/mobilestereonet/depth/sequences/$num_seq \
    --save_dir /home/DISCOVER/zyp/Surround_scene/VoxFormer/preprocess/mobilestereonet/lidar/sequences/$num_seq

    cp data_odometry_calib/sequences/$num_seq/calib.txt /home/DISCOVER/zyp/Surround_scene/VoxFormer/preprocess/mobilestereonet/lidar/sequences/$num_seq/
    cp data_odometry_calib/sequences/$num_seq/poses.txt /home/DISCOVER/zyp/Surround_scene/VoxFormer/preprocess/mobilestereonet/lidar/sequences/$num_seq/
}
# Change data_path to your own specified path
# And make sure there is enough space under data_path to store the generated data
# data_path=/mnt/NAS/data/yiming/segformer3d_data
# data_path=

# mkdir -p $data_path/lidar
# ln -s $data_path/lidar ./mobilestereonet/lidar
for i in {00..21}
do
    exeFunc $i
done

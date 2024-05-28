model_path="output/train_flow/2024-05-23-15-29-10/epoch_19999.pth"
dataroot="datasets/ShapeNetCore.v2.PC15k/"
category="car"
workers=16
dist="single"
it=20001
batch_size=128
python3 sample_flow.py --model "$model_path" \
              	      --category "$category" \
                      --dataroot "$dataroot" \
                      --workers "$workers" \
                      --niter "$it" \
		      --bs "$batch_size" \
                      --distribution_type $dist

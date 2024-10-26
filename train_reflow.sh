dataroot="datasets/ShapeNetCore.v2.PC15k/"

model_path="output/train_flow/2024-05-23-15-29-10/epoch_19999.pth"

category="car"
batch_size=128
workers=16
nEpochs=10000
dist="single"

save_epoch=1
viz_epoch=1
diag_epoch=1
print_freq=1000

python3 train_reflow.py --category "$category" \
		            --model "$model_path" \
                    --dataroot "$dataroot" \
                    --batch_size $batch_size \
                    --workers $workers \
                    --nEpochs $nEpochs \
                    --distribution_type $dist \
                    --saveEpoch $save_epoch \
                    --diagEpoch $diag_epoch \
                    --vizEpoch $viz_epoch \
                    --printFreqIter $print_freq

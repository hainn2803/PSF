dataroot="datasets/ShapeNetCore.v2.PC15k/"

model_path="ckp_reflow_999.pth"

category="car"
batch_size=8
workers=8
nEpochs=10
dist="multi"

save_epoch=1
viz_epoch=1
diag_epoch=1
print_freq=1000

python3 train_distill.py --category "$category" \
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

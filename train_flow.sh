dataroot="datasets/ShapeNetCore.v2.PC15k/"
category="car"
batch_size=2
workers=2
nepoch=5
dist="single"
save_epoch=1
viz_epoch=1
diag_epoch=1
print_freq=1000
python3 train_flow.py --category "$category" \
                    --dataroot "$dataroot" \
                    --batch_size $batch_size \
                    --workers $workers \
                    --nEpochs $nepoch \
                    --distribution_type $dist \
                    --saveEpoch $save_epoch \
                    --diagEpoch $diag_epoch \
                    --vizEpoch $viz_epoch \
                    --printFreqIter $print_freq

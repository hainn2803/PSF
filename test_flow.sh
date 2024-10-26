dataroot="datasets/ShapeNetCore.v2.PC15k/"
category="car"
batch_size=128
workers=16
nEpochs=10000
model_type="distill"
step=20
python3 test_flow.py --category "$category" \
                    --dataroot "$dataroot" \
                    --batch_size $batch_size \
                    --workers $workers \
                    --nEpochs $nEpochs \
                    --model $model_type \
                    --step $step
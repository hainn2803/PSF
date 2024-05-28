dataroot="datasets/ShapeNetCore.v2.PC15k/"
category="car"
bs=128
workers=16
niter=10000
model_type="distill"
step=20
python3 test_flow.py --category "$category" \
                    --dataroot "$dataroot" \
                    --bs $bs \
                    --workers $workers \
                    --niter $niter \
                    --model $model_type \
                    --step $step
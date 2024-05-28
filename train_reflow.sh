dataroot="datasets/ShapeNetCore.v2.PC15k/"
model_path="output/train_flow/2024-05-23-15-29-10/epoch_19999.pth"
category="car"
bs=128
workers=16
niter=30000
dist="single"
save_iter=500
viz_iter=500
python3 train_reflow.py --category "$category" \
		    --model "$model_path" \
                    --dataroot "$dataroot" \
                    --bs $bs \
                    --workers $workers \
                    --niter $niter \
                    --distribution_type $dist \
                    --saveIter $save_iter \
                    --vizIter $viz_iter

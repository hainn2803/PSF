dataroot="datasets/ShapeNetCore.v2.PC15k/"
model_path="output/train_reflow/2024-05-29-01-30-04/epoch_999.pth"
category="car"
bs=128
workers=16
niter=10000
dist="single"
save_iter=100
viz_iter=100
python3 train_distill.py --category "$category" \
		    --model "$model_path" \
                    --dataroot "$dataroot" \
                    --bs $bs \
                    --workers $workers \
                    --niter $niter \
                    --distribution_type $dist \
                    --saveIter $save_iter \
                    --vizIter $viz_iter

dataroot="datasets/ShapeNetCore.v2.PC15k/"
category="car"
bs=128
workers=16
niter=20000
dist="single"
save_iter=500
viz_iter=500
python3 train_flow.py --category "$category" \
                    --dataroot "$dataroot" \
                    --bs $bs \
                    --workers $workers \
                    --niter $niter \
		    --distribution_type $dist \
		    --saveIter $save_iter \
		    --vizIter $viz_iter

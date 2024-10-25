dataroot="datasets/ShapeNetCore.v2.PC15k/"
model_path="ckp_reflow_999.pth"
category="car"
bs=8
workers=8
niter=10000
dist="single"
save_iter=100
viz_iter=100
CONDA_VISIBLE_DEVICES=0,3 python3 train_distill.py --category "$category" \
                                                        --model "$model_path" \
                                                        --dataroot "$dataroot" \
                                                        --bs $bs \
                                                        --workers $workers \
                                                        --niter $niter \
                                                        --distribution_type $dist \
                                                        --saveIter $save_iter \
                                                        --vizIter $viz_iter
